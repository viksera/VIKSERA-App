import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/routes/routes.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_text_field.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import 'package:viksera/features/home/presentation/cubits/business_owner_home/business_owner_home_cubit.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/category_card.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/influencer_card.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/marketing_agency_card.dart';
import 'package:go_router/go_router.dart';

class BusinessOwnerHomeScreen extends StatelessWidget {
  const BusinessOwnerHomeScreen({super.key});
  static final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  static final ScrollController influencerPicksForYouController =
      ScrollController();
  static final ScrollController marketingAgenciesController =
      ScrollController();

  // TODO: Dummy data
  static const List<String> categories = [
    'Travel',
    'Food & Drinks',
    'Lifestyle',
    'Health',
    'Fashion',
  ];
  // TODO: Dummy data
  static const List<String> banners = [
    'https://i.graphicmama.com/blog/wp-content/uploads/2019/10/01134923/cute-sweet-social-media-ad-banner-campaign-example.jpg',
    'https://1.bp.blogspot.com/-LDkA_ligh38/X6fEm7HCoOI/AAAAAAAAFYQ/m8STkDBuvWIyHVLd7GGGjrztK8z6iuEqQCLcBGAsYHQ/s16000/1755.jpg',
    'https://email.uplers.com/blog/wp-content/uploads/2023/03/Banner-Ad-Examples-to-Get-You-Inspired-1024x411.png'
  ];
  // TODO: Dummy data
  static const List<Color> colors = [
    Color(0xff00CCDD),
    Color(0xff98DED9),
    Color(0xffC8A1E0),
    Color(0xffA2CA71),
    Color(0xff9CDBA6)
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi 👋, John', // TODO : Dummy data
                        style: AppStyles.style20
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://images.pexels.com/photos/943084/pexels-photo-943084.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'), // TODO: Dummy data
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
                        onSubmitted: (value, cubit) {
                          // TODO : Need implement function
                        },
                        prefixIcon: GestureDetector(
                          onTap: () => context
                              .goNamed(Routes.searchFromBusinessOwnerHome),
                          child: const Icon(Icons.search,
                              color: AppColors.appDarkGreenColor),
                        ),
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
                        onTap: () => context
                            .goNamed(Routes.settingsFromBusinessOwnerHome),
                      )
                    ],
                  ),
                  24.heightBox,
                  Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: banners.length,
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
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        banners[index]),
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
                            for (int i = 0; i < banners.length; i++)
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
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => 5.widthBox,
                    itemBuilder: (context, index) => CategoryCard(
                        title: categories[index], color: colors[index]),
                  ).height(100),
                  20.heightBox,
                  Text(
                    'Influencer picks for you',
                    style:
                        AppStyles.style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  16.heightBox,
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    controller: influencerPicksForYouController,
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
                  ).height(200),
                  20.heightBox,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
