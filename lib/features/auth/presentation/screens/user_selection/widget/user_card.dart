import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/auth/presentation/cubits/user_selection/user_selection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  final String userType;
  final bool isSelected;
  const UserCard({super.key, required this.userType, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserSelectionCubit>();
    return GestureDetector(
      onTap: () => !isSelected ? cubit.onUserChanged() : null,
      child: Container(
        height: 121,
        width: 121,
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    isSelected ? AppColors.appGreenColor : AppColors.pureBlack),
            borderRadius: BorderRadius.circular(10)),
        child: Text(userType).wrapCenter(),
      ),
    );
  }
}
