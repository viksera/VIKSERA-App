import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/common_widgets/custom_ticker_provider.dart';
import 'package:viksera/features/home/presentation/cubits/bottom_navigation_cubit.dart';

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
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, index) {
          var cubit = context.read<BottomNavigationCubit>();
          return Scaffold(
            body: child,
            bottomNavigationBar: MotionTabBar(
              controller: motionTabBarController,
              tabSize: 40,
              tabBarHeight: 60,
              initialSelectedTab: "HOME",
              tabSelectedColor: AppColors.appPrimaryColor,
              labels: const [
                "HOME",
                "EXPLORE",
                "PROFILE",
                "SETTINGS"
              ], // TODO : Dummy data in List
              icons: const [
                Icons.home,
                Icons.post_add,
                Icons.people_alt,
                Icons.settings
              ], // TODO : Dummy data in List
              onTabItemSelected: (int index) {
                cubit.onIconClicked(index);
                // TODO : Need to implement redirection function
              },
            ),
          );
        },
      ),
    );
  }
}
