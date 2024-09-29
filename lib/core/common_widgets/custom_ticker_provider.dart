import 'package:flutter/scheduler.dart';

class CustomTickerProvider extends TickerProvider {
  @override
  Ticker createTicker(onTick) => Ticker(onTick);
}
