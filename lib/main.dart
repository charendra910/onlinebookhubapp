import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/auth/login.dart';
import 'package:onlinebookhubapp/consts/theme_data.dart';
import 'package:onlinebookhubapp/inner_screens/feeds_screen.dart';
import 'package:onlinebookhubapp/inner_screens/on_sale_screen.dart';
import 'package:onlinebookhubapp/models/product_detail1.dart';
import 'package:onlinebookhubapp/providers/dark_theme_provider.dart';
import 'package:onlinebookhubapp/screens/btm_bar.dart';
import 'package:onlinebookhubapp/screens/home_screen.dart';
import 'package:onlinebookhubapp/screens/welcome.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }
 @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),            
            home:  SplashScreen(),
           //home: SignInPage(),
            routes: {
              OnSaleScreen.routeName:(ctx) =>  OnSaleScreen(),
              FeedsScreen.routeName :(ctx) =>  FeedsScreen(),
            },
          );

        }
      ),
    );
  }
}

