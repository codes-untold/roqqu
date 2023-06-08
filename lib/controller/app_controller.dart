import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:roqqu/models/order_book_model.dart';
import 'package:roqqu/views/widgets/middle_bar.dart';

class AppController extends ChangeNotifier {
  String selectedTradingpair = 'btcusdt';
  String selectedDuration = '1H';
  List<Candle> candles = [];
  TabSelection currentTabSelection = TabSelection.charts;
  OrderBookModel? orderBookData;

//updates the selected trading pair to a new value
  Future<void> updateTradingPair(String pair) async {
    clearCandleList();
    await fetchCandles();
    selectedTradingpair = pair;
    notifyListeners();
  }

  //updates the candle sticks duration interval e.g 1h 2h 4h
  Future<void> updateDuration(String duration) async {
    clearCandleList();
    await fetchCandles();
    selectedDuration = duration;
    notifyListeners();
  }

  //switch tab selection
  switchTab(TabSelection newTab) {
    currentTabSelection = newTab;
    notifyListeners();
  }

//fetches candle sticks
  Future<void> fetchCandles() async {
    final uri = Uri.parse(
        "https://api.binance.com/api/v3/klines?symbol=${selectedTradingpair.toUpperCase()}&interval=${selectedDuration.toLowerCase()}");
    final res = await http.get(uri);
    candles = (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
    notifyListeners();
  }

//updates the order book
  void updateOrderBook(Map<String, dynamic> map) {
    orderBookData = OrderBookModel.fromJson(map);
    notifyListeners();
  }

//updates the candle list displayed on the charts
  void updateCandleList(Map map) {
    if (candles.isNotEmpty) {
      candles.insert(
          0,
          Candle(
              date: DateTime.fromMillisecondsSinceEpoch(map['E']),
              high: double.parse(map['k']['h']),
              low: double.parse(map['k']['l']),
              open: double.parse(map['k']['o']),
              close: double.parse(map['k']['c']),
              volume: double.parse(map['k']['v'])));
    }

    notifyListeners();
  }

  void clearCandleList() {
    candles.clear();
    notifyListeners();
  }
}
