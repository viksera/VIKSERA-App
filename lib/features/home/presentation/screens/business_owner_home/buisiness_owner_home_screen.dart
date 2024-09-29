import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/constants/app_assets.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_text_field.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import 'package:viksera/features/home/presentation/cubits/business_owner_home/business_owner_home_cubit.dart';

import '../../cubits/buisiness_owner_search/business_owner_search_cubit.dart';

class BusinessOwnerHomeScreen extends StatelessWidget {
  const BusinessOwnerHomeScreen({super.key});
  static final CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BusinessOwnerHomeCubit()), 
        BlocProvider(create: (context) => BusinessOwnerSearchCubit()),
      ],
      child: BlocBuilder<BusinessOwnerHomeCubit, BusinessOwnerHomeState>(
        builder: (context, state) {
          var homeCubit = context.read<BusinessOwnerHomeCubit>();
          var searchCubit = context.read<BusinessOwnerSearchCubit>(); 
          
          return Scaffold(
            body: Column(
              children: [
                60.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi 👋, John',
                      style: AppStyles.style20.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AppAssets.businessOwnerImage),
                    )
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    CustomTextField<BusinessOwnerSearchCubit, BusinessOwnerSearchState>(
                      buildWhen: (p, c) => p.searchText != c.searchText,
                      onChanged: (value, cubit) => cubit.onSearchTextChanged(value),  
                      prefixIcon: const Icon(Icons.search, color: AppColors.appDarkGreenColor),
                      hintText: 'Search',
                      boxShadow: true,
                    ).expanded(),
                    13.widthBox,
                    WidgetHelper.squareIcon(icon: Icons.notifications_outlined),
                    13.widthBox,
                    WidgetHelper.squareIcon(icon: Icons.settings)
                  ],
                ),
                24.heightBox,
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
                  CarouselSlider.builder(
                    itemCount: 5,
                    carouselController: carouselSliderController,
                    disableGesture: true,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) => homeCubit.onBannerIndexChanged(index),
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      height: 185
                    ),
                    itemBuilder: (context, index, realIndex) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.appPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: context.width,
                      child: Text(
                        '$index',
                        style: AppStyles.style20.copyWith(color: AppColors.pureWhite),
                      ).wrapCenter(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          width: state.bannerIndex == i ? 25 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                          height: 10,
                        ).pAll(3)
                    ],
                  ).positioned(bottom: 10)
                ])
              ],
            ).pSymmetric(horizontal: 16),
          );
        },
      ),
    );
  }
}
