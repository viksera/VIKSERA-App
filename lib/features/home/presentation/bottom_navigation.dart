import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/common_widgets/custom_bottom_navigation_bar.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/cubits/bottom_navigation_cubit.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/buisiness_owner_home_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});
  static final List<Widget> businessOwnerScreens = [
    BusinessOwnerHomeScreen(),
    BusinessOwnerHomeScreen(),
    BusinessOwnerHomeScreen(),
    BusinessOwnerHomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, index) {
          var cubit = context.read<BottomNavigationCubit>();
          return PersistentTabView(
            context,
            backgroundColor: AppColors.appBackgroundColor,
            screens: businessOwnerScreens,
            items: [
              PersistentBottomNavBarItem(
                  activeColorPrimary: AppColors.pureBlack,
                  icon: const Icon(Icons.home)),
              PersistentBottomNavBarItem(
                  activeColorPrimary: AppColors.pureBlack,
                  icon: Icon(Icons.post_add)),
              PersistentBottomNavBarItem(
                  activeColorPrimary: AppColors.pureBlack,
                  icon: Icon(Icons.wechat_outlined)),
              PersistentBottomNavBarItem(
                  activeColorPrimary: AppColors.pureBlack,
                  icon: Icon(Icons.account_circle))
            ],
          );
        },
      ),
    );
  }
}
