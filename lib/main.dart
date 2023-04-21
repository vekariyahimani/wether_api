import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_api/screen/extra_screen/view/bottem_screen.dart';
import 'package:wether_api/screen/extra_screen/view/tabbar_screen.dart';
import 'package:wether_api/screen/wether/provider/wether_provider.dart';
import 'package:wether_api/screen/wether/view/data_screen.dart';
import 'package:wether_api/screen/wether/view/wether_screen.dart';


void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => WetherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => TabbarScreen(),
          'bottem':(context) => BottemScreen(),
          'wether':(context) => WetherScreen(),
          'data':(context) => DataScreen(),
        },
      ),
    )
  );
}