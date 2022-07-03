import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../view_model/CurrencyRates_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CurrencyRates"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: ListCurrencyViewModel().getUpdateTime(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  print(snapshot.data);
                  return Center(
                    child: Text("Last Update: " + snapshot.data!),
                  );
                } else {
                  return Center(
                    child: Text("Error !"),
                  );
                }
              }),
          Expanded(
            child: FutureBuilder(
                future: ListCurrencyViewModel().getCurList(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    print(snapshot.data);
                    return ListView.builder(
                        itemCount: 161,
                        itemBuilder: (BuildContext context, int i) {
                          return Card(
                              color: Colors.blueGrey,
                              elevation: 2.0,
                              child: Card(
                                  color: Colors.green,
                                  elevation: 2.0,
                                  child: ListTile(
                                    title: Text(
                                        "USD -> ${snapshot.data![i]["name"]}"),
                                    // subtitle: Text("BUY-> ${snapshot.data!.alis} || SELL-> ${snapshot.data!.satis}"),
                                    trailing:
                                        Text("${snapshot.data![i]["value"]}"),
                                  )));
                        });
                  } else {
                    return Center(
                      child: Text("Error !"),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
