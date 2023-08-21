import 'package:flutter/material.dart';
import 'package:travel_demo/data/json_data.dart';
import 'package:travel_demo/models/hotel_model.dart';
import 'package:travel_demo/ui/shared/state_hotel_tile.dart';

class HotelsView extends StatefulWidget {
  const HotelsView({super.key});

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  TextEditingController searchHotelsController = TextEditingController();
  List<HotelRestaurantModel> filteredPlaces = [];
  List<HotelRestaurantModel> unFilteredPlaces = [];
  final TextEditingController searchPlacesController = TextEditingController();
  ReadJsonData data = ReadJsonData();
  bool isLoading = true;

  Future<dynamic> fetchPlaces() async {
    var result = await data.loadHotels();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(
        () {
          unFilteredPlaces = filteredPlaces = result;
          isLoading = false;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchPlaces();
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
                    'Hotels',
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
                  controller: searchHotelsController,
                  hintText: 'Search State',
                  onChanged: (value) {
                    if (value.isEmpty) {
                      filteredPlaces = unFilteredPlaces;
                    } else {
                      filteredPlaces = unFilteredPlaces
                          .where((e) => e.state
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      )
                    : filteredPlaces.isEmpty
                        ? const Center(
                            heightFactor: 30,
                            child: Text("No states"),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: filteredPlaces.length,
                              itemBuilder: (context, int index) =>
                                  StateTile(state: filteredPlaces[index]),
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
