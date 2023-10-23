// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:onlinebookhubapp/auth/login.dart';
import 'package:onlinebookhubapp/providers/dark_theme_provider.dart';
import 'package:onlinebookhubapp/screens/cart/cart_screen.dart';
import 'package:onlinebookhubapp/screens/whatlist/view.dart';
import 'package:onlinebookhubapp/screens/whatlist/whatchlist.dart';
import 'package:onlinebookhubapp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: "");
  String name = '';
  String email = '';
  String address = '';
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  Future<void> getDetails() async {
    DocumentSnapshot doc =  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    
    name = doc['name'];
    email = FirebaseAuth.instance.currentUser!.email.toString();
    address = doc['address'];
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Hi, ',
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: name,
                            style: TextStyle(
                              color: color,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("My name is harendra");
                              })
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: email,
                  color: color,
                  textSize: 18,
                  //isTitle: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                  title: 'Address',
                  subtitle: address,
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialogue();
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Carts Details',
                  icon: IconlyLight.bag,
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Wishlist',
                  icon: IconlyLight.heart,
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>WatchScreen()));
                  },
                  color: color,
                ),
                _listTiles(
                  title: 'Viewd',
                  icon: IconlyBold.show,
                  onPressed: () {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>view()));

                  },
                  color: color,
                ),
               
                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'Light mode',
                    color: color,
                    textSize: 20,
                    //isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                  },
                  value: themeState.getDarkTheme,
                ),
                const SizedBox(
                  height: 15,
                ),
                _listTiles(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () {
                    _showLogoutDialog();
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              const Text("Sign Out"),
            ]),
            content: const Text("Do you want to sign out?"),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: TextWidget(
                 text: 'Cancel',
                 color: Colors.cyan,
                 textSize: 18,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SignInPage()));
                },
                child: TextWidget(
                 text: 'OK',
                 color: Colors.red,
                 textSize: 18,
                ),
              ),
            ],
        );
      });
  }

  Future<void> _showAddressDialogue() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              //  onChanged: (value) {
              //   print('_addressTextController.text ${_addressTextController.text}');
              //  },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: "Your address"),
            ),
            actions: [
              TextButton(onPressed: () async{
                await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({'address':_addressTextController.text});
                Navigator.of(context).pop();
                getDetails();
              }, child: const Text("Update")),
            ],
          );
        });
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        //isTitle: true,
      ),
      // style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
