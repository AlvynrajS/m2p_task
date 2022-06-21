import 'deu.dart';

class NativeName {
  Deu? deu;

  NativeName({this.deu});

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        deu: json['deu'] == null
            ? null
            : Deu.fromJson(json['deu'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'deu': deu?.toJson(),
      };
}
