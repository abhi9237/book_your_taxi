import 'package:book_your_taxi/presentation/driver_rating/widget/driver_overall_rating_widget.dart';
import 'package:book_your_taxi/presentation/driver_rating/widget/driver_rating_top_widget.dart';
import 'package:book_your_taxi/presentation/driver_rating/widget/driver_rating_user_widget.dart';
import 'package:flutter/material.dart';

import '../../common/common_button.dart';

class DriverRating extends StatelessWidget {
  const DriverRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CommonButton(
            buttonText: 'Submit',
            onTap: () {
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              DriverRatingTopWidget(),
              DriverRatingUserWidget(),
              DriverOverallRatingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
