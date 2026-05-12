import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/presentation/passenger/bottom_nav/bottom_nav_screen.dart';
import 'package:book_your_taxi/presentation/passenger/destination/destination.dart';
import 'package:book_your_taxi/presentation/passenger/driver_detail/driver_detail.dart';
import 'package:book_your_taxi/presentation/passenger/driver_rating/driver_rating.dart';
import 'package:book_your_taxi/presentation/passenger/home_new_screen/home_new_screen.dart';
import 'package:book_your_taxi/presentation/passenger/pay_cash/pay_cash.dart';
import 'package:book_your_taxi/presentation/passenger/payment_methods/payment_methods.dart';
import 'package:book_your_taxi/presentation/passenger/saved_places/saved_places.dart';
import 'package:book_your_taxi/presentation/passenger/search_address/search_address.dart';
import 'package:book_your_taxi/presentation/passenger/congratulations/congratulations_screen.dart';
import 'package:book_your_taxi/presentation/passenger/e_receipt/e_receipt_screen.dart';
import 'package:book_your_taxi/presentation/passenger/chat_screen/chat_screen.dart';
import 'package:book_your_taxi/presentation/passenger/coupon_screen/coupon_screen.dart';
import 'package:book_your_taxi/presentation/passenger/bookings/bookings_screen.dart';
import 'package:book_your_taxi/presentation/passenger/cancel_taxi_booking/cancel_taxi_booking_screen.dart';
import 'package:book_your_taxi/presentation/passenger/profile_screen/profile_screen.dart';
import 'package:book_your_taxi/presentation/passenger/help_centre/help_centre.dart';
import 'package:book_your_taxi/presentation/passenger/your_profile_screen/your_profile_screen.dart';
import 'package:book_your_taxi/presentation/passenger/manage_address_screen/manage_address_screen.dart';
import 'package:book_your_taxi/presentation/passenger/add_address_screen/add_address_screen.dart';
import 'package:book_your_taxi/presentation/passenger/settings_screen/settings_screen.dart';
import 'package:book_your_taxi/presentation/passenger/wallet_screen/wallet_screen.dart';
import 'package:book_your_taxi/presentation/passenger/sos_screen/sos_screen.dart';
import 'package:book_your_taxi/presentation/passenger/notification/notification_screen.dart';
import 'package:book_your_taxi/presentation/passenger/tip_for_driver/tip_for_driver.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/auth/complete_profile/complete_profile.dart';
import '../../presentation/auth/get_started/get_started.dart';
import '../../presentation/auth/location_access/location_access.dart';
import '../../presentation/auth/login_screen/login_ui.dart';
import '../../presentation/auth/onBoardingPages/on_boarding_pages.dart';
import '../../presentation/auth/signUp_screen/sign_up_screen.dart';
import '../../presentation/auth/splash_screen/splash_screen.dart';
import '../../presentation/auth/verify_code/verify_code.dart';
import '../../presentation/auth/verify_email/verify_email.dart';
import '../../presentation/driver/searching_ride/searching_ride.dart';
import '../../presentation/driver/upload_bank_account_detail/upload_bank_account_detail_screen.dart';
import '../../presentation/driver/upload_profile_picture/upload_profile_picture_screen.dart';
import '../../presentation/driver/driver_bottom_navigation_bar/driver_bottom_navigation_bar_screen.dart';
import '../../presentation/driver/driver_home/driver_home_screen.dart';
import '../../presentation/driver/create_trip/create_trip_screen.dart';
import '../../presentation/driver/upload_driving_licence_detail/upload_driving_licence_detail_screen.dart';
import '../../presentation/driver/upload_government_id/upload_government_id_screen.dart';
import '../../presentation/passenger/add_card/add_card.dart';
import '../../presentation/driver/verification_required_steps/verification_required_steps.dart';
import '../../presentation/user_role_selection/user_role_selection_screen.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: RouteConstant.splash,

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
        path: RouteConstant.verificationRequiredSteps,
        name: RouteConstant.verificationRequiredSteps,
        builder: (context, state) {
          final String driverName = state.extra as String? ?? '';
          return VerificationRequiredStepsScreen(driverName: driverName);
        },
      ),
      GoRoute(
        path: RouteConstant.uploadProfilePicture,
        name: RouteConstant.uploadProfilePicture,
        builder: (context, state) {
          return const UploadProfilePictureScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.uploadBankAccuontDetail,
        name: RouteConstant.uploadBankAccuontDetail,
        builder: (context, state) {
          return const UploadBankAccountDetailScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.uploadDrivingLicenceDetail,
        name: RouteConstant.uploadDrivingLicenceDetail,
        builder: (context, state) {
          return const UploadDrivingLicenceDetailScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.uploadGovernmentId,
        name: RouteConstant.uploadGovernmentId,
        builder: (context, state) {
          return const UploadGovernmentIdScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.driverBottomNavigationBar,
        name: RouteConstant.driverBottomNavigationBar,
        builder: (context, state) {
          return const DriverBottomNavigationBarScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.driverHome,
        name: RouteConstant.driverHome,
        builder: (context, state) {
          return const DriverHomeScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.createTrip,
        name: RouteConstant.createTrip,
        builder: (context, state) {
          return const CreateTripScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.onBoardingPages,
        name: RouteConstant.onBoardingPages,
        builder: (context, state) {
          final String userSelection = state.extra as String? ?? '';
          return OnBoardingPages(selectedUserRole: userSelection);
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
        path: RouteConstant.verifyEmail,
        name: RouteConstant.verifyEmail,
        builder: (context, state) {
          final String email = state.extra as String? ?? '';
          return VerifyEmailScreen(email: email);
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
          final String email = state.extra as String? ?? '';
          return VerifyCodeScreen(email: email);
        },
      ),
      GoRoute(
        path: RouteConstant.locationAccess,
        name: RouteConstant.locationAccess,
        builder: (context, state) {
          final String comingFrom = state.extra as String? ?? '';
          return LocationAccessScreen(comingFrom: comingFrom);
        },
      ),
      GoRoute(
        path: RouteConstant.authSelection,
        name: RouteConstant.authSelection,
        builder: (context, state) {
          return const UserRoleSelectionScreen();
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
        path: RouteConstant.homeNewScreen,
        name: RouteConstant.homeNewScreen,
        builder: (context, state) {
          return const HomeNewScreen();
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
      GoRoute(
        path: RouteConstant.profileScreen,
        name: RouteConstant.profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.yourProfileScreen,
        name: RouteConstant.yourProfileScreen,
        builder: (context, state) {
          return const YourProfileScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.manageAddressScreen,
        name: RouteConstant.manageAddressScreen,
        builder: (context, state) {
          return const ManageAddressScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.settingsScreen,
        name: RouteConstant.settingsScreen,
        builder: (context, state) {
          return const SettingsScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.helpCentreScreen,
        name: RouteConstant.helpCentreScreen,
        builder: (context, state) {
          return const HelpCentreScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.addAddressScreen,
        name: RouteConstant.addAddressScreen,
        builder: (context, state) {
          return const AddAddressScreen();
        },
      ),
      GoRoute(
        path: RouteConstant.walletScreen,
        name: RouteConstant.walletScreen,
        builder: (context, state) {
          return const WalletScreen();
        },
      ),
    ],
  );
}
