import 'package:crypto_font_icons/crypto_font_icons.dart';

const List<Map<String, dynamic>> tradingPairs = [
  {
    "symbol": "BTC/USDT",
    "value": "BTCUSDT",
    "icon": [CryptoFontIcons.BTC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "ETH/USDT",
    "value": "ETHUSDT",
    "icon": [CryptoFontIcons.ETH, CryptoFontIcons.USDT]
  },
  {
    "symbol": "ETC/USDT",
    "value": "ETCUSDT",
    "icon": [CryptoFontIcons.ETC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "AMP/USDT",
    "value": "AMPUSDT",
    "icon": [CryptoFontIcons.AMP, CryptoFontIcons.USDT]
  },
  {
    "symbol": "XMR/USDT",
    "value": "XMRUSDT",
    "icon": [CryptoFontIcons.XMR, CryptoFontIcons.USDT]
  },
  {
    "symbol": "ETH/BUSD",
    "value": "ETHBUSD",
    "icon": [CryptoFontIcons.ETH, CryptoFontIcons.USDT]
  },
  {
    "symbol": "ARB/USDT",
    "value": "ARGUSDT",
    "icon": [CryptoFontIcons.BTC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "SOL/USDT",
    "value": "SOLUSDT",
    "icon": [CryptoFontIcons.BTC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "LTC/USDT",
    "value": "LTCUSDT",
    "icon": [CryptoFontIcons.LTC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "DOGE/USDT",
    "value": "DOGEUSDT",
    "icon": [CryptoFontIcons.DOGE, CryptoFontIcons.USDT]
  },
  {
    "symbol": "USDT/TRY",
    "value": "USDTTRY",
    "icon": [CryptoFontIcons.TRIG, CryptoFontIcons.USDT]
  },
  {
    "symbol": "MTL/USDT",
    "value": "MTLUSDT",
    "icon": [CryptoFontIcons.MINT, CryptoFontIcons.USDT]
  },
  {
    "symbol": "RDNR/USDT",
    "value": "RNDRUSDT",
    "icon": [CryptoFontIcons.RBY, CryptoFontIcons.USDT]
  },
  {
    "symbol": "BNB/BUSD",
    "value": "BNBBUSD",
    "icon": [CryptoFontIcons.BTC, CryptoFontIcons.USDT]
  },
  {
    "symbol": "OP/USDT",
    "value": "OPUSDT",
    "icon": [CryptoFontIcons.BTC, CryptoFontIcons.USDT]
  },
];

String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();

const String candleStickDefaultSubscriptionMessage =
    '{"method":"SUBSCRIBE","params":["btcusdt@kline_1h"],"id":1}';

const String orderBookDefaultSubscriptionMessage =
    '{"method":"SUBSCRIBE","params":["btcusdt@depth"],"id":1}';
