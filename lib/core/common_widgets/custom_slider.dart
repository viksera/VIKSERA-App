import 'package:flutter/material.dart';
import 'package:viksera/config/colors/app_colors.dart';
import 'package:viksera/core/common_widgets/custom_slider_track_shape.dart';

class CustomSlider extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final double currentValue;
  final bool isAnimated;
  final Color activeTrackColor;
  final Color inactiveTrackColor;
  const CustomSlider(
      {super.key,
      required this.maxValue,
      required this.minValue,
      required this.currentValue,
      this.activeTrackColor = AppColors.appPrimaryColor,
      this.inactiveTrackColor = AppColors.pureWhite,
      this.isAnimated = false});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: currentValue),
      duration: Duration(seconds: isAnimated ? 2 : 0),
      builder: (context, value, child) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: SliderComponentShape.noThumb,
          activeTrackColor: activeTrackColor,
          inactiveTrackColor: inactiveTrackColor,
          trackHeight: 18.0,
          trackShape: CustomSliderTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: value,
          min: minValue,
          max: maxValue,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
