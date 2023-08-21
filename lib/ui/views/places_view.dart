import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;
import 'package:travel_demo/data/json_data.dart';
import "package:travel_demo/models/place_model.dart";
import "package:travel_demo/ui/shared/place_grid.dart";
import "package:travel_demo/ui/views/description_view.dart";
import 'package:travel_demo/models/state_model.dart';

class PlacesView extends StatefulWidget {
  const PlacesView({super.key});

  @override
  State<PlacesView> createState() => _PlacesViewState();
}

class _PlacesViewState extends State<PlacesView> {
  List<Place> places = [];
  final TextEditingController searchPlacesController = TextEditingController();
  ReadJsonData data = ReadJsonData();
  bool isLoading = true;

  Future<dynamic> fetchPlace() async {
    var result = await data.loadPlaces();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => setState(
        () {
          places = result.map((e) => e.places).toList().fold(
            //grabs all the nested list and combines their values into a single list
            [],
            (previousValue, currentValue) =>
                [...previousValue, ...currentValue],
          );
          isLoading = false;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchPlace();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Places',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SearchBar(
                  leading: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  controller: searchPlacesController,
                  hintText: 'Search Places',
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      )
                    : Expanded(
                        child: GridView.builder(
                          itemCount: places.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                          ),
                          itemBuilder: (context, int index) =>
                              PlaceGrid(info: places[index]),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
