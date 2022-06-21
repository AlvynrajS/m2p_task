import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:m2p_task/currency/currency.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  late final List<Currency> currency;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Currency",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
          Text("Choose your country",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16)),
          FutureBuilder<List<Currency>>(
            future: fetchcurrency(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      Currency country = snapshot.data![index];

                      Map<String, dynamic>? currency =
                          country.toJson()["currencies"];

                      //printCurrency(currency?.keys.first ?? '');

                      // Text(
                      //       currency.currencies?.toJson().keys.first ?? ''),

                      return ListTile(
                          leading: Image.network(
                            country.flags?.png ?? '',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(country.name?.common?.toString() ?? ''),
                          trailing:
                              Text(getCurrency(currency?.keys.first ?? '')));
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Center(child: const CircularProgressIndicator());
            },
          )
        ],
      ),
    );
  }

  List<Currency> parseCurrency(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    List<Currency> countryList =
        parsed.map<Currency>((json) => Currency.fromJson(json)).toList();

    countryList.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));

    return countryList;
  }

  Future<List<Currency>> fetchcurrency() async {
    var url = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await http.get(url);

    return parseCurrency(response.body);
  }

  String getCurrency(String countryCode) {
    var format = NumberFormat.simpleCurrency(
        locale: Platform.localeName, name: countryCode);
    return format.currencySymbol;
  }
}
