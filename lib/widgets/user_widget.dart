import 'package:flutter/material.dart';

Widget userWidget() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            child: ListTile(
              //leading: Image.asset(),
              title: Text("AAA"),
              subtitle: Text("BBB"),
              trailing: Text("CCC"),
            ),
          );
        },
      );
    },
  );
}
