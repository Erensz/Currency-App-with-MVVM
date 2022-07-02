import 'dart:convert';

import 'package:my_finance/core/features/CurrencyRates/model/CurrencyRates.dart';
import 'package:http/http.dart' as http;

class dataService {

  static Future<Currency> fetchCurrencys() async {
    late Currency currency;
    final url = "https://v6.exchangerate-api.com/v6/d19240bf14c4495308478437/latest/USD";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
      var decodeJson = json.decode(response.body);
      currency = Currency.fromJson(decodeJson);
      return currency;
    }
    else
      throw Exception("err");

  }
}

