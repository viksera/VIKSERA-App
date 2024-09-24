import 'package:flutter/material.dart';

class RouteHelper {
  static void push(BuildContext context, {required Widget route}) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => route),
      );

  static void removeUntil(BuildContext context, {required Widget route}) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => route),
        (route) => false,
      );
  static void replace(BuildContext context, {required Widget route}) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => route),
      );
}
