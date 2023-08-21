import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:travel_demo/services/auth_services.dart';
import 'package:travel_demo/ui/shared/dashboard_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel App Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications screen
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.displayName ?? ""),
              accountEmail: Text(user.email!),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL ?? ""),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.explore),
              title: const Text("Explore"),
              onTap: () {
                Navigator.pushNamed(context, '/hotels');
              },
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text("Saved Places"),
              onTap: () {
                Navigator.pushNamed(context, '/saved');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              onTap: () {
                AuthenticationService().logout();
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              user.displayName != null
                  ? "Hello ${user.displayName}"
                  : "Welcome back!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                DashboardCard(
                  icon: Icons.hotel,
                  title: "Hotels",
                  onTap: () {
                    //Navigate to hotels screen
                    Navigator.pushNamed(context, '/hotels');
                  },
                ),
                DashboardCard(
                  icon: Icons.place,
                  title: "Places",
                  onTap: () {
                    // Navigate to places screen
                    Navigator.pushNamed(context, '/places');
                  },
                ),
                DashboardCard(
                  icon: Icons.restaurant,
                  title: "Restaurants",
                  onTap: () {
                    // Navigate to restaurants screen
                    Navigator.pushNamed(context, '/restaurants');
                  },
                ),
                DashboardCard(
                  icon: Icons.local_activity,
                  title: "Saved",
                  onTap: () {
                    // Navigate to savedPlaces screen
                    Navigator.pushNamed(context, '/saved');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
