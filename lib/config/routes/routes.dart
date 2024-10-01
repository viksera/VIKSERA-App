import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/features/categories/presentation/screens/categories/categories_screen.dart';
import 'package:viksera/features/chats/presentation/screens/chats/chats_screen.dart';
import 'package:viksera/features/home/presentation/bottom_navigation.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_search/business_owner_search_screen.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/influencer_home_screen.dart';
import 'package:viksera/features/settings/presentation/screens/settings/settings_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/home',
  navigatorKey: navigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellKey,
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: BottomNavigation(child: child)),
      routes: [
        GoRoute(
          path: '/home',
          name: Routes.businessOwnerHome,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: BusinessOwnerHomeScreen()),
          routes: [
            GoRoute(
              path: 'search',
              name: Routes.searchFromBusinessOwnerHome,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: BusinessOwnerSearchScreen()),
            ),
            GoRoute(
              path: 'settings',
              name: Routes.settingsFromBusinessOwnerHome,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SettingsScreen()),
            )
          ],
        ),
        GoRoute(
          path: '/business-owner-categories',
          name: Routes.businessOwnerCategories,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CategoriesScreen()),
        ),
        GoRoute(
          path: '/business-owner-chats',
          name: Routes.businessOwnerChats,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ChatsScreen()),
        ),
        GoRoute(
          path: '/settings',
          name: Routes.businessOwnerSettings,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsScreen()),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellKey,
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: BottomNavigation(child: child)),
      routes: [
        GoRoute(
          path: '/home',
          name: Routes.influencerHome,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: InfluencerHomeScreen()),
        ),
        GoRoute(
          path: '/settings',
          name: Routes.influencerSettings,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsScreen()),
        )
      ],
    )
  ],
);

class Routes {
  //business owner
  static const businessOwnerHome = 'business_owner_home';
  static const businessOwnerCategories = 'business_owner_categories';
  static const businessOwnerChats = 'business_owner_chats';
  static const businessOwnerSettings = 'business_owner_settings';
  static const settingsFromBusinessOwnerHome =
      'settings_from_business_owner_home';
  static const searchFromBusinessOwnerHome = 'search_from_business_owner_home';

  //influencer
  static const influencerHome = 'influencer_home';
  static const influencerSettings = 'influencer_settings';
}
