import 'package:flutter/material.dart';
import 'package:wether_api/screen/wether/view/data_screen.dart';
import 'package:wether_api/screen/wether/view/wether_screen.dart';


class TabbarScreen extends StatefulWidget {
  const TabbarScreen({Key? key}) : super(key: key);

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text(
            "24/7 News",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          actions: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            SizedBox(width: 15,),
          ],
          backgroundColor: Colors.black87,
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "COUNTRY",
              ),
              Tab(
                text: "CATEGROY",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          WetherScreen(),
          DataScreen(),
        ]),

      )),
    );
  }
}
