import 'package:flutter/material.dart';
import 'package:search_app/widgets/user_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //String? secilen_harf = "A";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //color: Colors.red,
                  width: 310,
                  height: 100,
                  padding: const EdgeInsets.only(left: 10, top: 22),
                  child: const TextField(
                    //onChanged: (text) => search(text),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "serach",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.1, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: DropdownButton(
                    icon: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.tune,
                        size: 32,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(child: Text("A"), value: "A"),
                      DropdownMenuItem(child: Text("B"), value: "B"),
                      DropdownMenuItem(child: Text("C"), value: "C"),
                    ],
                    onChanged: (String? deger) {
                      //secilen_harf = deger;
                    },
                  ),
                )
              ],
            ),
            Container(
              height: 50,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.green),
                )),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text(
                  "results",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(child: userWidget()),
          ],
        ),
      ),
    );
  }
}
