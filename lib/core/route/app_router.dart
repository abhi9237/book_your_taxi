import 'package:book_your_taxi/core/route/route_constant/route_constant.dart';
import 'package:book_your_taxi/presentation/auth/location_access/location_access.dart';
import 'package:book_your_taxi/presentation/auth/login_screen/login_ui.dart';
import 'package:book_your_taxi/presentation/auth/onBoardingPages/on_boarding_pages.dart';
import 'package:book_your_taxi/presentation/auth/signUp_screen/sign_up_screen.dart';
import 'package:book_your_taxi/presentation/auth/verify_code/verify_code.dart';
import 'package:book_your_taxi/presentation/bottom_nav/bottom_nav_screen.dart';
import 'package:book_your_taxi/presentation/destination/destination.dart';
import 'package:book_your_taxi/presentation/saved_places/saved_places.dart';
import 'package:book_your_taxi/presentation/search_address/search_address.dart';
import 'package:book_your_taxi/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/auth/complete_profile/complete_profile.dart';
import '../../presentation/auth/get_started/get_started.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: RouteConstant.bottomNav,

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
    ],
  );
}
