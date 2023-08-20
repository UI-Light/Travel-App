import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StateTile extends StatelessWidget {
  final String state;

  StateTile({
    Key? key,
    required this.state,
  }) : super(key: key);

  final Uri _url = Uri.parse(
      "https://www.google.com/maps/search/restaurants+in+Enugu/@6.4466217,7.5146669,14z/data=!3m1!4b1?entry=ttu");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        state,
      ),
      trailing: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2.0, color: Color(0xFF757575))),
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
