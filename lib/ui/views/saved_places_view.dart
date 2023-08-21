import 'package:flutter/material.dart';
import 'package:travel_demo/data/database.dart';
import 'package:travel_demo/models/place_model.dart';
import 'package:travel_demo/ui/shared/place_grid.dart';

class SavedPlacesView extends StatefulWidget {
  const SavedPlacesView({super.key});

  @override
  State<SavedPlacesView> createState() => _SavedPlacesViewState();
}

class _SavedPlacesViewState extends State<SavedPlacesView> {
  List<Place> places = [];
  final TextEditingController searchPlacesController = TextEditingController();
  bool isLoading = true;

  void _loadPlaces() async {
    setState(() {
      isLoading = true;
    });
    final result = await Database.getPlaces();
    setState(() {
      places = result;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadPlaces);
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
                    'Saved Places',
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
                    : places.isEmpty
                        ? const Center(
                            heightFactor: 30,
                            child: Text("No saved places"),
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
                              itemBuilder: (context, int index) => PlaceGrid(
                                info: places[index],
                                callback: _loadPlaces,
                              ),
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
