import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/home_page/bloc/homepage_bloc.dart';
import 'package:portfolio_web/home_page/data_layer/homepage_data_layer.dart';
import 'package:portfolio_web/home_page/pages/home_page.dart';
import 'package:portfolio_web/home_page/repository_layer/homepage_repo_layer.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  setPathUrlStrategy();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomePageDataLayer homePageDataLayer = HomePageDataLayer();
    HomePageRepoLayer homePageRepoLayer = HomePageRepoLayer(homePageDataLayer);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomepageBloc(
            // RepositoryProvider.of(context),
            homePageRepoLayer,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const HomePageScreen(),
      ),
    );
  }
}
