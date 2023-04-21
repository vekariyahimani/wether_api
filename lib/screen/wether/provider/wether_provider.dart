import 'package:flutter/material.dart';
import 'package:wether_api/screen/wether/modal/wether_modal.dart';
import 'package:wether_api/utils/api_helper.dart';

class WetherProvider extends ChangeNotifier
{
  String selectedCountry="us";
  String selectedBusiness="sport";
  int currentindex = 0,i=0;


  void change(String country,String business)
  {
    selectedCountry=country;
    selectedBusiness=business;
    notifyListeners();
  }

  Country? country;
  Future<Country?> getData({selectedCountry, selectedBusiness})
  async {
    ApiHelper apiHelper=ApiHelper();
   var country=await apiHelper.countryApiCall(cat: selectedBusiness,coun: selectedCountry);
   return country;


  }
  void selectindex(int value) {
    i = value;
    notifyListeners();
    print(i);

  }


}