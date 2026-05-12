import 'package:book_your_taxi/controller/verification_required_steps_controller.dart';
import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class VerificationRequiredStepsScreen extends StatelessWidget {
  final String driverName;
  const VerificationRequiredStepsScreen({super.key, required this.driverName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationRequiredStepsController>(
      init: VerificationRequiredStepsController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            height: 100,
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
                  offset: Offset(0, -2),
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                CommonButton(
                  buttonText: 'Continue',
                  onTap: () {
                    controller.onTapVerificationContinue(context);
                  },
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFFF6F6F6),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 36),
                        Center(
                          child: Text(
                            driverName.isEmpty
                                ? 'Welcome!'
                                : 'Welcome!, $driverName',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorConstant.blackColor,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 38),
                        const Text(
                          'Required Steps',
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...controller.requiredSteps.map(
                          (step) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _VerificationStepTile(
                              title: step,
                              onTap: () => controller.onTapStep(context, step),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Submitted Steps',
                          style: TextStyle(
                            color: ColorConstant.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...controller.submittedSteps.map(
                          (step) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _VerificationStepTile(
                              title: step,
                              onTap: () => controller.onTapStep(context, step),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VerificationStepTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _VerificationStepTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFEFEFEF)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.42),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFFF59B0B),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
