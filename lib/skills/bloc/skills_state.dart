part of 'skills_bloc.dart';

enum SkillsStatus {
  intial,
  loading,
  loaded,
  error,
}

class SkillsState extends Equatable {
  const SkillsState({
    this.skillsList = const [],
    this.skillsStatus = SkillsStatus.intial,
  });
  final SkillsStatus skillsStatus;
  final List<SkillsRepoModel>? skillsList;
  SkillsState copyWith({
    SkillsStatus? skillsStatus,
    List<SkillsRepoModel>? skillsList,
  }) {
    return SkillsState(
      skillsList: skillsList ?? this.skillsList,
      skillsStatus: skillsStatus ?? this.skillsStatus,
    );
  }

  @override
  List<Object> get props => [
    skillsStatus,
    skillsList!
  ];
}
