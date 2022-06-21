import 'eng.dart';
import 'fra.dart';

class Demonyms {
  Eng? eng;
  Fra? fra;

  Demonyms({this.eng, this.fra});

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json['eng'] == null
            ? null
            : Eng.fromJson(json['eng'] as Map<String, dynamic>),
        fra: json['fra'] == null
            ? null
            : Fra.fromJson(json['fra'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'eng': eng?.toJson(),
        'fra': fra?.toJson(),
      };
}
