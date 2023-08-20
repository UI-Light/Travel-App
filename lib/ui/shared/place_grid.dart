import 'package:flutter/material.dart';
import 'package:travel_demo/models/place_model.dart';

class PlaceGrid extends StatefulWidget {
  final Place info;

  const PlaceGrid({
    super.key,
    required this.info,
    // required this.placeName,
  });

  @override
  State<PlaceGrid> createState() => _PlaceGridState();
}

class _PlaceGridState extends State<PlaceGrid> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Image.network(
            widget.info.image,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                widget.info.description,
                // style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
