import 'package:book_your_taxi/common/common_text_form_filled.dart';
import 'package:book_your_taxi/controller/home_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class HomeScreenTopWidget extends StatelessWidget {
  final HomeController controller;
  const HomeScreenTopWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CommonMapTextFormFilled(
            onTap: () {
              controller.onTapSearchAddress(context);
            },
            hintText: 'Enter your location',
            controller: controller.searchController.value,
            suffixIcon: Icons.bookmark_add_outlined,
            onTapSuffixIcon: () {
              controller.onTapSavedPlaces(context);
            },
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 200,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: ColorConstant.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 4,
                  width: 120,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Where to?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    'MANAGE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.appColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  itemCount: controller.whereToGoList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = controller.whereToGoList[index];
                    return HomeScreenWhereToWidget(
                      icon: data['icon'],
                      title: data['title'],
                      subTitle: data['subTitle'],
                      selectedIndex: controller.selectedIndex.value,
                      index: index,
                      onTap: () {
                        controller.selectedIndex.value = index;
                        controller.onTapWhereToGoTab(index,context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeScreenWhereToWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int selectedIndex;
  final int index;
  final IconData icon;
  final String title;
  final String subTitle;
  const HomeScreenWhereToWidget({
    super.key,
    required this.onTap,
    required this.selectedIndex,
    required this.index,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 140,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? ColorConstant.appColor
              : ColorConstant.lightGreyColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedIndex == index
                    ? ColorConstant.whiteColor
                    : ColorConstant.blackColor,
              ),
              child: Icon(
                icon,
                color: selectedIndex == index
                    ? ColorConstant.appColor
                    : ColorConstant.whiteColor,
                size: 30,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                color: selectedIndex == index
                    ? ColorConstant.whiteColor
                    : ColorConstant.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: selectedIndex == index
                    ? ColorConstant.whiteColor.withValues(alpha: 0.7)
                    : ColorConstant.blackColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
