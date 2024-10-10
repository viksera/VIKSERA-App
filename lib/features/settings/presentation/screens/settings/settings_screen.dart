import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/settings/presentation/screens/settings/widgets/settings_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.heightBox,
            BackButton(onPressed: () => context.pop()),
            16.heightBox,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Settings',
                    style: AppStyles.style34.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 34.sp,
                    ),
                  ),
                  34.heightBox,
                  Column(
                    children: _buildSettingsButtons(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSettingsButtons() {
    return [
      _settingsButton(Icons.edit, 'Edit Profile'),
      _settingsButton(Icons.bar_chart, 'Statistics'),
      _settingsButton(Icons.notifications_outlined, 'Notifications'),
      _settingsButton(Icons.attach_email, 'Contact Us'),
      _settingsButton(Icons.miscellaneous_services_sharp, 'Terms of Services'),
      _settingsButton(Icons.help_center_rounded, 'FAQ'),
      _settingsButton(Icons.star, 'Rate Us'),
      _settingsButton(Icons.logout, 'Log out', isLogout: true),
    ];
  }

  Widget _settingsButton(IconData icon, String text, {bool isLogout = false}) {
    return Column(
      children: [
        SettingsButton(
          onTap: () {
            // TODO: Implement redirect function
          },
          icon: icon,
          text: text,
          isLogout: isLogout,
        ),
        12.heightBox,
      ],
    ).pSymmetric(horizontal: 16.w);
  }
}
