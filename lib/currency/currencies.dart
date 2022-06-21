import 'eur.dart';

class Currencies {
  Eur? eur;

  Currencies({this.eur});

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        eur: json['EUR'] == null
            ? null
            : Eur.fromJson(json['EUR'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'EUR': eur?.toJson(),
      };
}
