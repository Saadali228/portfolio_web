import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio_web/portfolio/data_layer/models/portfolio_data_model.dart';

class PortfolioDataLayer {
  Future<List<PortfolioDataModel>?> fetchPortfolioData() async {
    final String response =
        await rootBundle.loadString('assets/data/portfolio.json');
    final data = await json.decode(response);
    final portFolioData = data["data"]["projects"] as List;
    List<PortfolioDataModel>? portFolioList;
    if (data["status"] == "ok") {
      portFolioList =
          portFolioData.map((e) => PortfolioDataModel.fromJson(e)).toList();
    } else {
      portFolioList = null;
    }
    return portFolioList;
  }
}
