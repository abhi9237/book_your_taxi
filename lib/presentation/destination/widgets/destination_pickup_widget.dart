import 'package:flutter/material.dart';
import '../../../common/common_widget.dart';

class DestinationPickupWidget extends StatelessWidget {
  const DestinationPickupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonShaderContainer(child: PickUpWidget());
  }
}
