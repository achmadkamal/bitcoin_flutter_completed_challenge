//2. Import the required packages.
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'A65E8FE5-1C85-40F6-AD98-AAA2645BCEFC';
const bitcoinAverageURL ='https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(String selectedCurrency) async {
    //TODO 4: Update the URL to use the selectedCurrency input.
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

// '$bitcoinAverageURL/BTC$selectedCurrency';
//
// String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';
