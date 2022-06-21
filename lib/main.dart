import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m2p_task/currecy_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 40, left: 25, bottom: 25, right: 25),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text("Settings",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: Colors.black)),
              ),
              Container(
                height: 50,
                width: 50,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGklsFaxd-XkQwGsvK83bGKyWfJQMnGMi4kQ&usqp=CAU",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child:
                Wrap(direction: Axis.horizontal, spacing: 1.0, runSpacing: 1.0,
                    // alignment: WrapAlignment.spaceEvenly,
                    // runAlignment: WrapAlignment.spaceEvenly,
                    children: [
                  buildContainer(
                      "https://freeiconshop.com/wp-content/uploads/edd/notification-outline.png",
                      // Icons.notification_add,
                      Colors.red,
                      "Notification"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CurrencyScreen()));
                    },
                    child: buildContainer(
                        "https://cdn-icons-png.flaticon.com/512/126/126157.png",
                        // Icons.money,
                        Colors.blue,
                        "Currency"),
                  ),
                  buildContainer(
                      "https://i.pinimg.com/originals/fe/7f/4b/fe7f4b418e2778863247a7dcc6aed421.png",
                      // Icons.payment,
                      Colors.green,
                      "Payment Methods"),
                  buildContainer(
                      "https://cdn2.iconfinder.com/data/icons/privacy-policy/512/privacy-data-policy-security-12-512.png",
                      // Icons.private_connectivity,
                      Colors.purple,
                      "Privacy Shortcuts"),
                  buildContainer(
                      "https://prints.ultracoloringpages.com/13d1340d6674a51114e790ef4eebade5.png",
                      // Icons.note,
                      Colors.orange,
                      "Activity log"),
                  buildContainer(
                      "https://www.bancosol.com.bo/sites/default/files/1698490.png",
                      // Icons.note,
                      Colors.pink,
                      "Terms & Ploicies")
                ]),
          )
        ]),
      ),
    )));
  }

  Widget buildContainer(String url, Color color, String title) {
    return Card(
      elevation: 15.0,
      child: Container(
        height: 180,
        width: 140,
        decoration: BoxDecoration(border: Border.all(color: Colors.white),
            // border: Border.all(width: 1),
            boxShadow: const [
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0))
            ]),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 50,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.network(url, color: color, fit: BoxFit.cover)),
              // Icon(icon, color: color),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
