import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/features/home/presentation/bottom_navigation.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/business-owner-home',
  navigatorKey: navigatorKey,
  routes: [
    ShellRoute(
        navigatorKey: _shellKey,
        pageBuilder: (context, state, child) =>
            const NoTransitionPage(child: BottomNavigation()),
        routes: [
          GoRoute(
            path: '/business-owner-home',
            name: Routes.businessOwnerHome,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: BusinessOwnerHomeScreen()),
          ),
        ])
  ],
);

class Routes {
  static const businessOwnerHome = 'business_owner_home';
}
