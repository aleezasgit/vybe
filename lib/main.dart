import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:vybe_app/router/router.dart';
import 'package:vybe_app/router/routes.dart';

import 'configs/configs.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  services.SystemChrome.setSystemUIOverlayStyle(
    const services.SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  services.SystemChrome.setEnabledSystemUIMode(
    services.SystemUiMode.edgeToEdge,
    overlays: [
      services.SystemUiOverlay.top,
      services.SystemUiOverlay.bottom, // ✅ show navigation bar
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final List<NavigatorObserver> observers = [];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<services.SystemUiOverlayStyle>(
      value: const services.SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
      ),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [...observers, NavigationHistoryObserver()],
        theme: theme.themeDark,
        initialRoute: AppRoutes.emergencyAlert,
        builder: (context, child) {
          theme.App.init(context);
          return child!;
        },
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoutes,
        routes: appRoutes,
      ),
    );
  }
}
