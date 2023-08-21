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
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/description',
        arguments: widget.info,
      ),
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.info.image),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.info.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
