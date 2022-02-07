import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/home_page/data_layer/models/homepage_data_model.dart';

class HomePageDataLayer {
  Future<HomePageDataModel> fetchhomePageData() async {
    final String response =
        await rootBundle.loadString('assets/data/home_page.json');
    final data = await json.decode(response);
    final homePageData = data["data"];
    final homePageList = HomePageDataModel.fromJson(homePageData);
    return homePageList;
  }
}
