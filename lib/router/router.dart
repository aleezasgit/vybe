import 'package:flutter/material.dart';
import 'package:vybe_app/configs/configs.dart';
import 'package:vybe_app/router/routes.dart';
import 'package:vybe_app/screens/Guardian/guardian.dart';
import 'package:vybe_app/screens/add_gaurdian/add_new_guardian.dart';
import 'package:vybe_app/screens/data_and_privacy/data_privacy.dart';
import 'package:vybe_app/screens/data_visibility/data_visibility.dart';
import 'package:vybe_app/screens/emergency/emergency.dart';
import 'package:vybe_app/screens/emergency_alert/emergency_alert.dart';
import 'package:vybe_app/screens/faq/faq.dart';
import 'package:vybe_app/screens/gaurdian_permission/guardian_permissions.dart';
import 'package:vybe_app/screens/guardien_network/guardian_network.dart';

import 'package:vybe_app/screens/onboarding/onboarding.dart';
import 'package:vybe_app/screens/policy/policy.dart';
import 'package:vybe_app/screens/profile/profile.dart';
import 'package:vybe_app/screens/rewards/rewards.dart';
import 'package:vybe_app/screens/rewards_detail/rewards_detail.dart';
import 'package:vybe_app/screens/settings/settings.dart';

import 'package:vybe_app/screens/splash/splash.dart';
import 'package:vybe_app/screens/support/support.dart';

final Map<String, Widget Function(dynamic)> appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.onBoarding: (_) => const OnboardingScreen(),
  AppRoutes.profile: (_) => const ProfileScreen(),
   AppRoutes.settings: (_) => const SettingsScreen(),
    AppRoutes.faq: (_) => const FaqScreen(),
    AppRoutes.guardian: (_) => const GuardianNetworkScreen(),
    AppRoutes.rewards: (_) => const RewardsScreen(),
    AppRoutes.rewardsdetail: (_) => const RewardDetailScreen(),
    AppRoutes.support: (_) => const SupportScreen(),
    AppRoutes.privacyPolicy: (_) => const PrivacyPolicyScreen(),
    AppRoutes.emergencyServices: (_) => const EmergencyServicesScreen(),
    AppRoutes.dataPrivacy: (_) => const DataPrivacyScreen(),
    AppRoutes.emergencyAlert: (_) => const EmergencyAlertScreen(),
    AppRoutes.dataVisibility: (_) => const DataVisibilityScreen(),
    AppRoutes.guardianPermissions: (_) => const GuardianPermissionsScreen(),
    AppRoutes.guardianNetworks: (_) => const GuardianNetworksScreen(),
    AppRoutes.addGuardian: (_) => const AddNewGuardianScreen(),
};

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    SlideRoute(
      settings: RouteSettings(name: ModalRoute.of(context)?.settings.name),
      child: screen,
    ),
  );
}

void navigateToFullScreen(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  Navigator.of(
    context,
    rootNavigator: true,
  ).pushNamed(routeName, arguments: arguments);
}

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return FadeRoute(settings: settings, child: const SplashScreen());

    default:
      return null;
  }
}

////////////////////////////////////////////////////////////////////////Custom Routes for transitions////////////////////////////////////////////////////////////////////////
class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}

class ScaleRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  ScaleRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          final scaleAnimation = Tween(begin: 0.95, end: 1.0).animate(ani1);

          return ScaleTransition(scale: scaleAnimation, child: child);
        },
      );
}

// class SlideRoute extends PageRouteBuilder {
//   final Widget child;

//   @override
//   final RouteSettings settings;

//   SlideRoute({required this.child, required this.settings})
//     : super(
//         settings: settings,
//         pageBuilder: (context, ani1, ani2) => child,
//         transitionsBuilder: (context, ani1, ani2, child) {
//           const begin = Offset(1.0, 0.0);
//           const end = Offset.zero;
//           const curve = Curves.easeInOut;

//           final tween = Tween(
//             begin: begin,
//             end: end,
//           ).chain(CurveTween(curve: curve));
//           final offsetAnimation = ani1.drive(tween);
//           final fadeAnimation = ani1.drive(CurveTween(curve: Curves.easeInOut));

//           return SlideTransition(
//             position: offsetAnimation,
//             child: FadeTransition(opacity: fadeAnimation, child: child),
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 600),
//       );
// }

class SlideRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  SlideRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // from right to left
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      );
}
