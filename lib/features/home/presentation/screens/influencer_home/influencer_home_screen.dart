import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_text_field.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import 'package:viksera/features/home/presentation/cubits/influencer_home/influencer_home_cubit.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/widgets/ai_insight_card.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/widgets/business_owner_card.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/widgets/opportunity_card.dart';
import 'package:viksera/features/home/presentation/screens/influencer_home/widgets/visibility_card.dart';

class InfluencerHomeScreen extends StatelessWidget {
  const InfluencerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfluencerHomeCubit(),
      child: BlocBuilder<InfluencerHomeCubit, InfluencerHomeState>(
        builder: (context, state) {
          var cubit = context.read<InfluencerHomeCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi 👋, Fiona', // TODO : Dummy data
                        style: AppStyles.style20
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=600'), // TODO: Dummy data
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      CustomTextField<InfluencerHomeCubit, InfluencerHomeState>(
                        onChanged: (value, cubit) => {},
                        onSubmitted: (value, cubit) {
                          // TODO : Need implement function
                        },
                        prefixIcon: const Icon(Icons.search,
                            color: AppColors.appDarkGreenColor),
                        hintText: 'Search',
                        boxShadow: true,
                      ).expanded(),
                      13.widthBox,
                      WidgetHelper.squareIconButton(
                        icon: Icons.notifications_outlined,
                        onTap: () {
                          /// TODO : Need to implement function
                        },
                      ),
                      13.widthBox,
                      WidgetHelper.squareIconButton(
                        icon: Icons.settings,
                        onTap: () {
                          /// TODO : Need to implement function
                        },
                      )
                    ],
                  ),
                  35.heightBox,
                  Row(
                    children: [
                      const VisibilityCard().expanded(),
                      18.widthBox,
                      const OpportunityCard().expanded(),
                    ],
                  ),
                  24.heightBox,
                  const AiInsightCard(),
                  24.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Owners  who search \'Fiona\'', // TODO : Placeholder text
                        style: AppStyles.style16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'More',
                        style: AppStyles.style12
                            .copyWith(color: AppColors.appPrimaryColor),
                      )
                    ],
                  ),
                  8.heightBox,
                  ListView.separated(
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BusinessOwnerCard(),
                    itemCount: 4,
                    separatorBuilder: (_, __) => 10.widthBox,
                  ).height(174),
                  16.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Owner picks for you',
                        style: AppStyles.style16
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'More',
                        style: AppStyles.style12
                            .copyWith(color: AppColors.appPrimaryColor),
                      )
                    ],
                  ),
                  8.heightBox,
                  ListView.separated(
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => BusinessOwnerCard(),
                    itemCount: 4,
                    separatorBuilder: (_, __) => 10.widthBox,
                  ).height(174),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
