import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class WheelDateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onChanged;
  const WheelDateTimePicker({super.key, this.onChanged});

  @override
  State<WheelDateTimePicker> createState() => _WheelDateTimePickerState();
}

class _WheelDateTimePickerState extends State<WheelDateTimePicker> {
  final textStyle = const TextStyle(fontSize: 18, height: 1.5);

  late WheelPickerController monthController;
  late WheelPickerController dayController;
  late WheelPickerController yearController;
  late WheelPickerController hourController;
  late WheelPickerController minuteController;
  late WheelPickerController amPmController;
  DateTime now = DateTime.now();
  final int baseYear = 2000;

  final List<String> months = const [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  void initControllers() {
    int currentYear = now.year;
    int baseYear = 2020;

    int hour12 = now.hour % 12;
    if (hour12 == 0) hour12 = 12;

    monthController = WheelPickerController(
      itemCount: 12,
      initialIndex: now.month - 1,
    );

    dayController = WheelPickerController(
      itemCount: 31,
      initialIndex: now.day - 1,
    );

    yearController = WheelPickerController(
      itemCount: 50,
      initialIndex: currentYear - baseYear,
    );

    hourController = WheelPickerController(
      itemCount: 12,
      initialIndex: hour12 - 1,
    );

    minuteController = WheelPickerController(
      itemCount: 60,
      initialIndex: now.minute,
    );

    amPmController = WheelPickerController(
      itemCount: 2,
      initialIndex: now.hour >= 12 ? 1 : 0,
    );
    setState(() {});
  }

  DateTime getSelectedDateTime() {
    int month = monthController.selected + 1;
    int day = dayController.selected + 1;
    int year = baseYear + yearController.selected;

    int hour = hourController.selected + 1;
    int minute = minuteController.selected;
    bool isPM = amPmController.selected == 1;

    if (isPM && hour != 12) hour += 12;
    if (!isPM && hour == 12) hour = 0;

    return DateTime(year, month, day, hour, minute);
  }

  @override
  void initState() {
    super.initState();
    initControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(getSelectedDateTime());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// MONTH
          buildWheel(
            controller: monthController,
            itemCount: 12,
            builder: (index) => Text(months[index], style: textStyle),
          ),

          /// DAY
          buildWheel(
            controller: dayController,
            itemCount: 31,
            builder: (index) => Text("${index + 1}", style: textStyle),
          ),

          /// YEAR
          buildWheel(
            controller: yearController,
            itemCount: 50,
            builder: (index) => Text("${2020 + index}", style: textStyle),
          ),

          /// HOUR
          buildWheel(
            controller: hourController,
            itemCount: 12,
            builder: (index) => Text("${index + 1}", style: textStyle),
          ),

          /// MINUTE
          buildWheel(
            controller: minuteController,
            itemCount: 60,
            builder: (index) =>
                Text(index.toString().padLeft(2, '0'), style: textStyle),
          ),

          /// AM / PM
          buildWheel(
            controller: amPmController,
            itemCount: 2,
            builder: (index) =>
                Text(index == 0 ? "AM" : "PM", style: textStyle),
          ),
        ],
      ),
    );
  }

  Widget buildWheel({
    required WheelPickerController controller,
    required int itemCount,
    required Widget Function(int index) builder,
  }) {
    return SizedBox(
      width: 50,
      height: 260,
      child: WheelPicker(
        looping: false,
        controller: controller,
        builder: (context, index) => builder(index),
        selectedIndexColor: ColorConstant.appColor,
        onIndexChanged: (index, interactionType) {
          widget.onChanged?.call(getSelectedDateTime());
        },
        style: WheelPickerStyle(
          itemExtent: textStyle.fontSize! * textStyle.height!,
          squeeze: 1.1,
          diameterRatio: 0.8,
          surroundingOpacity: 1,
          magnification: 1.2,
        ),
      ),
    );
  }
}
