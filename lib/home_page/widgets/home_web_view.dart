import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/home_page/widgets/home_page_banner.dart';

class HomeWebView extends StatelessWidget {
  const HomeWebView(
      {Key? key,
      required this.name,
      required this.title,
      required this.subtitle})
      : super(key: key);
  final String name;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 40,
          ),
        ),
        const SizedBox(
          width: 200,
          child: Divider(
            thickness: 2,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 500,
          child: Text(
            subtitle,
            style: GoogleFonts.notoSans(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            buildButton(
              Colors.white,
              "Hire me",
              Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            buildButton(
              Colors.transparent,
              "Get CV",
              Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
