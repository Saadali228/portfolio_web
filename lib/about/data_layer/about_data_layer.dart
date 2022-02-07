import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/about/data_layer/models/about_data_model.dart';

class AboutDataLayer {
  Future<AboutDataModel> fetchAboutData() async {
    try {
      String? response = await rootBundle.loadString('assets/data/about.json');
      final data = await json.decode(response);
      print(data);
      final aboutData = data["data"];
      final _aboutList = AboutDataModel.fromJson(aboutData);
      return _aboutList;
    } catch (e) {
      throw 'not found';
    }
  }
}
