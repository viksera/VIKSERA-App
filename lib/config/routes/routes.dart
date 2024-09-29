import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/features/home/presentation/bottom_navigation.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';
import 'package:viksera/features/home/presentation/screens/settings/settings_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/business-owner-home',
  navigatorKey: navigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellKey,
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: BottomNavigation(child: child)),
      routes: [
        GoRoute(
            path: '/business-owner-home',
            name: Routes.businessOwnerHome,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BusinessOwnerHomeScreen()),
            routes: [
              GoRoute(
                path: 'settings',
                name: Routes.businessOwnerSettings,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsScreen()),
              )
            ]),
      ],
    )
  ],
);

class Routes {
  // business owner
  static const businessOwnerHome = 'business_owner_home';
  static const businessOwnerSettings = 'business_owner_settings';
}
