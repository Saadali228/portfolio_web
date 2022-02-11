import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_web/skills/repository_layer/model/skills_repo_model.dart';
import 'package:portfolio_web/skills/repository_layer/skills_repo_layer.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsRepoLayer skillsRepoLayer;
  SkillsBloc(
    this.skillsRepoLayer,
  ) : super(const SkillsState()) {
    on<FetchSkillsInfo>((event, emit) async {
      emit(
        state.copyWith(
          skillsStatus: SkillsStatus.loading,
        ),
      );
      try {
        final skillsInfo = await skillsRepoLayer.fetchskillsDataFromDataLayer();
        emit(
          state.copyWith(
            skillsList: skillsInfo,
            skillsStatus: SkillsStatus.loaded,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(skillsStatus: SkillsStatus.error),
        );
      }
    });
  }
}
