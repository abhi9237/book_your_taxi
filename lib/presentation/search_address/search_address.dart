import 'package:book_your_taxi/presentation/search_address/widgets/search_address_text_filled_widget.dart';
import 'package:book_your_taxi/presentation/search_address/widgets/search_address_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/search_address_controller.dart';

class SearchAddress extends StatelessWidget {
  const SearchAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchAddressController>(
      init: SearchAddressController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SearchAddressTopWidget(controller: controller),
                  SearchAddressTextFilledWidget(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
