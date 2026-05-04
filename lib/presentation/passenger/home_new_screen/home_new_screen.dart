import 'package:book_your_taxi/controller/home_controller.dart';
import 'package:book_your_taxi/core/color_constant/color_constant.dart';
import 'package:book_your_taxi/core/icons/app_icons.dart';
import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/presentation/passenger/home_new_screen/widgets/home_driver_card_widget.dart';
import 'package:book_your_taxi/presentation/passenger/home_new_screen/widgets/home_new_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeNewScreen extends StatelessWidget {
  const HomeNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) {
        final currentLocationText = controller.userAddress.value.isNotEmpty
            ? controller.userAddress.value
            : controller.currentLocation.value.latitude != 0 ||
                  controller.currentLocation.value.longitude != 0
            ? 'Lat ${controller.currentLocation.value.latitude.toStringAsFixed(5)}, '
                  'Lng ${controller.currentLocation.value.longitude.toStringAsFixed(5)}'
            : 'Current location will appear here';

        return Scaffold(
          backgroundColor: const Color(0xFFF7F7FB),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                HomeNewTopBar(
                  currentLocationText: currentLocationText,
                  onNotificationTap: () =>
                      context.push(RouteConstant.notification),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(18, 15, 18, 24),
                    itemCount: _driverRides.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final ride = _driverRides[index];
                      return DriverRideCard(ride: ride);
                    },
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

class DriverRideData {
  final String driverName;
  final String driverInitials;
  final double rating;
  final int reviews;
  final String carName;
  final String plateNumber;
  final String pickup;
  final String dropOff;
  final int etaMinutes;
  final int seats;
  final int luggage;
  final double fare;
  final String statusLabel;
  final Color accentColor;

  DriverRideData({
    required this.driverName,
    required this.driverInitials,
    required this.rating,
    required this.reviews,
    required this.carName,
    required this.plateNumber,
    required this.pickup,
    required this.dropOff,
    required this.etaMinutes,
    required this.seats,
    required this.luggage,
    required this.fare,
    required this.statusLabel,
    required this.accentColor,
  });
}

final List<DriverRideData> _driverRides = [
  DriverRideData(
    driverName: 'Aman Verma',
    driverInitials: 'AV',
    rating: 4.9,
    reviews: 218,
    carName: 'Toyota Glanza',
    plateNumber: 'WB 12 AB 2345',
    pickup: 'Park Street, Kolkata',
    dropOff: 'Salt Lake Sector V',
    etaMinutes: 4,
    seats: 4,
    luggage: 2,
    fare: 132.0,
    statusLabel: 'Available',
    accentColor: const Color(0xFF1F7A5C),
  ),
  DriverRideData(
    driverName: 'Rohit Singh',
    driverInitials: 'RS',
    rating: 4.8,
    reviews: 164,
    carName: 'Hyundai Aura',
    plateNumber: 'WB 20 CD 8841',
    pickup: 'Gariahat Junction',
    dropOff: 'Howrah Station',
    etaMinutes: 6,
    seats: 4,
    luggage: 1,
    fare: 168.5,
    statusLabel: 'Fast Pickup',
    accentColor: const Color(0xFF2D5BFF),
  ),
  DriverRideData(
    driverName: 'Sourav Das',
    driverInitials: 'SD',
    rating: 5.0,
    reviews: 301,
    carName: 'Maruti Swift',
    plateNumber: 'WB 05 EF 1024',
    pickup: 'New Town Action Area 1',
    dropOff: 'Ruby General Hospital',
    etaMinutes: 3,
    seats: 4,
    luggage: 2,
    fare: 121.75,
    statusLabel: 'Top Rated',
    accentColor: const Color(0xFFF08C00),
  ),
];
