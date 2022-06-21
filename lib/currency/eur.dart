class Eur {
  String? name;
  String? symbol;

  Eur({this.name, this.symbol});

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
        name: json['name'] as String?,
        symbol: json['symbol'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'symbol': symbol,
      };
}
