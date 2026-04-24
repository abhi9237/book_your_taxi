import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/common/common_text_form_filled.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

import 'widgets/add_address_header_widget.dart';
import 'widgets/address_type_selector_widget.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  int selectedTypeIndex = 0;

  final List<String> addressTypes = const [
    'Home',
    'Office',
    "Parent's House",
    "Friend's House",
  ];

  @override
  void dispose() {
    addressController.dispose();
    floorController.dispose();
    landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _MapHeader(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AddAddressHeaderWidget(
                          onBackTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: ColorConstant.appColor.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: const BoxDecoration(
                              color: ColorConstant.appColor,
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 16,
                              backgroundColor: ColorConstant.blackGreyColor,
                              child: Icon(
                                Icons.person,
                                color: ColorConstant.whiteColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 150),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Save address as *',
                        style: TextStyle(
                          color: ColorConstant.blackGreyColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AddressTypeSelectorWidget(
                        types: addressTypes,
                        selectedIndex: selectedTypeIndex,
                        onChanged: (index) {
                          setState(() {
                            selectedTypeIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Complete address',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CommonTextFormFilled(
                        hintText: 'Enter address *',
                        controller: addressController,
                        maxLines: 4,
                        hintTextColor: ColorConstant.blackGreyColor.withValues(
                          alpha: 0.58,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Floor',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CommonTextFormFilled(
                        hintText: 'Enter Floor',
                        controller: floorController,
                        hintTextColor: ColorConstant.blackGreyColor,
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Landmark',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CommonTextFormFilled(
                        hintText: 'Enter Landmark',
                        controller: landmarkController,
                        hintTextColor: ColorConstant.blackGreyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 16,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: CommonButton(buttonText: 'Save address', onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}

class _MapHeader extends StatelessWidget {
  final Widget child;

  const _MapHeader({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.sizeOf(context).width, 310),
            painter: _StreetMapPainter(),
          ),
          child,
        ],
      ),
    );
  }
}

class _StreetMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.88)
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    final roadPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.96)
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    final roads = [
      const Offset(20, 50),
      const Offset(120, 20),
      const Offset(200, 60),
      const Offset(280, 34),
      const Offset(340, 88),
      const Offset(260, 140),
      const Offset(150, 170),
      const Offset(58, 222),
    ];

    canvas.drawLine(const Offset(0, 70), Offset(size.width, 190), roadPaint);
    canvas.drawLine(
      const Offset(0, 150),
      Offset(size.width * 0.9, 0),
      roadPaint,
    );
    canvas.drawLine(
      Offset(18, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.66),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.05, size.height * 0.88),
      Offset(size.width * 0.92, size.height * 0.13),
      roadPaint,
    );
    canvas.drawLine(
      Offset(50, size.height * 0.05),
      Offset(size.width * 0.97, size.height * 0.8),
      roadPaint,
    );

    for (final offset in roads) {
      canvas.drawCircle(offset, 1.4, paint);
    }

    final labels = <_StreetLabel>[
      _StreetLabel('Leonard St', const Offset(250, 18), -0.12),
      _StreetLabel('Worth St', const Offset(100, 30), -0.12),
      _StreetLabel('Broadway', const Offset(280, 92), -1.56),
      _StreetLabel('Reader St', const Offset(120, 150), -0.26),
      _StreetLabel('Chambers St', const Offset(90, 198), -0.26),
      _StreetLabel('W Broadway', const Offset(20, 70), -1.45),
    ];

    for (final label in labels) {
      final painter = TextPainter(
        text: TextSpan(
          text: label.text,
          style: TextStyle(
            color: const Color(0xFF9A9A9A),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      canvas.save();
      canvas.translate(label.offset.dx, label.offset.dy);
      canvas.rotate(label.rotation);
      painter.paint(canvas, Offset.zero);
      canvas.restore();
    }

    final markerCenter = Offset(size.width * 0.46, size.height * 0.55);
    final markerPaint = Paint()..color = ColorConstant.appColor;
    canvas.drawCircle(
      markerCenter,
      20,
      markerPaint..color = ColorConstant.appColor.withValues(alpha: 0.18),
    );
    canvas.drawCircle(markerCenter, 14, markerPaint);
    canvas.drawCircle(
      markerCenter,
      7,
      Paint()..color = ColorConstant.whiteColor,
    );
    canvas.drawCircle(
      markerCenter.translate(0, -2),
      5,
      Paint()..color = ColorConstant.blackColor.withValues(alpha: 0.35),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StreetLabel {
  final String text;
  final Offset offset;
  final double rotation;

  _StreetLabel(this.text, this.offset, this.rotation);
}
