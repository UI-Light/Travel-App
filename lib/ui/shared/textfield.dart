import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({super.key});

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD7D7D7))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD7D7D7))),
              label: Text(
                'Email',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: TextFormField(
            obscureText: isVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: !isVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD7D7D7))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD7D7D7))),
              label: const Text(
                'Password',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
