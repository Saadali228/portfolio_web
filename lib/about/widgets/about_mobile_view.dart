import 'package:flutter/material.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';
import 'package:portfolio_web/about/widgets/about_me.dart';
import 'package:portfolio_web/about/widgets/about_skill_grid.dart';

class AboutMobileView extends StatelessWidget {
  const AboutMobileView({
    Key? key,
    required this.aboutData,
  }) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 40.0,
        top: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AboutMe(
                aboutData: aboutData,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/ellipse-3.png',
                color: const Color(0xff1864D7).withOpacity(0.75),
                width: 165,
              ),
              SizedBox(
                width: 250,
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: aboutData?.skills.length ?? 4,
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return AboutSkillGrid(
                      aboutData: aboutData,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
