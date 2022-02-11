import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/about/bloc/about_bloc.dart';
import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/pages/about_screen.dart';
import 'package:portfolio_web/about/repository_layer/about_repo_layer.dart';
import 'package:portfolio_web/home_page/widgets/home_page_banner.dart';
import 'package:portfolio_web/home_page/widgets/web_nav_bar.dart';
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
        ],
      ),
    );
  }
}
