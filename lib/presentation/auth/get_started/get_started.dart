import 'package:book_your_taxi/presentation/auth/get_started/widgets/get_started_bottom_widget.dart';
import 'package:book_your_taxi/presentation/auth/get_started/widgets/get_started_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../controller/get_started_controller.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetStartedController>(
      init: GetStartedController(context: context),
      builder: (controller) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                GetStartedTopWidget(controller: controller),
                GetStartedBottomWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
