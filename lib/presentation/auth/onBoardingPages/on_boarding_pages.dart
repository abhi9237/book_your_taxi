import 'package:book_your_taxi/controller/auth_controller.dart';
import 'package:book_your_taxi/core/icons/app_icons.dart';
import 'package:book_your_taxi/core/image_constant/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../common/common_button.dart';
import '../../../core/color_constant/color_constant.dart';

class OnBoardingPages extends StatelessWidget {
  const OnBoardingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(context: context),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: controller.onBoardingPageSelection,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                        child: Image.asset(
                          controller.pages[index]["image"]!,
                          height: 550,
                          width: MediaQuery.sizeOf(context).width,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: controller.pages[index]["title"] ?? '',
                                style: TextStyle(
                                  color: ColorConstant.blackColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        controller.pages[index]["subtitle"] ??
                                        '',
                                    style: TextStyle(
                                      color: ColorConstant.appColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            Text(
                              controller.pages[index]["desc"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConstant.blackGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              /// 🔹 DOT INDICATOR + BUTTON
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    /// DOTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentIndex.value == index
                              ? 20
                              : 8,
                          height: 10,
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? ColorConstant.appColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.currentIndex.value > 0?

                        CommonCircularButton(
                          onTap: () {
                            controller.backwardToPreviousPage();
                          },
                          iconImg: AppIcons.moveBackward,
                        ):SizedBox(),
                        CommonCircularButton(
                          onTap: () {
                            controller.forwardToNextPage(context);
                          },
                          iconImg: AppIcons.moveForward,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
