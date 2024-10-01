import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/cubits/buisiness_owner_search/business_owner_search_cubit.dart';

class FilterSidebar extends StatelessWidget {
  //! Sidebar for filtering options including categories and price range
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessOwnerSearchCubit, BusinessOwnerSearchState>(
      builder: (context, state) {
        double minPrice = 1000;
        double maxPrice = 10000;

        return Drawer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'FILTERS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.pureBlack,
                  ),
                ).pOnly(bottom: 10),
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCheckbox('Technology', context),
                    _buildCheckbox('Travel', context),
                    _buildCheckbox('Lifestyle', context),
                    _buildCheckbox('Clothing', context),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ).pOnly(bottom: 8),
                RangeSlider(
                  values: RangeValues(state.minPrice, state.maxPrice),
                  min: 1000,
                  max: 10000,
                  divisions: 20,
                  labels: RangeLabels(
                    '₹${minPrice.round()}',
                    '₹${maxPrice.round()}',
                  ),
                  onChanged: (range) {
                    context
                        .read<BusinessOwnerSearchCubit>()
                        .updatePriceRange(range.start, range.end);
                  },
                ),
                Text(
                  '₹${state.minPrice.round()} - ₹${state.maxPrice.round()}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.pureBlack,
                  ),
                ).pOnly(bottom: 16, left: 5),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ).pOnly(top: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckbox(String category, BuildContext context) {
    return BlocSelector<BusinessOwnerSearchCubit, BusinessOwnerSearchState,
        List<String>>(
      selector: (state) => state.selectedCategory,
      builder: (context, selectedCategory) {
        var cubit = context.read<BusinessOwnerSearchCubit>();
        return CheckboxListTile(
          title: Text(category),
          value: selectedCategory.contains(category),
          onChanged: (bool? value) {
            if (value != null) {
              cubit.updateCategory(category);
            }
          },
        );
      },
    );
  }
}
