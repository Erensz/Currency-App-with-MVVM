
class Currency {
  Currency({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });

  String result;
  String documentation;
  String termsOfUse;
  int timeLastUpdateUnix;
  String timeLastUpdateUtc;
  int timeNextUpdateUnix;
  String timeNextUpdateUtc;
  String baseCode;
  Map<String, double> conversionRates;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    result: json["result"],
    documentation: json["documentation"],
    termsOfUse: json["terms_of_use"],
    timeLastUpdateUnix: json["time_last_update_unix"],
    timeLastUpdateUtc: json["time_last_update_utc"],
    timeNextUpdateUnix: json["time_next_update_unix"],
    timeNextUpdateUtc: json["time_next_update_utc"],
    baseCode: json["base_code"],
    conversionRates: Map.from(json["conversion_rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
  );

}

class CurrencyRatesList {
  String name;
  double value;
  CurrencyRatesList({required this.name, required this.value});

  }


