import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/presentation/auth/location_access/location_access.dart';
import 'package:book_your_taxi/presentation/auth/login_screen/login_ui.dart';
import 'package:book_your_taxi/presentation/auth/onBoardingPages/on_boarding_pages.dart';
import 'package:book_your_taxi/presentation/auth/signUp_screen/sign_up_screen.dart';
import 'package:book_your_taxi/presentation/auth/verify_code/verify_code.dart';
import 'package:book_your_taxi/presentation/bottom_nav/bottom_nav_screen.dart';
import 'package:book_your_taxi/presentation/destination/destination.dart';
import 'package:book_your_taxi/presentation/driver_detail/driver_detail.dart';
import 'package:book_your_taxi/presentation/driver_rating/driver_rating.dart';
import 'package:book_your_taxi/presentation/pay_cash/pay_cash.dart';
import 'package:book_your_taxi/presentation/payment_methods/payment_methods.dart';
import 'package:book_your_taxi/presentation/saved_places/saved_places.dart';
import 'package:book_your_taxi/presentation/searching_ride/searching_ride.dart';
import 'package:book_your_taxi/presentation/search_address/search_address.dart';
import 'package:book_your_taxi/presentation/splash_screen/splash_screen.dart';
import 'package:book_your_taxi/presentation/congratulations/congratulations_screen.dart';
import 'package:book_your_taxi/presentation/e_receipt/e_receipt_screen.dart';
import 'package:book_your_taxi/presentation/chat_screen/chat_screen.dart';
import 'package:book_your_taxi/presentation/coupon_screen/coupon_screen.dart';
import 'package:book_your_taxi/presentation/bookings/bookings_screen.dart';
import 'package:book_your_taxi/presentation/cancel_taxi_booking/cancel_taxi_booking_screen.dart';
import 'package:book_your_taxi/presentation/sos_screen/sos_screen.dart';
import 'package:book_your_taxi/presentation/notification/notification_screen.dart';
import 'package:book_your_taxi/presentation/tip_for_driver/tip_for_driver.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/add_card/add_card.dart';
import '../../presentation/auth/complete_profile/complete_profile.dart';
import '../../presentation/auth/get_started/get_started.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: RouteConstant.sosScreen,

    // redirect: (BuildContext context, GoRouterState state) async {
    //
    //   final bool isLoggedIn = await StorageService.hasToken();
    //
    //   final isAuthRoute = state.matchedLocation == RouteConstant.login ||
    //       state.matchedLocation == RouteConstant.otpVerification;
    //
    //   if (!isLoggedIn && !isAuthRoute) {
    //     return RouteConstant.login;
    //   }
    //
    //   if (isLoggedIn && isAuthRoute) {
    //     return RouteConstant.dashboard;
    //   }
    //
    //   // 4. If none of the above conditions are met, allow navigation.
    //   return null;
    // },
    routes: [
      GoRoute(
        path: RouteConstant.splash,
        name: RouteConstant.splash,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.getStarted,
        name: RouteConstant.getStarted,
        builder: (context, state) {
          return GetStartedScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.onBoardingPages,
        name: RouteConstant.onBoardingPages,
        builder: (context, state) {
          return OnBoardingPages();
        },
      ),
      GoRoute(
        path: RouteConstant.login,
        name: RouteConstant.login,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.signUp,
        name: RouteConstant.signUp,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.completeProfile,
        name: RouteConstant.completeProfile,
        builder: (context, state) {
          return CompleteProfile();
        },
      ),
      GoRoute(
        path: RouteConstant.verifyOtp,
        name: RouteConstant.verifyOtp,
        builder: (context, state) {
          return VerifyCodeScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.locationAccess,
        name: RouteConstant.locationAccess,
        builder: (context, state) {
          return LocationAccessScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.bottomNav,
        name: RouteConstant.bottomNav,
        builder: (context, state) {
          return BottomNavScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.savedPlaces,
        name: RouteConstant.savedPlaces,
        builder: (context, state) {
          return SavedPlaces();
        },
      ),
      GoRoute(
        path: RouteConstant.searchAddress,
        name: RouteConstant.searchAddress,
        builder: (context, state) {
          return SearchAddress();
        },
      ),
      GoRoute(
        path: RouteConstant.destination,
        name: RouteConstant.destination,
        builder: (context, state) {
          return DestinationScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.paymentMethods,
        name: RouteConstant.paymentMethods,
        builder: (context, state) {
          return PaymentMethodsScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.addCard,
        name: RouteConstant.addCard,
        builder: (context, state) {
          return AddCardScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.searchingRide,
        name: RouteConstant.searchingRide,
        builder: (context, state) {
          final String? searchingFor = state.extra as String?;
          return SearchingRideScreen(searchingFor: searchingFor);
        },
      ),
      GoRoute(
        path: RouteConstant.congratulations,
        name: RouteConstant.congratulations,
        builder: (context, state) {
          return CongratulationsScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.eReceipt,
        name: RouteConstant.eReceipt,
        builder: (context, state) {
          return const EReceiptScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.payCash,
        name: RouteConstant.payCash,
        builder: (context, state) {
          return const PayCashScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.driverRating,
        name: RouteConstant.driverRating,
        builder: (context, state) {
          return const DriverRating();
        },
      ),
      GoRoute(
        path: RouteConstant.driverDetail,
        name: RouteConstant.driverDetail,
        builder: (context, state) {
          return const DriverDetail();
        },
      ),
      GoRoute(
        path: RouteConstant.tipForDriver,
        name: RouteConstant.tipForDriver,
        builder: (context, state) {
          return const TipForDriver();
        },
      ),
      GoRoute(
        path: RouteConstant.notification,
        name: RouteConstant.notification,
        builder: (context, state) {
          return const NotificationScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.chatScreen,
        name: RouteConstant.chatScreen,
        builder: (context, state) {
          return const ChatScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.couponScreen,
        name: RouteConstant.couponScreen,
        builder: (context, state) {
          return const CouponScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.bookingsScreen,
        name: RouteConstant.bookingsScreen,
        builder: (context, state) {
          return const BookingsScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.cancelTaxiBooking,
        name: RouteConstant.cancelTaxiBooking,
        builder: (context, state) {
          return const CancelTaxiBookingScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.sosScreen,
        name: RouteConstant.sosScreen,
        builder: (context, state) {
          return const SosScreen();
        },
      ),
    ],
  );
}
