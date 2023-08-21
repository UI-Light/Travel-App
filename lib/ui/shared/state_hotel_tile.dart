import 'package:flutter/material.dart';
import 'package:travel_demo/models/hotel_model.dart';
import 'package:url_launcher/url_launcher.dart';

class StateTile extends StatelessWidget {
  final HotelRestaurantModel state;

  StateTile({
    Key? key,
    required this.state,
  }) : super(key: key);

  late final Uri _url = Uri.parse(state.url);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        state.state,
      ),
      trailing: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2.0, color: const Color(0xFF757575))),
        child: GestureDetector(
          onTap: () {
            _launchUrl();
          },
          child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'View in Map',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w400),
                ),
              ]),
        ),
      ),
    );
  }
}
