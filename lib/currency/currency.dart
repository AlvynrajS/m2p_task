import 'capital_info.dart';
import 'car.dart';
import 'coat_of_arms.dart';
import 'demonyms.dart';
import 'flags.dart';
import 'idd.dart';
import 'languages.dart';
import 'maps.dart';
import 'name.dart';
import 'postal_code.dart';
import 'translations.dart';

class Currency {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Map<String, dynamic>? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<int>? latlng;
  bool? landlocked;
  List<String>? borders;
  int? area;
  Demonyms? demonyms;
  String? flag;
  Maps? maps;
  int? population;
  // Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  Currency({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    // this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.flags,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json['name'] == null
            ? null
            : Name.fromJson(json['name'] as Map<String, dynamic>),
        flags: json['flags'] == null
            ? null
            : Flags.fromJson(json['flags'] as Map<String, dynamic>),
        currencies: json['currencies'],
        cioc: json['cioc'] as String?,
      );

  // // tld: json['tld'] as List<String>?,
  // cca2: json['cca2'] as String?,
  // ccn3: json['ccn3'] as String?,
  // cca3: json['cca3'] as String?,
  // cioc: json['cioc'] as String?,
  // independent: json['independent'] as bool?,
  // status: json['status'] as String?,
  // unMember: json['unMember'] as bool?,
  // // currencies: json['currencies'] == null
  // //     ? null
  // //     : Currencies.fromJson(json['currencies'] as Map<String, dynamic>),
  // idd: json['idd'] == null
  //     ? null
  //     : Idd.fromJson(json['idd'] as Map<String, dynamic>),
  // // capital: json['capital'] as List<String>?,
  // // altSpellings: json['altSpellings'] as List<String>?,
  // region: json['region'] as String?,
  // subregion: json['subregion'] as String?,
  // languages: json['languages'] == null
  //     ? null
  //     : Languages.fromJson(json['languages'] as Map<String, dynamic>),
  // translations: json['translations'] == null
  //     ? null
  //     : Translations.fromJson(
  //         json['translations'] as Map<String, dynamic>),
  // // latlng: json['latlng'] as List<int>?,
  // landlocked: json['landlocked'] as bool?,
  // borders: json['borders'] as List<String>?,
  // area: json['area'] as int?,
  // demonyms: json['demonyms'] == null
  //     ? null
  //     : Demonyms.fromJson(json['demonyms'] as Map<String, dynamic>),
  // flag: json['flag'] as String?,
  // maps: json['maps'] == null
  //     ? null
  //     : Maps.fromJson(json['maps'] as Map<String, dynamic>),
  // population: json['population'] as int?,
  // // gini: json['gini'] == null
  // //     ? null
  // //     : Gini.fromJson(json['gini'] as Map<String, dynamic>),
  // fifa: json['fifa'] as String?,
  // car: json['car'] == null
  //     ? null
  //     : Car.fromJson(json['car'] as Map<String, dynamic>),
  // timezones: json['timezones'] as List<String>?,
  // continents: json['continents'] as List<String>?,
  // // flags: json['flags'] == null
  // //     ? null
  // //     : Flags.fromJson(json['flags'] as Map<String, dynamic>),
  // coatOfArms: json['coatOfArms'] == null
  //     ? null
  //     : CoatOfArms.fromJson(json['coatOfArms'] as Map<String, dynamic>),
  // startOfWeek: json['startOfWeek'] as String?,
  // capitalInfo: json['capitalInfo'] == null
  //     ? null
  //     : CapitalInfo.fromJson(json['capitalInfo'] as Map<String, dynamic>),
  // postalCode: json['postalCode'] == null
  //     ? null
  //     : PostalCode.fromJson(json['postalCode'] as Map<String, dynamic>),
  // );

  Map<String, dynamic> toJson() => {
        'name': name?.toJson(),
        'tld': tld,
        'cca2': cca2,
        'ccn3': ccn3,
        'cca3': cca3,
        'cioc': cioc,
        'independent': independent,
        'status': status,
        'unMember': unMember,
        'currencies': currencies,
        'idd': idd?.toJson(),
        'capital': capital,
        'altSpellings': altSpellings,
        'region': region,
        'subregion': subregion,
        'languages': languages?.toJson(),
        'translations': translations?.toJson(),
        'latlng': latlng,
        'landlocked': landlocked,
        'borders': borders,
        'area': area,
        'demonyms': demonyms?.toJson(),
        'flag': flag,
        'maps': maps?.toJson(),
        'population': population,
        // 'gini': gini?.toJson(),
        'fifa': fifa,
        'car': car?.toJson(),
        'timezones': timezones,
        'continents': continents,
        'flags': flags?.toJson(),
        'coatOfArms': coatOfArms?.toJson(),
        'startOfWeek': startOfWeek,
        'capitalInfo': capitalInfo?.toJson(),
        'postalCode': postalCode?.toJson(),
      };
}
