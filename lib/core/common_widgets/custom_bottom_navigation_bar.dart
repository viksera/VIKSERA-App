import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(25),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        unselectedItemColor: AppColors.pureWhite.withOpacity(0.5),
        selectedItemColor: AppColors.pureWhite,
        backgroundColor: AppColors.appPrimaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add, size: 20), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 20), label: ''),
        ],
      ),
    );
    // return Container(
    //   height: 46,
    //   decoration: BoxDecoration(
    //       color: AppColors.appPrimaryColor,
    //       borderRadius: BorderRadius.circular(20)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       IconButton(
    //         icon: Icon(Icons.home),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.post_add),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.account_circle),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}
