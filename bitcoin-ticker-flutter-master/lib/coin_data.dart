import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String url;
  double criptoValue;
  CoinData({this.url});

  Future getCurrencyPrice() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        criptoValue = jsonDecode(response.body)['rate'];
        criptoValue.toInt();
        return criptoValue;
      } catch (e) {
        return e;
      }
    }
  }
}
