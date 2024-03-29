import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/about/bloc/about_bloc.dart';
import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/pages/about_screen.dart';
import 'package:portfolio_web/about/repository_layer/about_repo_layer.dart';
import 'package:portfolio_web/contact/bloc/contact_bloc.dart';
import 'package:portfolio_web/contact/data_layer/contact_data_layer.dart';
import 'package:portfolio_web/contact/pages/contact_page.dart';
import 'package:portfolio_web/contact/repository_layer/contact_repo_layer.dart';
import 'package:portfolio_web/home_page/widgets/home_page_banner.dart';
import 'package:portfolio_web/home_page/widgets/web_nav_bar.dart';
import 'package:portfolio_web/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio_web/portfolio/data_layer/portfolio_data_layer.dart';
import 'package:portfolio_web/portfolio/pages/portfolio.dart';
import 'package:portfolio_web/portfolio/repository_layer/portfolio_repo_layer.dart';
import 'package:portfolio_web/skills/bloc/skills_bloc.dart';
import 'package:portfolio_web/skills/data_layer/skills_data_layer.dart';
import 'package:portfolio_web/skills/pages/skills_screen.dart';
import 'package:portfolio_web/skills/repository_layer/skills_repo_layer.dart';
import 'package:portfolio_web/utils/constants.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AboutDataLayer aboutDataLayer = AboutDataLayer();
    AboutRepoLayer aboutRepoLayer = AboutRepoLayer(
      aboutDataLayer: aboutDataLayer,
    );
    SkillsDataLayer skillsDataLayer = SkillsDataLayer();
    SkillsRepoLayer skillsRepoLayer = SkillsRepoLayer(
      skillsDataLayer,
    );
    PortfolioDataLayer portfolioDataLayer = PortfolioDataLayer();
    PortfolioRepoLayer portfolioRepoLayer = PortfolioRepoLayer(
      portfolioDataLayer,
    );
    ContactDataLayer contactDataLayer = ContactDataLayer();
    ContactRepoLayer contactRepoLayer = ContactRepoLayer(
      contactDataLayer,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff4275FA),
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: size.width * 0.04,
            ),
            Text(
              'Saadali',
              style: GoogleFonts.pacifico(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          if (size.width > mobile) const WebNavBar(),
          if (size.width > mobile) SizedBox(width: size.width * 0.03),
        ],
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          HomePageBanner(
            pageController: pageController,
          ),
          BlocProvider(
            create: (context) => AboutBloc(
              aboutRepoLayer,
            ),
            child: AboutScreen(
              controller: pageController,
            ),
          ),
          BlocProvider(
            create: (context) => SkillsBloc(
              skillsRepoLayer,
            ),
            child: SkillsScreen(
              controller: pageController,
            ),
          ),
          BlocProvider(
            create: (context) => PortfolioBloc(
              portfolioRepoLayer,
            ),
            child: PortfolioScreen(
              controller: pageController,
            ),
          ),
          BlocProvider(
            create: (context) => ContactBloc(
              contactRepoLayer,
            ),
            child: ContactPage(
              controller: pageController,
            ),
          ),
        ],
      ),
    );
  }
}
