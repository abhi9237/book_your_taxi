import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/color_constant/color_constant.dart';

class DriverDetailReviewFilterTabViewWidget extends StatelessWidget {
  const DriverDetailReviewFilterTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 0, left: 10, right: 10),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 120,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConstant.appColor,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jenny Wilson',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '11 months ago',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstant.lightGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit auctor dui, sed efficitur ipsum.',
                style: TextStyle(
                  color: ColorConstant.lightGreyColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),

              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: RatingBar(
                      size: 18,
                      filledColor: ColorConstant.appColor,
                      alignment: Alignment.center,
                      filledIcon: Icons.star_sharp,
                      emptyIcon: Icons.star_border,
                      onRatingChanged: (value) => debugPrint('$value'),
                      initialRating: 4,
                      maxRating: 5,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    '5.0',
                    style: TextStyle(
                      color: ColorConstant.blackGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 1,
                width: MediaQuery.sizeOf(context).width,
                color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
              ),
            ],
          ),
        );
      },
    );
  }
}
