import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/skills/bloc/skills_bloc.dart';
import 'package:portfolio_web/skills/repository_layer/model/skills_repo_model.dart';
import 'package:portfolio_web/skills/widgets/skills_grid.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillsBloc, SkillsState>(
      builder: (context, state) {
        switch (state.skillsStatus) {
          case (SkillsStatus.intial):
            context.read<SkillsBloc>().add(
                  FetchSkillsInfo(),
                );
            return const _SkillsInitial();
          case SkillsStatus.loading:
            return const _SkillsLoading();
          case SkillsStatus.loaded:
            return _SkillsLoaded(
              skillsData: state.skillsList,
            );
          case SkillsStatus.error:
          default:
            return const _SkillsError();
        }
      },
    );
  }
}

class _SkillsInitial extends StatelessWidget {
  const _SkillsInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Skills Data is Empty!',
        style: TextStyle(fontSize: 64),
      ),
    );
  }
}

class _SkillsLoading extends StatelessWidget {
  const _SkillsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _SkillsError extends StatelessWidget {
  const _SkillsError({Key? key}) : super(key: key);

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

class _SkillsLoaded extends StatelessWidget {
  const _SkillsLoaded({Key? key, required this.skillsData}) : super(key: key);

  final List<SkillsRepoModel>? skillsData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "WHAT I DO",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Specializing In",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: SkillsGrid(
            skillsData: skillsData,
          ),
        ),
      ],
    );
  }
}
