import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/home_page/bloc/homepage_bloc.dart';
import 'package:portfolio_web/home_page/repository_layer/models/homepage_repo_model.dart';
import 'package:portfolio_web/home_page/widgets/home_mobile_view.dart';
import 'package:portfolio_web/home_page/widgets/home_web_view.dart';
import 'package:portfolio_web/home_page/widgets/wave_clipper.dart';
import 'package:portfolio_web/utils/constants.dart';

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomePageState>(
      builder: (context, state) {
        switch (state.homePageStatus) {
          case HomePageStatus.intial:
            context.read<HomepageBloc>().add(
                  FetchHomePageInfo(),
                );
            return const _HomeInitial();
          case HomePageStatus.loading:
            return const _HomeLoading();
          case HomePageStatus.loaded:
            return HomeLoaded(
              homePageRepoModel: state.homePageRepoModel,
            );
          case HomePageStatus.error:
          default:
            return const _HomeError();
        }
      },
    );
  }
}

class _HomeInitial extends StatelessWidget {
  const _HomeInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _HomeLoading extends StatelessWidget {
  const _HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class HomeLoaded extends StatelessWidget {
  final BoxDecoration backgroundGradient = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff1102C6),
        Color(0xff4275FA),
      ],
      stops: [0.0, 1.0],
      begin: FractionalOffset.bottomRight,
      end: FractionalOffset.topLeft,
      tileMode: TileMode.repeated,
    ),
  );
  const HomeLoaded({Key? key, required this.homePageRepoModel})
      : super(key: key);
  final HomePageRepoModel? homePageRepoModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            padding: const EdgeInsets.only(bottom: 50),
            height: size.height,
            decoration: backgroundGradient,
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            "assets/images/ellipse.png",
            height: 525,
            color: Colors.white.withOpacity(0.2),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        Positioned(
          bottom: 50,
          right: 0,
          child: Image.asset(
            'assets/images/ellipse-2.png',
            height: 400,
            color: Colors.white.withOpacity(0.15),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        size.width > mobile
            ? Positioned(
                top: 100,
                left: size.width * 0.05,
                child: HomeWebView(
                  name: 'HELLO, IM ${homePageRepoModel!.name}',
                  title: homePageRepoModel!.title,
                  subtitle: homePageRepoModel!.subtitle,
                ),
              )
            : Positioned(
                top: 20,
                left: size.width * 0.03,
                child: HomeMobileView(
                  name: 'HELLO, IM ${homePageRepoModel!.name}',
                  title: homePageRepoModel!.title,
                  subtitle: homePageRepoModel!.subtitle,
                ),
              ),
        Positioned(
          bottom: 5,
          right: size.width * 0.05,
          child: Image.asset(
            'assets/images/hero-img.png',
            width: size.width > tablet
                ? 500
                : size.width > mobile
                    ? 350
                    : 300,
          ),
        )
      ],
    );
  }
}

buildButton(
  Color color,
  String buttonText,
  Color textColor,
) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.white),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size(120, 40),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        color,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    ),
  );
}

class _HomeError extends StatelessWidget {
  const _HomeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Something Went Wrong!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}
