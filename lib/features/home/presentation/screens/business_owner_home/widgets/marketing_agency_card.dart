import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/constants/app_assets.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/custom_app_button.dart';
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
                    'https://vimm.com/wp-content/uploads/2018/07/Agency-sign-1536x768.jpeg'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Agency One',
                  style:
                      AppStyles.style16.copyWith(fontWeight: FontWeight.w600)),
              Text('Leading marketing agency',
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
    // return Container(
    //   padding: const EdgeInsets.all(10),
    //   decoration: WidgetHelper.cardDecoration(),
    //   height: 126,
    //   width: 172,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         children: [
    //           Container(
    //             height: 27,
    //             width: 34,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(5),
    //                 image: const DecorationImage(
    //                     fit: BoxFit.cover,
    //                     image: AssetImage(AppAssets.marketingAgency))),
    //           ),
    //           20.widthBox,
    //           Text(
    //             'BlueSky Media',
    //             style: AppStyles.style10.copyWith(
    //                 color: AppColors.pureBlack, fontWeight: FontWeight.w600),
    //           )
    //         ],
    //       ),
    //       Divider(
    //         color: AppColors.appPrimaryColor.withOpacity(0.5),
    //         thickness: 0.5,
    //       ),
    //       Text(
    //         '"Maximizing Your Brand’s Online Reach"',
    //         style: AppStyles.style8.copyWith(color: AppColors.appPrimaryColor),
    //       ).wrapCenter(),
    //       5.heightBox,
    //       RichText(
    //           text: TextSpan(children: [
    //         const TextSpan(text: 'Specialization: '),
    //         TextSpan(
    //             text: 'Travel, Health',
    //             style: AppStyles.style6.copyWith(
    //                 fontWeight: FontWeight.w600,
    //                 color: AppColors.appDarkGreenColor))
    //       ], style: AppStyles.style6.copyWith(color: AppColors.pureBlack))),
    //       3.heightBox,
    //       Text(
    //         'Location: Delhi, India',
    //         style: AppStyles.style6.copyWith(
    //             color: AppColors.pureBlack, fontWeight: FontWeight.w600),
    //       ),
    //       RichText(
    //           text: TextSpan(children: [
    //         const TextSpan(text: 'Operating Area: '),
    //         TextSpan(
    //             text: 'Global',
    //             style: AppStyles.style6.copyWith(
    //                 fontWeight: FontWeight.w600, color: AppColors.appRedColor))
    //       ], style: AppStyles.style6.copyWith(color: AppColors.pureBlack))),
    //           CustomAppButton(
    //             onTap: () {},
    //             text: '+ Connect',
    //             width: 54,
    //             textStyle: AppStyles.style6.copyWith(
    //                 fontWeight: FontWeight.w600, color: AppColors.pureWhite),
    //             height: 15,
    //             borderRadius: 20,
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // ).pSymmetric(vertical: 8);
  }
}
