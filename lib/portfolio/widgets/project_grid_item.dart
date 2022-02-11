import 'package:flutter/material.dart';

import 'package:portfolio_web/portfolio/repository_layer/models/portfolio_repo_model.dart';

class ProjectGridItem extends StatelessWidget {
  const ProjectGridItem(
      {Key? key, required this.projectData, required this.index})
      : super(key: key);

  final List<PortfolioRepoModel>? projectData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MouseRegion(
          onHover: (event) {
            
          },
          child: Image.network(
            projectData![index].image,
            // color: Colors.black.withOpacity(0.5),
            // colorBlendMode: BlendMode.multiply,
            // errorBuilder: (context, error, stackTrace) {
            //   return const Icon(
            //     Icons.image_not_supported_outlined,
            //     size: 50,
            //     color: Colors.blue,
            //   );
            // },
          ),
        ),
        // Text(
        //   projectData![index].title,
        //   style: const TextStyle(
        //     fontSize: 26,
        //     color: Colors.white,
        //     fontWeight: FontWeight.w700,
        //   ),
        // ),
      ],
    );
  }
}
