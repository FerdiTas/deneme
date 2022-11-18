import 'package:flutter/material.dart';
import 'package:search_app/model/ninja_model.dart';

import '../services/ninja_api_service.dart';

class NinjaList extends StatefulWidget {
  const NinjaList({super.key});

  @override
  State<NinjaList> createState() => _NinjaListState();
}

class _NinjaListState extends State<NinjaList> {
  // late String searchString;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NinjaModel> searchResult = <NinjaModel>[];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [searchArea(), filterArea()],
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(), // new
        children: [
          FutureBuilder<List<NinjaModel>>(
            future: NinjaApi.getNinjaData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NinjaModel> _listem = snapshot.data as List<NinjaModel>;

                if (textEditingController.text.isNotEmpty) {
                  List<NinjaModel> searchResult = (_listem as List<NinjaModel>)
                      .where((element) => element.name!
                          .toLowerCase()
                          .contains(textEditingController.text.toLowerCase()))
                      .toList();
                  _listem = searchResult;
                }
                return buildListView(_listem);
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("hata cıktı"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  ListView buildListView(List<NinjaModel> listem) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listem.length,
      itemBuilder: (context, index) {
        var onakiPokemon = listem[index];
        return Card(
          child: ListTile(
            title: Text(
              onakiPokemon.name.toString(),
            ),
            subtitle: Text(onakiPokemon.equipment.toString()),
            //trailing: Image.network(onakiPokemon.img.toString())
          ),
        );
      },
    );
  }

  Container searchArea() {
    return Container(
      width: 310,
      height: 100,
      padding: const EdgeInsets.only(left: 10, top: 22),
      child: TextFormField(
        controller: textEditingController,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {});
            },
          ),
          hintText: "search",
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3.1, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  Container filterArea() {
    return Container(
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
    );
  }
}
