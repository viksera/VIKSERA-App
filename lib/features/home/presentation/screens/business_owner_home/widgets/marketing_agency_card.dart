import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/extensions/app_extensions.dart';
import 'package:viksera/core/widget_helper/widget_helper.dart';

class MarketingAgencyCard extends StatelessWidget {
  const MarketingAgencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      decoration: WidgetHelper.cardDecoration(),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 110,
                imageUrl:
                    'https://vimm.com/wp-content/uploads/2018/07/Agency-sign-1536x768.jpeg'), // TODO : Dummy data
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Agency One', // TODO : Dummy data
                  style:
                      AppStyles.style16.copyWith(fontWeight: FontWeight.w600)),
              Text('Leading marketing agency', // TODO : Dummy data
                  style: AppStyles.style14
                      .copyWith(fontWeight: FontWeight.w300, height: 1.1)),
              10.heightBox,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.appYellowColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.appYellowColor,
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                        color: AppColors.appYellowColor,
                      ),
                    ],
                  ),
                  2.widthBox,
                  Text('(3) • 120 Reviews',
                      style: AppStyles.style10
                          .copyWith(color: AppColors.pureBlack)),
                ],
              ),
            ],
          ).pSymmetric(horizontal: 10).expanded()
        ],
      ),
    ).pSymmetric(vertical: 5);
  }
}
