import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/routes/routes.dart';
import 'package:viksera/core/common_widgets/custom_ticker_provider.dart';
import 'package:viksera/features/home/presentation/cubits/bottom_navigation_cubit.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  final Widget child;
  const BottomNavigation({super.key, required this.child});
  static final MotionTabBarController motionTabBarController =
      MotionTabBarController(
          length: 4, vsync: CustomTickerProvider(), initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocConsumer<BottomNavigationCubit, int>(
        listener: (context, index) => context.goNamed(redirectTo(index)),
        builder: (context, index) {
          var cubit = context.read<BottomNavigationCubit>();
          return Scaffold(
            body: child,
            bottomNavigationBar: MotionTabBar(
              controller: motionTabBarController,
              tabSize: 40,
              tabBarHeight: 60,
              initialSelectedTab: "HOME",
              tabSelectedColor: AppColors.appDarkGreenColor,
              labels: const ["HOME", "CATEGORIES", "CHAT", "SETTINGS"],
              icons: const [
                Icons.home,
                Icons.category,
                Icons.wechat,
                Icons.settings
              ],
              onTabItemSelected: (int index) => cubit.onIconClicked(index),
            ),
          );
        },
      ),
    );
  }
}

String redirectTo(int index) {
  switch (index) {
    case 0:
      return Routes.businessOwnerHome;
    case 1:
      return Routes.businessOwnerCategories;
    case 2:
      return Routes.businessOwnerChats;
    case 3:
      return Routes.businessOwnerSettings;
  }
  return Routes.businessOwnerHome;
}
