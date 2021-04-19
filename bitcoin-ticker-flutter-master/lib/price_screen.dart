import 'package:bitcoin_ticker/crytoPriceComp.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  static String selectedCurrency = 'USD';
  static String apiKey = 'C10F19AA-674D-46D7-AFBE-B9795D76D3C2';

  dynamic btcVal = 'FETCHING DATA...';
  dynamic ethVal = 'FETCHING DATA...';
  dynamic ltcVal = 'FETCHING DATA...';

  void getData(String selectedCurrency) async {
    try {
      btcVal = await CoinData(
              url:
                  'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apiKey')
          .getCurrencyPrice();
      ethVal = await CoinData(
              url:
                  'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=$apiKey')
          .getCurrencyPrice();
      ltcVal = await CoinData(
              url:
                  'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=$apiKey')
          .getCurrencyPrice();

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData('USD');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' CryptoCurrency Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoPriceComp(
              criptoType: 'BTC',
              criptoVal: btcVal,
              selectedCurrency: selectedCurrency),
          CryptoPriceComp(
              criptoType: 'ETH',
              criptoVal: ethVal,
              selectedCurrency: selectedCurrency),
          CryptoPriceComp(
              criptoType: 'LTC',
              criptoVal: ltcVal,
              selectedCurrency: selectedCurrency),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.deepPurple,
            child: DropdownButton<String>(
              items: [
                for (String currency in currenciesList)
                  DropdownMenuItem(
                    child: Text(currency),
                    value: currency,
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                  getData(selectedCurrency);
                });
              },
              value: selectedCurrency,
            ),
          ),
        ],
      ),
    );
  }
}
