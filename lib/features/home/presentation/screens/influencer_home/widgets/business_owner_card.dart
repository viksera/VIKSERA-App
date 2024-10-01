import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/config/constants/app_assets.dart';
import 'package:viksera/config/typography/app_styles.dart';
import 'package:viksera/core/common_widgets/common_progress_indicator.dart';
import 'package:viksera/core/extensions/app_extensions.dart';

class BusinessOwnerCard extends StatelessWidget {
  const BusinessOwnerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        // TODO : Need to implement on tap function
      },
      child: Ink(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Ink(
                padding: const EdgeInsets.all(10),
                width: 121,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.pureBlack.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ],
                  color: AppColors.pureWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        height: 97,
                        imageUrl:
                            'https://tse1.mm.bing.net/th?id=OIP.XK0XJsd_h9qS7CU9WGvtUAHaFE&pid=Api&P=0&h=180',
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const CommonCircularProgressIndicator(
                          color: AppColors.appDarkGreenColor,
                        ),
                      ),
                    ),
                    6.heightBox,
                    Text(
                      'Share Studio',
                      style: AppStyles.style12
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'John B',
                      style: AppStyles.style10,
                    )
                  ],
                )),
            SvgPicture.string(AppAssets.bookmark).positioned(top: 0, right: 15)
          ],
        ),
      ),
    );
  }
}
