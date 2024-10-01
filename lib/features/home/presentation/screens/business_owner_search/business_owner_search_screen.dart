import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';
import '../../../../../core/common_widgets/custom_text_field.dart';
import '../../cubits/buisiness_owner_search/business_owner_search_cubit.dart';
import '../../cubits/business_owner_search_filter/business_owner_search_filter_cubit.dart';
import 'widgets/filter_sidebar.dart';
import 'widgets/influencers_grid.dart';
import 'widgets/marketing_agencies_grid.dart';

//! This is the business owner search screen came when BusinessOwner clicks on search icon in the BusinessOwnerHomeScreen
class BusinessOwnerSearchScreen extends StatelessWidget {
  const BusinessOwnerSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BusinessOwnerSearchCubit(),
        ),
        BlocProvider(
          create: (context) => BusinessOwnerSearchFilterCubit(),
        ),
      ],
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
                padding: const EdgeInsets.only(right: 8.0),
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
              preferredSize: const Size.fromHeight(110),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Travel > Found 250 Influencers', //TODO Placeholder text will be replaced with actual data
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.isWeb
                              ? 20
                              : context.isIPad
                                  ? 18
                                  : 16,
                        ),
                      ).pOnly(bottom: 16),
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
                      ),
                    ),
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.only(top: 50),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: const BoxDecoration(
                        color: AppColors.appPrimaryColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                      labelColor: AppColors.pureBlack,
                      unselectedLabelColor: AppColors.pureGrey,
                      labelStyle:
                          Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.appBackgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
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
