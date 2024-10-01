import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/features/categories/presentation/screens/categories/categories_screen.dart';
import 'package:viksera/features/chats/presentation/screens/chats/chats_screen.dart';
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
  //business owner
  static const businessOwnerHome = 'business_owner_home';
  static const businessOwnerCategories = 'business_owner_categories';
  static const businessOwnerChats = 'business_owner_chats';

  //influencer
  static const influencerHome = 'influencer_home';
}
