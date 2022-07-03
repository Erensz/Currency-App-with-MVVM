import 'package:my_finance/core/features/CurrencyRates/model/CurrencyRates.dart';
import 'package:my_finance/core/features/CurrencyRates/service/dataService.dart';

class ListCurrencyViewModel {
  Future<Currency> getCurrencies() async {
    var data = await dataService.fetchCurrencys();
    return data;
  }

  Future<List<Map<String, dynamic>>> getCurList() async {
    List<Map<String, dynamic>> currencyList = <Map<String, dynamic>>[];
    var data = await getCurrencies();
    var cur = data as Currency;
    var curMap = cur.conversionRates;
    curMap.forEach((key, value) {
      currencyList.add({"name": key, "value": value});
    });
    return currencyList;
  }
  Future<String> getUpdateTime() async {
    var data = await getCurrencies();
    var cur = data as Currency;
    return cur.timeLastUpdateUtc;
  }
}
