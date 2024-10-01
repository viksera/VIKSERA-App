import 'dart:io';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  Size get mqSize => MediaQuery.sizeOf(this);

  double get height => mqSize.height;

  double get width => mqSize.width;
}

extension PaddingExt on Widget {
  Padding viewInsets(BuildContext context) =>
      Padding(padding: MediaQuery.viewInsetsOf(context));

  Padding pAll(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding pOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );

  Padding pSymmetric({Key? key, double horizontal = 0, double vertical = 0}) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
}

extension SizeBoxEx on num {
  Widget get widthBox => SizedBox(width: toDouble());

  Widget get heightBox => SizedBox(height: toDouble());
}

extension SizedBoxExtension on Widget {
  Widget width(double width, {Key? key}) => SizedBox(
        key: key,
        width: width,
        child: this,
      );

  Widget widthFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.width,
        child: this,
      );

  Widget height(double height) => SizedBox(
        key: key,
        height: height,
        child: this,
      );

  Widget heightFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        height: context.height,
        child: this,
      );

  Widget widthHeight(double width, double height) => SizedBox(
        key: key,
        width: width,
        height: height,
        child: this,
      );

  Widget widthHeightFull(BuildContext context, {Key? key}) => SizedBox(
        key: key,
        width: context.width,
        height: context.height,
        child: this,
      );
}

extension RandomOfDigits on Random {
  num nextIntOfDigits(num digitCount) {
    assert(1 <= digitCount && digitCount <= 9);
    num min = digitCount == 1 ? 0 : pow(10, digitCount - 1);
    num max = pow(10, digitCount);
    return min + nextInt((max - min).toInt());
  }
}

extension IterableExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension CenterExtension on Widget {
  Widget wrapCenter() => Center(child: this);
}

extension ExpandedExtension on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
}

extension PositionedExtension on Widget {
  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Positioned(
          top: top, bottom: bottom, right: right, left: left, child: this);
}

extension PlatformExt on BuildContext {
  bool get isWeb => kIsWeb;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  bool get isIOS => !kIsWeb && Platform.isIOS;

  bool get isIPad {
    final width = mqSize.width;
    return isIOS && width >= 768;
  }

  bool get isMobile => !isWeb && (isIOS || isAndroid);

  bool get isLargeScreen => width > 1024;
}
