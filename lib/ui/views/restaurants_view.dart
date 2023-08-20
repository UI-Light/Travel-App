import 'package:flutter/material.dart';
import 'package:travel_demo/ui/shared/state_hotel_tile.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key});

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  TextEditingController searchHotelsController = TextEditingController();
  final List States = [
    "Abia",
    "Abuja",
    "Adamawa",
    "Akwa Ibom",
    "Anambra",
    "Bauchi",
    "Bayelsa",
    "Benue",
    "Borno",
    "Cross River",
    "Delta",
    "Ebonyi",
    "Edo",
    "Ekiti",
    "Enugu",
    "Gombe",
    "Imo",
    "Jigawa",
    "Kaduna",
    "Kano",
    "Katsina",
    "Kebbi",
    "Kogi",
    "Kwara",
    "Lagos",
    "Nasarawa",
    "Niger",
    "Ogun",
    "Ondo",
    "Osun",
    "Oyo",
    "Plateau",
    "Rivers",
    "Sokoto",
    "Taraba",
    "Zamfara"
  ];
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
                    'Restaurants',
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
                  hintText: 'Search',
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      StateTile(state: 'Abia'),
                      StateTile(state: 'Abuja'),
                      StateTile(state: 'Adamawa'),
                      StateTile(state: 'Akwa Ibom'),
                      StateTile(state: 'Anambra'),
                      StateTile(state: 'Bayelsa'),
                      StateTile(state: 'Benue'),
                      StateTile(state: 'Borno'),
                      StateTile(state: 'Cross river'),
                      StateTile(state: 'Delta'),
                      StateTile(state: 'Ebonyi'),
                      StateTile(state: 'Edo'),
                      StateTile(state: 'Ekiti'),
                      StateTile(state: 'Enugu'),
                      StateTile(state: 'Imo'),
                      StateTile(state: 'Jigawa'),
                      StateTile(state: 'Kaduna'),
                      StateTile(state: 'Kano'),
                    ],
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