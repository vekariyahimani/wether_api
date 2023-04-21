import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_api/screen/wether/provider/wether_provider.dart';
import 'package:wether_api/screen/wether/view/wether_screen.dart';

class BottemScreen extends StatefulWidget {
  const BottemScreen({Key? key}) : super(key: key);

  @override
  State<BottemScreen> createState() => _BottemScreenState();
}

class _BottemScreenState extends State<BottemScreen> {
  WetherProvider? wetherProviderfalse;
  WetherProvider? wetherProvidertrue;
  List screen = [WetherScreen(),WetherScreen(),WetherScreen()];

  @override
  Widget build(BuildContext context) {
    wetherProviderfalse = Provider.of<WetherProvider>(context, listen: false);
    wetherProvidertrue = Provider.of<WetherProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(

        body: screen[wetherProvidertrue!.i],
      ),
    );
  }
}
