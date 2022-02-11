import 'package:flutter/material.dart';
import 'package:portfolio_web/portfolio/repository_layer/models/portfolio_repo_model.dart';
import 'package:portfolio_web/portfolio/widgets/project_grid_item.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({Key? key, required this.portfolioData}) : super(key: key);
  final List<PortfolioRepoModel>? portfolioData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 60.0,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 425,
        mainAxisExtent: 275,
        crossAxisSpacing: 30,
      ),
      itemCount: portfolioData!.length,
      itemBuilder: (BuildContext context, int index) {
        return ProjectGridItem(
          projectData: portfolioData,
          index: index,
        );
      },
    );
  }
}
