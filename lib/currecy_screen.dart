import 'dart:convert';
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
    currency = parseCurrency("");
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
          FutureBuilder<Currency>(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.flags.toString()),
                    Text(snapshot.data!.name.toString()),
                    Text(snapshot.data!.currencies.toString())
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  List<Currency> parseCurrency(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Currency>((json) => Currency.fromJson(json)).toList();
  }

  Future<List<Currency>> fetchcurrency(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://restcountries.com/v3.1/all'));
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
