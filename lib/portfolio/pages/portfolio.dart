import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio_web/portfolio/repository_layer/models/portfolio_repo_model.dart';
import 'package:portfolio_web/portfolio/widgets/project_grid.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        switch (state.portfolioStatus) {
          case (PortfolioStatus.intial):
            context.read<PortfolioBloc>().add(
                  FetchPortfolioInfo(),
                );
            return const _PortfolioInitial();
          case PortfolioStatus.loading:
            return const _PortfolioLoading();
          case PortfolioStatus.loaded:
            return _PortfolioLoaded(
              portfolioData: state.portfolioList,
            );
          case PortfolioStatus.error:
          default:
            return const _PortfolioError();
        }
      },
    );
  }
}

class _PortfolioInitial extends StatelessWidget {
  const _PortfolioInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Portfolio Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _PortfolioLoading extends StatelessWidget {
  const _PortfolioLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _PortfolioError extends StatelessWidget {
  const _PortfolioError({Key? key}) : super(key: key);

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

class _PortfolioLoaded extends StatelessWidget {
  const _PortfolioLoaded({Key? key, required this.portfolioData})
      : super(key: key);

  final List<PortfolioRepoModel>? portfolioData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          const Text(
            'My Portfolio',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5.0),
          const Text(
            'Recent Works',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          Expanded(
            child: ProjectGrid(
              portfolioData: portfolioData,
            ),
          ),
        ],
      ),
    );
  }
}
