import 'package:flutter/material.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/features/home/presentation/screens/business_owner_home/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  // TODO: Dummy data
  static const List<Color> colors = [
    Color(0xff00CCDD),
    Color(0xff98DED9),
    Color(0xffC8A1E0),
    Color(0xffA2CA71),
    Color(0xff9CDBA6)
  ];
  // TODO: Dummy data
  static const List<String> categories = [
    'Travel',
    'Food & Drinks',
    'Lifestyle',
    'Health',
    'Fashion',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            60.heightBox,
            Text(
              'Categories',
              style: AppStyles.style34.copyWith(fontWeight: FontWeight.w600),
            ),
            GridView.builder(
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isLargeScreen ? 4 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.6,
              ),
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) =>
                  CategoryCard(title: categories[index], color: colors[index]),
            ),
          ],
        ),
      ),
    );
  }
}
