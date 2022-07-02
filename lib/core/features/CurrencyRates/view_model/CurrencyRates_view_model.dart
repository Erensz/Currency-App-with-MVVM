import 'package:my_finance/core/features/CurrencyRates/model/CurrencyRates.dart';
import 'package:my_finance/core/features/CurrencyRates/service/dataService.dart';

class ListCurrencyViewModel{
List<CurModel>? curs;

  static Future<Currency> getCurrencies() async{
    var data = await dataService.fetchCurrencys();
    return data;

  }

  Future<Map<String, double>> name () async {
    var data = await getCurrencies();
    var cur = data as Currency;
    var curMap = cur.conversionRates;
    return curMap;

  }

}
class CurModel{
  final CurModel? curModel;
  CurModel(this.curModel);
}

