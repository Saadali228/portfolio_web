import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/skills/data_layer/models/skills_data_model.dart';

class SkillsDataLayer {
  Future<List<SkillsDataModel>?> fetchskillsData() async {
    final String response =
        await rootBundle.loadString('assets/data/skills.json');
    final data = await json.decode(response);
    final skillsData = data["data"];
    List<SkillsDataModel>? skillsList;
    if (data["status"] == "ok") {
      skillsList = skillsData.map((e) => SkillsDataModel.fromJson(e)).toList();
    } else {
      skillsList = null;
    }
    return skillsList;
  }
}
