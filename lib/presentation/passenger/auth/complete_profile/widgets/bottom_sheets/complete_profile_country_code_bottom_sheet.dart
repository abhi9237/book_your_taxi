import 'package:book_your_taxi/models/common/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../controller/passenger_auth_controller.dart';
import '../../../../../../core/color_constant/color_constant.dart';

Future<void> openCompleteProfileCountryCodeBottomSheet(
  BuildContext context,
    PassengerAuthController controller,
) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorConstant.whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Obx(
        () => CompleteProfileCountryCodeBottomSheet(
          searchController: controller.searchCountryController.value,
          countryList: controller.dummyCountryCodeList,
          selectedCountryCode: controller.selectedCountryCode.value,
          onTapCountryCode: (c) {
            controller.onTapSelectCountry(c);
          },
          onChangedSearch: (v) {
            controller.onChangedList(v);
          },
        ),
      );
    },
  );
}

class CompleteProfileCountryCodeBottomSheet extends StatelessWidget {
  final TextEditingController searchController;
  final List<Country> countryList;
  final String selectedCountryCode;
  final Function(Country) onTapCountryCode;
  final Function(String) onChangedSearch;
  const CompleteProfileCountryCodeBottomSheet({
    super.key,
    required this.searchController,
    required this.countryList,
    required this.selectedCountryCode,
    required this.onTapCountryCode,
    required this.onChangedSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 12,
            bottom: MediaQuery.viewInsetsOf(context).bottom + 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 3,
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightGreyColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Country Code',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorConstant.blackColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose the dialing code for your phone number.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.blackGreyColor,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: onChangedSearch,
                controller: searchController,
                style: TextStyle(color: ColorConstant.blackColor),
                decoration: InputDecoration(
                  hintText: 'Search country or code',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: ColorConstant.lightGreyColor.withValues(
                    alpha: 0.08,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: ColorConstant.appColor),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: countryList.isEmpty
                    ? const Center(
                        child: Text(
                          'No country code found',
                          style: TextStyle(
                            color: ColorConstant.blackGreyColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: countryList.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final country = countryList[index];
                          final isSelected =
                              country.countryCode == selectedCountryCode;

                          return InkWell(
                            onTap: () => onTapCountryCode(country),
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? ColorConstant.appColor
                                      : ColorConstant.lightGreyColor.withValues(
                                          alpha: 0.2,
                                        ),
                                  width: 1.2,
                                ),
                                color: isSelected
                                    ? ColorConstant.appColor.withValues(
                                        alpha: 0.08,
                                      )
                                    : ColorConstant.whiteColor,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          country.name ?? '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: ColorConstant.blackColor,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          country.countryCode ?? '',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: ColorConstant.blackGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isSelected)
                                    const Icon(
                                      Icons.check_circle,
                                      color: ColorConstant.appColor,
                                      size: 22,
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                        side: BorderSide(
                          color: ColorConstant.lightGreyColor.withValues(
                            alpha: 0.25,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
