import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_demo/ui/views/dashboard_view.dart';
import 'package:travel_demo/ui/views/login_view.dart';

//determines if the user is authenticated
//listens for auth changes
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        //
        stream: FirebaseAuth.instance
            .authStateChanges(), //listens for auth changes, everytime the user signs in or signs out
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong!'),
            );
          } else if (snapshot.hasData) {
            return const DashboardView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
