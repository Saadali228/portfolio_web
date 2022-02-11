import 'package:flutter/material.dart';
import 'package:portfolio_web/skills/repository_layer/model/skills_repo_model.dart';
import 'package:portfolio_web/skills/widgets/skills_grid_item.dart';

class SkillsGrid extends StatelessWidget {
  const SkillsGrid({Key? key, required this.skillsData}) : super(key: key);
  final List<SkillsRepoModel>? skillsData;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 425,
          mainAxisExtent: 275,
          crossAxisSpacing: 30,
          // mainAxisSpacing: 30,
        ),
        primary: false,
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          top: 40,
          left: 60.0,
          right: 60.0,
          bottom: 20,
        ),
        itemCount: skillsData!.length,
        itemBuilder: (context, index) {
          return SkillsGridItem(
            skillsData: skillsData,
            index: index,
          );
        });
  }
}
