import 'package:flutter/material.dart';

import '../../../../core/color_constant/color_constant.dart';

class DriverDetailUserWidget extends StatelessWidget {
  const DriverDetailUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstant.appColor,
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 50),
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
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'emaple@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.lightGreyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: ColorConstant.appColor,
                        size: 14,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'New york, USA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.lightGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.sizeOf(context).width,
          color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContentWidget(icon: Icons.group, text: 'Customer'),
            ContentWidget(icon: Icons.shopping_bag_rounded, text: 'Years Exp.'),
            ContentWidget(icon: Icons.star, text: 'Rating'),
            ContentWidget(icon: Icons.message, text: 'Review'),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const ContentWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
          ),
          child: Icon(icon, color: ColorConstant.appColor, size: 30),
        ),

        Text(
          '75000+',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.appColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.lightGreyColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
