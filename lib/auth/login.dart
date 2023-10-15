import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/API/apis.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String address = '';
  bool signIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/offres/slide4.jpg', width: 150, height: 150), // Add your logo image
            Form(
              key: formKey,
              child: signIn == true
                  ? Column(
                      children: [
                        RoundedTextField(
                          key: ValueKey('email'),
                          hintText: 'Enter your email',
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('password'),
                          hintText: 'Enter your password',
                          obscureText: true,
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  signIn = false;
                                });
                              },
                              child: Text('Sign Up'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    APIs.signIn(email, password, context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RoundedTextField(
                          key: ValueKey('name'),
                          hintText: 'Name',
                          onSaved: (value) {
                            setState(() {
                              name = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                        ),
                       
                        RoundedTextField(
                          key: ValueKey('address'),
                          hintText: 'Address',
                          onSaved: (value) {
                            setState(() {
                              address = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid address';
                            } else {
                              return null;
                            }
                          },
                        ),
                       
                        RoundedTextField(
                          key: ValueKey('email'),
                          hintText: 'Enter your email',
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedTextField(
                          key: ValueKey('password'),
                          hintText: 'Enter your password',
                          obscureText: true,
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  signIn = true;
                                });
                              },
                              child: Text('Sign In'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    APIs.signUp(email, password, name, address, context);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  
  final ValueKey? key;

  RoundedTextField({
    required this.key,
    required this.hintText,
    this.obscureText = false,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}