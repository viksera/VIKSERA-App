import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/cubits/business_owner_search_filter/business_owner_search_filter_cubit.dart';

class FilterSidebar extends StatelessWidget {
  //! Sidebar for filtering options including categories and price range
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessOwnerSearchFilterCubit,
        BusinessOwnerSearchFilterState>(
      builder: (context, state) {
        List<String> selectedCategories = [];

        double minPrice = 1000;
        double maxPrice = 10000;

        if (state is BusinessOwnerSearchFilterLoaded) {
          selectedCategories = state.selectedCategory.split(',');
          minPrice = state.minPrice < 1000
              ? 1000
              : (state.minPrice > 10000 ? 10000 : state.minPrice);
          maxPrice = state.maxPrice < 1000
              ? 1000
              : (state.maxPrice > 10000 ? 10000 : state.maxPrice);
        }

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
                    _buildCheckbox('Technology', selectedCategories, context),
                    _buildCheckbox('Travel', selectedCategories, context),
                    _buildCheckbox('Lifestyle', selectedCategories, context),
                    _buildCheckbox('Clothing', selectedCategories, context),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ).pOnly(bottom: 8),
                RangeSlider(
                  values: RangeValues(minPrice, maxPrice),
                  min: 1000,
                  max: 10000,
                  divisions: 20,
                  labels: RangeLabels(
                    '₹${minPrice.round()}',
                    '₹${maxPrice.round()}',
                  ),
                  onChanged: (range) {
                    context
                        .read<BusinessOwnerSearchFilterCubit>()
                        .updatePriceRange(range.start, range.end);
                  },
                ),
                Text(
                  '₹${minPrice.round()} - ₹${maxPrice.round()}',
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

  Widget _buildCheckbox(
      String category, List<String> selectedCategories, BuildContext context) {
    final isSelected = selectedCategories.contains(category);
    return CheckboxListTile(
      title: Text(category),
      value: isSelected,
      onChanged: (bool? value) {
        if (value != null) {
          final cubit = context.read<BusinessOwnerSearchFilterCubit>();
          if (value) {
            cubit.updateCategory([...selectedCategories, category].join(','));
          } else {
            cubit.updateCategory(
                selectedCategories.where((c) => c != category).join(','));
          }
        }
      },
    );
  }
}
