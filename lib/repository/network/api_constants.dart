class ApiConstants {
 //static String establishConnectionUrl = "wss://fstream.binance.com:9443/ws";
 static String establishConnectionUrl = "wss://testnet.binance.vision/ws";
  static String symbolsUrl = "https://testnet.binance.vision/api/v3/ticker/price";
  static String symbolUrl(String symbol) =>
      "https://testnet.binance.vision/api/v3/ticker/24hr?symbol=$symbol";
  static String candlesUrl(
          {required String symbol, required String interval, int? endTime}) =>
      "https://testnet.binance.vision/api/v3/klines?symbol=$symbol&interval=$interval${endTime != null ? "&endTime=$endTime" : ""}";
  static String orderBooksUrl({required String symbol, required int limit}) =>
      "https://testnet.binance.vision/api/v3/depth?symbol=$symbol&limit=$limit";
  static String exchangeInfoUrl(String symbol) =>
      "https://testnet.binance.vision/api/v3/exchangeInfo?symbol=$symbol";
}
