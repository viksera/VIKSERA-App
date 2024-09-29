import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/screens/settings/widgets/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        60.heightBox,
        BackButton(
          onPressed: () => context.pop(),
        ),
        16.heightBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: AppStyles.style34.copyWith(fontWeight: FontWeight.w600),
            ),
            34.heightBox,
            Column(
              children: [
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.edit,
                    text: 'Edit Profile'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.bar_chart,
                    text: 'Statistics'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.notifications_outlined,
                    text: 'Notifications'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.attach_email,
                    text: 'Contact Us'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.miscellaneous_services_sharp,
                    text: 'Terms of Services'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.help_center_rounded,
                    text: 'FAQ'),
                16.heightBox,
                SettingsButton(
                    onTap: () {
                      // TODO : Implement redirect function
                    },
                    icon: Icons.star,
                    text: 'Rate Us')
              ],
            )
          ],
        ).pSymmetric(horizontal: 16)
      ],
    );
  }
}
