import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:travel_demo/data/database.dart";
import "package:travel_demo/models/place_model.dart";
import "package:url_launcher/url_launcher.dart";

class DescriptionView extends StatefulWidget {
  final Place place;
  const DescriptionView({super.key, required this.place});

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool _isSaved = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        _isSaved = (await Database.getPlace(widget.place.url)) != null;
        setState(() {});
      },
    );
  }

  Future<void> addOrRemovePlace() async {
    if (_isSaved) {
      await Database.removePlace(widget.place);
      setState(() {
        _isSaved = false;
      });
    } else {
      await Database.savePlace(widget.place);
      setState(() {
        _isSaved = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: const Color(0xFF3D3A48),
                  ),
                  Expanded(
                    child: Text(
                      widget.place.name,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    color: Color(0xFF3D3A48),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(widget.place.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF0d6fe5),
                    //Color(0xFF0d6fe5),
                  ),
                  child: const Center(
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    widget.place.description,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            addOrRemovePlace();
                          },
                          icon: Icon(
                            _isSaved ? Icons.favorite : Icons.favorite_border,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(widget.place.url));
                        // Navigator.of(context).pushNamed(
                        //   "/map",
                        //   arguments: widget.place.url,
                        // );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 16,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: (Color(0xFF3D3A48))),
                        child: Center(
                          child: Text(
                            'View in Map',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
