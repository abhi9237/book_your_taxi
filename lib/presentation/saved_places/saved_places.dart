import 'package:book_your_taxi/presentation/saved_places/widgets/saved_places_list_widget.dart';
import 'package:book_your_taxi/presentation/saved_places/widgets/saved_places_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/saved_places_controller.dart';

class SavedPlaces extends StatelessWidget {
  const SavedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedPlacesController>(
      init: SavedPlacesController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SavedPlacesTopWidget(controller: controller),
                  SavedPlacesListWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
