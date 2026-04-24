import 'package:book_your_taxi/controller/driver_detail_controller.dart';
import 'package:book_your_taxi/presentation/driver_detail/widgets/driver_detail_tab_view_widget.dart';
import 'package:book_your_taxi/presentation/driver_detail/widgets/driver_detail_tab_widget.dart';
import 'package:book_your_taxi/presentation/driver_detail/widgets/driver_detail_top_widget.dart';
import 'package:book_your_taxi/presentation/driver_detail/widgets/driver_detail_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class DriverDetail extends StatelessWidget {
  const DriverDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverDetailController>(
      init: DriverDetailController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    DriverDetailTopWidget(),
                    SizedBox(height: 5,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                      
                            DriverDetailUserWidget(),
                            DriverDetailTabWidget(controller: controller),
                            DriverDetailTabViewWidget(controller: controller),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
