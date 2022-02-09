import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/home_page/bloc/homepage_bloc.dart';
import 'package:portfolio_web/home_page/repository_layer/models/homepage_repo_model.dart';
import 'package:portfolio_web/home_page/widgets/wave_clipper.dart';

class HomePageBanner extends StatefulWidget {
  const HomePageBanner({Key? key}) : super(key: key);

  @override
  _HomePageBannerState createState() => _HomePageBannerState();
}

class _HomePageBannerState extends State<HomePageBanner> {
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
        Positioned(
          top: 120,
          left: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'HELLO, IM ${homePageRepoModel!.name}',
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
                homePageRepoModel!.title,
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
                  homePageRepoModel!.subtitle,
                  style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
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
