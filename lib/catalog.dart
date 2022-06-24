import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final String _title = "Your Pokedex";
  final String _text =
      "Who are you looking for? Search for a Pokemon by name or using its National Pokedex number.";
  final String _hintText = "Search for a Pokemon";

  final List<String> _listItem = [
    "assets/images/bulbasaur.png",
    "assets/images/charmander.png",
    "assets/images/gengaar.png",
    "assets/images/jiggly.png",
    "assets/images/pika.png",
    "assets/images/squirtle.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
        title: Text(
          _title,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: ProjectPadding.pagePaddingHorizontal,
        child: Container(
          child: Column(
            children: [
              Text(_text),
              sizedBox(),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[850],
                  ),
                  hintText: _hintText,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map((item) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox sizedBox() => SizedBox(height: 20);
}

class ProjectPadding {
  static const pagePaddingHorizontal = EdgeInsets.symmetric(horizontal: 18);
}
