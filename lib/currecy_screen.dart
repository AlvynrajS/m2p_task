import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Currency",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36)),
            const Text("Choose your country",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                    color: Colors.grey)),
            FutureBuilder<List<Currency>>(
              future: fetchcurrency(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        Currency currency = snapshot.data![index];

                        Map<String, dynamic>? symbol =
                            currency.toJson()["currencies"];

                        // Text(
                        //       currency.currencies?.toJson().keys.first ?? ''),

                        return ListTile(
                          leading: Image.network(
                            currency.flags?.png ?? '',
                            width: 50,
                            height: 50,
                          ),
                          title: Text(currency.name?.common?.toString() ?? ''),
                          trailing: Text(symbol?.keys.first ?? ''),
                        );
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
      ),
    );
  }

  List<Currency> parseCurrency(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Currency>((json) => Currency.fromJson(json)).toList();
  }

  Future<List<Currency>> fetchcurrency() async {
    var url = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await http.get(url);

    return parseCurrency(response.body);
  }
}

// class CurrencyList extends StatelessWidget {
//   const CurrencyList({Key? key, required this.currency}) : super(key: key);

//   final List<Currency> currency;

//   @override

//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: currency.length,
//       itemBuilder:(context, index){
//         return Text(currency[index][flags].toString());
//       }
      
//       );
//   }
// }
