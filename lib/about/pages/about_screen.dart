import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/about/bloc/about_bloc.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';
import 'package:portfolio_web/about/widgets/about_mobile_view.dart';
import 'package:portfolio_web/about/widgets/about_web_view.dart';
import 'package:portfolio_web/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutBloc, AboutState>(
      builder: (context, state) {
        print(state.aboutStatus);
        switch (state.aboutStatus) {
          case (AboutStatus.intial):
            context.read<AboutBloc>().add(
                  FetchAboutInfo(),
                );
            return const _AboutInitial();
          case AboutStatus.loading:
            return const _AboutLoading();
          case AboutStatus.loaded:
            return _AboutLoaded(
              aboutData: state.aboutItem,
            );
          case AboutStatus.error:
          default:
            return const _AboutError();
        }
      },
    );
  }
}

class _AboutInitial extends StatelessWidget {
  const _AboutInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'About Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _AboutLoading extends StatelessWidget {
  const _AboutLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _AboutError extends StatelessWidget {
  const _AboutError({Key? key}) : super(key: key);

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

class _AboutLoaded extends StatelessWidget {
  const _AboutLoaded({Key? key, required this.aboutData}) : super(key: key);

  final AboutRepoModel? aboutData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width > mobile
        ? AboutWebView(
            aboutData: aboutData,
          )
        : AboutMobileView(
            aboutData: aboutData,
          );
  }
}
