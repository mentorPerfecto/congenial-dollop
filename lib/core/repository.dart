import 'dart:convert';

import 'package:accessment/repository/network/api_constants.dart';
import 'package:accessment/src/models.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';


class Repository {
  Future<List<Candle>> fetchCandles(
      {required String symbol, required String interval, int? endTime}) async {
    final uri = Uri.parse(ApiConstants.candlesUrl(
        symbol: symbol, interval: interval, endTime: endTime));
    final res = await http.get(uri);
    return (jsonDecode(res.body) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  Future<List<Ticker>> fetchSymbols() async {
    final uri = Uri.parse(ApiConstants.symbolsUrl);
    final res = await http.get(uri);
    return List<Ticker>.from(
        (jsonDecode(res.body) as List<dynamic>).map((x) => Ticker.fromMap(x)));
  }

  Future<Ticker> fetchSymbol(String symbol) async {
    final uri = Uri.parse(ApiConstants.symbolUrl(symbol));
    final res = await http.get(uri);
    return Ticker.fromJson(res.body);
  }

  Future<OrderBook> fetchOrderBook(
      {required String symbol, required int limit}) async {
    final uri =
        Uri.parse(ApiConstants.orderBooksUrl(symbol: symbol, limit: limit));
    final res = await http.get(uri);
    return OrderBook.fromJson(res.body);
  }

  Future<ExchangeSymbol> fetchExchangeInfo(String symbol) async {
    final uri = Uri.parse(ApiConstants.exchangeInfoUrl(symbol));
    final res = await http.get(uri);
    return ExchangeSymbol.fromMap(jsonDecode(res.body)['symbols'][0]);
  }

  WebSocketChannel establishConnection(
      String symbol, String interval, int limit) {
    final channel = WebSocketChannel.connect(
      Uri.parse(ApiConstants.establishConnectionUrl),
    );
    channel.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["$symbol@kline_$interval"],
          "id": 1
        },
      ),
    );
    channel.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["$symbol@depth"],
          "id": 2
        },
      ),
    );
    return channel;
  }
}
