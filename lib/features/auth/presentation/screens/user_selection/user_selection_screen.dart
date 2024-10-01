import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/routes/routes.dart';
import 'package:viksera/core/common_widgets/custom_app_button.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/auth/presentation/cubits/user_selection/user_selection_cubit.dart';
import 'package:viksera/features/auth/presentation/screens/user_selection/widget/user_card.dart';
import 'package:go_router/go_router.dart';

//! Screen created for temporary purpose

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSelectionCubit(),
      child: BlocBuilder<UserSelectionCubit, bool>(
        builder: (context, isBusinessOwner) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserCard(
                      userType: 'Business owner',
                      isSelected: isBusinessOwner,
                    ),
                    20.widthBox,
                    UserCard(
                      userType: 'Influencer',
                      isSelected: !isBusinessOwner,
                    )
                  ],
                ),
                24.heightBox,
                CustomAppButton(
                    onTap: () => context.goNamed(isBusinessOwner
                        ? Routes.businessOwnerHome
                        : Routes.influencerHome),
                    text: 'Continue'),
                30.heightBox,
              ],
            ).pSymmetric(horizontal: 16),
          );
        },
      ),
    );
  }
}
