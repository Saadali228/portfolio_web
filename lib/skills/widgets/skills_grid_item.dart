import 'package:flutter/material.dart';
import 'package:portfolio_web/skills/repository_layer/model/skills_repo_model.dart';

class SkillsGridItem extends StatelessWidget {
  const SkillsGridItem({Key? key, this.skillsData, required this.index})
      : super(key: key);
  final List<SkillsRepoModel>? skillsData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: const Color(0xff6D6D6D),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(45.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 40,
                  right: 10,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skillsData![index].title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        skillsData![index].description.toString(),
                        style: const TextStyle(
                          color: Color(0xff5F5E79),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 40,
          child: Image.network(
            skillsData![index].image,
            width: 90,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
