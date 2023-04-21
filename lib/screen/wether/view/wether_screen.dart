import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_api/screen/wether/modal/wether_modal.dart';
import 'package:wether_api/screen/wether/provider/wether_provider.dart';

class WetherScreen extends StatefulWidget {
  const WetherScreen({Key? key}) : super(key: key);

  @override
  State<WetherScreen> createState() => _WetherScreenState();
}

class _WetherScreenState extends State<WetherScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<WetherProvider>(context, listen: false).getData;
  }

  WetherProvider? wetherProviderfalse;
  WetherProvider? wetherProvidertrue;
  Country? country;

  @override
  Widget build(BuildContext context) {
    wetherProviderfalse = Provider.of<WetherProvider>(context, listen: false);
    wetherProvidertrue = Provider.of<WetherProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    wetherProvidertrue!
                        .change("in", wetherProvidertrue!.selectedBusiness);
                  },
                  child: Text(
                    "in",
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    wetherProvidertrue!
                        .change("us", wetherProvidertrue!.selectedBusiness);
                  },
                  child: Text(
                    "us",
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    wetherProvidertrue!
                        .change("uk", wetherProvidertrue!.selectedBusiness);
                  },
                  child: Text(
                    "uk",
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    wetherProvidertrue!
                        .change("cn", wetherProvidertrue!.selectedBusiness);
                  },
                  child: Text(
                    "cn",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          Expanded(
              child: FutureBuilder(
                  future: wetherProviderfalse!.getData(
                      selectedBusiness: wetherProvidertrue!.selectedBusiness,
                      selectedCountry: wetherProvidertrue!.selectedCountry),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      Country? country = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      child: Image.network(
                                        "${country!.articles![index].urlToImage}",
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "${country!.articles![index].title}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "${country!.articles![index].description}",
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 13),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: country!.articles!.length,
                      );
                    }

                    return Center(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()),
                    );
                  }))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        backgroundColor: Colors.white12,
        currentIndex: wetherProvidertrue!.i,
        onTap: (value) {
          wetherProvidertrue!.selectindex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white54,
            ),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.slow_motion_video,
                color: Colors.white54,
              ),
              label: "Video",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white54,
              ),
              label: "Profile",
              backgroundColor: Colors.black),
        ],
      ),
    ));
  }
}
