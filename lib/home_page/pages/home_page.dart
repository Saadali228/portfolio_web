import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/home_page/widgets/home_page_banner.dart';
import 'package:portfolio_web/home_page/widgets/web_nav_bar.dart';

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
          const WebNavBar(),
          SizedBox(width: size.width * 0.03),
        ],
      ),
      body: const HomePageBanner(),
    );
  }
}
