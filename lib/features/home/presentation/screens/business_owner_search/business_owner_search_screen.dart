import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import '../../../../../core/common_widgets/custom_text_field.dart';
import '../../cubits/buisiness_owner_search/business_owner_search_cubit.dart';
import 'widgets/filter_sidebar.dart';
import 'widgets/influencers_grid.dart';
import 'widgets/marketing_agencies_grid.dart';

//! This is the business owner search screen came when BusinessOwner clicks on search icon in the BusinessOwnerHomeScreen
class BusinessOwnerSearchScreen extends StatelessWidget {
  const BusinessOwnerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessOwnerSearchCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: FilterSidebar(),
          appBar: AppBar(
            leading: const BackButton(
              color: AppColors.pureBlack,
            ),
            title: CustomTextField<BusinessOwnerSearchCubit,
                BusinessOwnerSearchState>(
              hintText: "Search...",
              onChanged: (value, cubit) {
                cubit.onSearchTextChanged(value);
              },
              boxShadow: true,
              prefixIcon: const Icon(Icons.search),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: WidgetHelper.squareIconButton(
                      icon: Icons.tune,
                      onTap: () {
                        // TODO : Need to implement
                      },
                    ),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(110.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Text(
                        'Travel > Found 250 Influencers', //TODO Placeholder text will be replaced with actual data
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.isWeb
                              ? 20.sp
                              : context.isIPad
                                  ? 18.sp
                                  : 16.sp,
                        ),
                      ).pOnly(bottom: 16.w),
                    ),
                  ),
                  Container(
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.r),
                        bottom: Radius.circular(10.r),
                      ),
                    ),
                    child: TabBar(
                      indicatorPadding: EdgeInsets.only(top: 50.w),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: AppColors.appPrimaryColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12.r),
                        ),
                      ),
                      labelColor: AppColors.pureBlack,
                      unselectedLabelColor: AppColors.pureGrey,
                      labelStyle:
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                      tabs: const [
                        Tab(text: 'Influencers'),
                        Tab(text: 'Marketing Agencies'),
                      ],
                    ).pSymmetric(horizontal: 16),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 8,
                          spreadRadius: 0,
                          color: AppColors.pureBlack.withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: TabBarView(
                      children: [
                        InfluencersGrid().pSymmetric(
                            horizontal: context.isLargeScreen ? 32 : 16),
                        const MarketingAgenciesGrid().pSymmetric(
                            horizontal: context.isLargeScreen ? 32 : 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
