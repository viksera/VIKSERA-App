import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/constants/app_assets.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_text_field.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import 'package:viksera/features/home/presentation/cubits/business_owner_home/business_owner_home_cubit.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/category_card.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/influencer_card.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/marketing_agency_card.dart';

class BusinessOwnerHomeScreen extends StatelessWidget {
  const BusinessOwnerHomeScreen({super.key});
  static final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  static final ScrollController influencersPicksForYouController =
      ScrollController();
  static final ScrollController marketingAgenciesController =
      ScrollController();
  static const List<String> categories = [
    'Travel',
    'Food & Drinks',
    'Lifestyle',
    'Health',
    'Fashion',
    'Travel',
    'Food & Drinks',
    'Lifestyle',
    'Health',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessOwnerHomeCubit(),
      child: BlocBuilder<BusinessOwnerHomeCubit, BusinessOwnerHomeState>(
        buildWhen: (p, c) =>
            p.status != c.status || p.bannerIndex != c.bannerIndex,
        builder: (context, state) {
          var cubit = context.read<BusinessOwnerHomeCubit>();
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi 👋,John',
                        style: AppStyles.style20
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(AppAssets.businessOwnerImage),
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      CustomTextField<BusinessOwnerHomeCubit,
                          BusinessOwnerHomeState>(
                        buildWhen: (p, c) => p.searchText != c.searchText,
                        onChanged: (value, cubit) =>
                            cubit.onSearchTextChanged(value),
                        prefixIcon: const Icon(Icons.search,
                            color: AppColors.appDarkGreenColor),
                        hintText: 'Search',
                        boxShadow: true,
                      ).expanded(),
                      13.widthBox,
                      WidgetHelper.squareIcon(
                          icon: Icons.notifications_outlined),
                      13.widthBox,
                      WidgetHelper.squareIcon(icon: Icons.settings)
                    ],
                  ),
                  24.heightBox,
                  Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: 5,
                          carouselController: carouselSliderController,
                          disableGesture: true,
                          options: CarouselOptions(
                              onPageChanged: (index, reason) =>
                                  cubit.onBannerIndexChanged(index),
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              height: 185),
                          itemBuilder: (context, index, realIndex) => Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(AppAssets.banner),
                                    fit: BoxFit.fill),
                                color: AppColors.appPrimaryColor,
                                borderRadius: BorderRadius.circular(
                                  10,
                                )),
                            width: context.width,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 5; i++)
                              Container(
                                      width: state.bannerIndex == i ? 25 : 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      height: 10)
                                  .pAll(3)
                          ],
                        ).positioned(bottom: 10)
                      ]),
                  24.heightBox,
                  Text(
                    'Categories',
                    style:
                        AppStyles.style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  12.heightBox,
                  Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: categories
                          .map((category) => CategoryCard(title: category))
                          .toList()),
                  20.heightBox,
                  Text(
                    'Influencer picks for you',
                    style:
                        AppStyles.style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  16.heightBox,
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    controller: influencersPicksForYouController,
                    separatorBuilder: (_, __) => 10.widthBox,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const InfluencerCard(),
                    itemCount: 5,
                  ).height(166),
                  20.heightBox,
                  Text(
                    'Marketing Agencies',
                    style:
                        AppStyles.style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  16.heightBox,
                  ListView.separated(
                    controller: marketingAgenciesController,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    separatorBuilder: (_, __) => 10.widthBox,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const MarketingAgencyCard(),
                    itemCount: 5,
                  ).height(134),
                  90.heightBox,
                ],
              ).pSymmetric(horizontal: 16),
            ),
          );
        },
      ),
    );
  }
}
