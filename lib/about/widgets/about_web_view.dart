import 'package:flutter/material.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';
import 'package:portfolio_web/about/widgets/about_me.dart';
import 'package:portfolio_web/about/widgets/about_skill_grid.dart';
import 'package:portfolio_web/utils/constants.dart';

class AboutWebView extends StatelessWidget {
  const AboutWebView({
    Key? key,
    required this.aboutData,
  }) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                top: 45,
              ),
              child: Image.asset(
                'assets/images/ellipse-3.png',
                color: const Color(0xff1864D7).withOpacity(0.75),
                width: 240,
              ),
            ),
            SizedBox(
              width: 360,
              child: GridView.builder(
                itemCount: aboutData?.skills.length ?? 4,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 50,
                  mainAxisSpacing: 50,
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
        size.width > tablet
            ? Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Image.asset(
                  'assets/images/boy.png',
                  width: 325,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: 25.0,
                  top: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AboutMe(
                        aboutData: aboutData,
                      ),
                    ),
                    Image.asset(
                      'assets/images/boy.png',
                      width: 225,
                    ),
                  ],
                ),
              ),
        size.width > tablet
            ? AboutMe(
                aboutData: aboutData,
              )
            : Container(),
      ],
    );
  }
}
