import 'package:book_your_taxi/common/common_button.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class EReceiptScreen extends StatelessWidget {
  const EReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: ColorConstant.blackColor),
        ),
        centerTitle: true,
        title: const Text(
          'E-Receipt',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: ColorConstant.blackColor,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CommonButton(
            buttonText: 'Download E-Receipt',
            onTap: () {
              // TODO: Implement download
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildBarcode(),
              const SizedBox(height: 25),
              _buildInfoRow('Booking ID', '#854HG23', isBold: true),
              const SizedBox(height: 20),
              const Divider(color: ColorConstant.lightGreyColor),
              const SizedBox(height: 20),
              _buildInfoRow('Driver', 'Jenny Wilson'),
              const SizedBox(height: 15),
              _buildInfoRow('Car Number', 'GR 678-UVWX'),
              const SizedBox(height: 15),
              _buildInfoRow('Car Model', 'Hyundai Verna'),
              const SizedBox(height: 15),
              _buildInfoRow('Car Color', 'White'),
              const SizedBox(height: 20),
              const Divider(color: ColorConstant.lightGreyColor),
              const SizedBox(height: 20),
              _buildInfoRow('Cost Per Mile', '\$1.25'),
              const SizedBox(height: 15),
              _buildInfoRow('Estimated Mile', '10'),
              const SizedBox(height: 20),
              const Divider(color: ColorConstant.lightGreyColor, thickness: 1.5),
              const SizedBox(height: 20),
              _buildInfoRow('Total', '\$12.5', isBold: true),
              const SizedBox(height: 20),
              const Divider(color: ColorConstant.lightGreyColor),
              const SizedBox(height: 20),
              _buildInfoRow('Name', 'Esther Howard'),
              const SizedBox(height: 15),
              _buildInfoRow('Phone Number', '+1 (208) 555-0112'),
              const SizedBox(height: 15),
              _buildInfoRow('Transaction ID', '#RE2564HG23'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBarcode() {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          60,
          (index) => Container(
            width: (index % 5 == 0) ? 4 : (index % 3 == 0) ? 2 : 1,
            color: index % 2 == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConstant.blackGreyColor.withValues(alpha: 0.7),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            color: ColorConstant.blackColor,
          ),
        ),
      ],
    );
  }
}
