import 'package:flutter/material.dart';
import 'package:travel_demo/models/place_model.dart';
import 'package:travel_demo/ui/shared/auth_wrapper.dart';
import 'package:travel_demo/ui/views/dashboard_view.dart';
import 'package:travel_demo/ui/views/description_view.dart';
import 'package:travel_demo/ui/views/hotels_view.dart';
import 'package:travel_demo/ui/views/login_view.dart';
import 'package:travel_demo/ui/views/map_web_view.dart';
import 'package:travel_demo/ui/views/onboarding_screen.dart';
import 'package:travel_demo/ui/views/places_view.dart';
import 'package:travel_demo/ui/views/restaurants_view.dart';
import 'package:travel_demo/ui/views/saved_places_view.dart';
import 'package:travel_demo/ui/views/signup_view.dart';
import 'package:travel_demo/ui/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/onBoarding': (context) => const OnBoardingScreen(),
        '/authWrapper': (context) => const AuthenticationWrapper(),
        '/signup': (context) => const SignupView(),
        '/login': (context) => const LoginView(),
        '/dashboard': (context) => const DashboardView(),
        '/hotels': (context) => const HotelsView(),
        '/places': (context) => const PlacesView(),
        '/restaurants': (context) => const RestaurantsView(),
        '/saved': (context) => const SavedPlacesView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/description") {
          final place = settings.arguments as Place;
          return MaterialPageRoute(
            builder: (_) => DescriptionView(place: place),
          );
        }
        if (settings.name == "/map") {
          final url = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => MapWebView(url: url),
          );
        }
      },
    );
  }
}
