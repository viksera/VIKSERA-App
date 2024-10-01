import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/features/home/presentation/bottom_navigation.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/influencer_home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/influencer-home',
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
        ),
      ],
    ),
    ShellRoute(
        navigatorKey: _shellKey,
        pageBuilder: (context, state, child) =>
            NoTransitionPage(child: BottomNavigation(child: child)),
        routes: [
          GoRoute(
            path: '/influencer-home',
            name: Routes.influencerHome,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: InfluencerHomeScreen()),
          ),
        ])
  ],
);

class Routes {
  static const businessOwnerHome = 'business_owner_home';
  static const influencerHome = 'influencer_home';
}
