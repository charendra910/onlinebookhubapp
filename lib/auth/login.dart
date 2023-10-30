import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/API/apis.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlinebookhubapp/screens/btm_bar.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Online Book Hub',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Image.asset('assets/images/offres/slide2.jpeg', height: 180),
              // Add your logo image

              SizedBox(
                height: 20,
              ),

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
                          SizedBox(
                            height: 15,
                          ),

                          //   Text("-----or login with-----"),

                          //   SizedBox(height: 15,),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //    // Text("-----or login with-----"),
                          //   GestureDetector(
                          //     onTap: _googleSignIn,
                          //     child: Container(
                          //       height: 50,
                          //       width: 50,
                          //       child: Image.asset("assets/images/google.png"),

                          //     ),
                          //   )
                          // ],),
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
                                      // Replace this line with your sign-in logic
                                      bool signInSuccess =
                                          APIs.signIn(email, password, context);

                                      if (signInSuccess) {
                                        // Sign-in was successful, navigate to the appropriate page
                                        // Here, you should navigate to the main page of your app
                                      } else {
                                        // Sign-in failed
                                        // Display an error message if needed
                                      }
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

                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "-----or login with-----",
                            style: TextStyle(fontSize: 20),
                          ),

                          SizedBox(
                            height: 19,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text("-----or login with-----"),
                              GestureDetector(
                                onTap: _googleSignIn,
                                child: Container(
                                  height: 50,
                                  width: 372, // Adjust the width as needed
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white, // Background color
                                    border: Border.all(
                                        color: Colors.black), // Border color
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/google.png"), // Google PNG image
                                    ],
                                  ),
                                ),
                              )
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
                                      // Replace this line with your sign-up logic
                                      bool signUpSuccess = APIs.signUp(email,
                                          password, name, address, context);

                                      if (signUpSuccess) {
                                        // Sign-up was successful, navigate to the LoginPage and show message
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage(signupSuccessful: true,)), // Replace 'HomePage()' with the appropriate constructor for your 'HomePage' widget
                                        );
                                      } else {
                                        // Sign-up failed
                                        // Display an error message if needed
                                      }
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
      ),
    );
  }

  Future<void> _googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(
        forceCodeForRefreshToken: true,
      ).signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (authResult.user != null) {
          // Successfully signed in with Google. You can now use authResult.user for further actions.
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BottomBarScreen()), // Replace 'HomePage()' with the appropriate constructor for your 'HomePage' widget
          );
          print("pressed google sign in ");
        } else {
          // Handle sign-in failure.
          print('Google Sign-In failed.');
        }
      } else {
        // Handle canceled sign-in.
        print('Google Sign-In canceled.');
      }
    } catch (error) {
      // Handle other errors.
      print('Error during Google Sign-In: $error');
    }
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

class LoginPage extends StatefulWidget {
  final bool signupSuccessful;

  LoginPage({Key? key, required this.signupSuccessful});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.signupSuccessful)
              Text(
                'Signup Successful!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            // ... (rest of the login page UI)
          ],
        ),
      ),
    );
  }
}

// ... (RoundedTextField and other widgets)