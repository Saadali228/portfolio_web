import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/about/data_layer/models/about_data_model.dart';

class AboutDataLayer {
  Future<List<AboutDataModel>?> fetchAboutData() async {
    final String response =
        await rootBundle.loadString('assets/data/about.json');
    final data = await json.decode(response);
    final aboutData = data["data"];
    List<AboutDataModel>? aboutList;
    if (data["status"] == "ok") {
      aboutList = aboutData.map((e) => AboutDataModel.fromJson(e)).toList();
    } else {
      aboutList = null;
    }
    return aboutList;
  }
}
