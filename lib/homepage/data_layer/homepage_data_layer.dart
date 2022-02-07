import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/homepage/data_layer/models/homepage_data_model.dart';

class HomePageDataLayer {
  Future<List<HomePageDataModel>?> fetchhomePageData() async {
    final String response =
        await rootBundle.loadString('assets/data/homepage.json');
    final data = await json.decode(response);
    final homePageData = data["data"];
    List<HomePageDataModel>? homePageList;
    if (data["status"] == "ok") {
      homePageList =
          homePageData.map((e) => HomePageDataModel.fromJson(e)).toList();
    } else {
      homePageList = null;
    }
    return homePageList;
  }
}
