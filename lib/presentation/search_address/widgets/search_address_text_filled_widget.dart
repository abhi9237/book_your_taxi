import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import '../../../common/common_text_form_filled.dart';
import '../../../controller/search_address_controller.dart';

class SearchAddressTextFilledWidget extends StatelessWidget {
  final SearchAddressController controller;
  const SearchAddressTextFilledWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          CommonMapTextFormFilled(
            fillColor: ColorConstant.lightGreyColor.withValues(alpha: 0.2),
            onChangeText: (v) {
              controller.search(v);
            },
            hintText: 'Enter your location',
            controller: controller.searchController.value,
            suffixIcon: Icons.close,
            onTapSuffixIcon: () {
              // controller.onTapSavedPlaces(context);
            },
          ),
          if (controller.results.isNotEmpty)
            Container(
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: controller.results.length,
                itemBuilder: (_, index) {
                  final place = controller.results[index];

                  return ListTile(
                    title: Text(place.name),
                    subtitle: Text(place.address),

                    onTap: () {
                      // controller.text =
                      //     place.name;
                      //
                      // results.clear();

                      // print(
                      //     "Lat: ${place.lat}, Lng: ${place.lng}"
                      // );
                    },
                  );
                },
              ),
            ),

          if (controller.isLoading.value)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
