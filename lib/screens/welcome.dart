// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/auth/login.dart';
import 'package:onlinebookhubapp/screens/btm_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(
          
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SignInPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome To',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
         
          Text(
            'Online Book Hub',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

         SizedBox(height: 45,),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset(
              'assets/images/offres/welcome.png',
              height: 500,
              width: 500,
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:onlinebookhubapp/auth/login.dart';
// import 'package:onlinebookhubapp/screens/btm_bar.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   double _photoSize = 200.0; // Initial photo size
//   bool _zoomed = false; // Check if photo is zoomed

//   void _toggleZoom() {
//     setState(() {
//       _zoomed = !_zoomed;
//       _photoSize = _zoomed ? 250.0 : 200.0;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 2), () {
//       if (FirebaseAuth.instance.currentUser != null) {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => BottomBarScreen()));
//       } else {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white, // Background color for the container
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: _toggleZoom,
//                 child: AnimatedContainer(
//                   duration: Duration(seconds: 1),
//                   curve: Curves.easeInOut,
//                   width: _photoSize,
//                   height: _photoSize,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle, // Circular shape
//                     border: Border.all(
//                       color: Colors.blue, // Border color
//                       width: 4.0, // Border width
//                     ),
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/images/offres/lognwelcome.avif',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20), // Add spacing
//               Text(
//                 "Welcome",
//                 style: TextStyle(
//                   color: Colors.black, // Text color
//                   fontSize: 24, // Text size
//                   fontWeight: FontWeight.bold, // Text style
//                 ),
//               ),
//               Text(
//                 "Online Book Hub",
//                 style: TextStyle(
//                   color: Colors.black, // Text color
//                   fontSize: 18, // Text size
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
