import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:travel_demo/services/auth_services.dart";
import "package:travel_demo/utils/validator.dart";

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'assets/images/logo.png',
                scale: 2.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      validator: (value) => Validator.validateName(value!),
                      controller: nameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD7D7D7))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          label: Text(
                            'FullName',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      validator: (value) => Validator.validateEmail(value!),
                      controller: emailController,
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
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      validator: (value) => Validator.validatePassword(value!),
                      controller: passwordController,
                      obscureText: isVisible1,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                isVisible1 = !isVisible1;
                              });
                            },
                            icon: !isVisible1
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == passwordController.text) {
                          return null;
                        } else {
                          return 'Password does not match';
                        }
                      },
                      controller: confirmPasswordController,
                      obscureText: isVisible2,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                isVisible2 = !isVisible2;
                              });
                            },
                            icon: isVisible2
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD7D7D7))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD7D7D7))),
                          label: const Text(
                            'Confirm Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF3D3A48))),
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        final user = AuthenticationService()
                            .signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              fullName: nameController.text.trim(),
                            )
                            .then((value) => setState(
                                  () {
                                    loading = false;
                                  },
                                ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Register'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: const Color(0xFFD7D7D7),
                          ),
                        ),
                        const Text(' Or '),
                        Expanded(
                          child: Container(
                            height: 2,
                            color: const Color(0xFFD7D7D7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthenticationService().googleLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/google.png'),
                            const Text(
                              ' Signup with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text(
                            'SignIn',
                            //style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
