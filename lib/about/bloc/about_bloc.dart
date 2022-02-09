import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/about/repository_layer/about_repo_layer.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';
part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutRepoLayer aboutRepoLayer;
  AboutBloc(this.aboutRepoLayer) : super(const AboutState()) {
    on<FetchAboutInfo>((event, emit) async {
      emit(
        state.copyWith(
          aboutStatus: AboutStatus.loading,
        ),
      );
      try {
        final aboutInfo = await aboutRepoLayer.fetchAboutDataFromDataLayer();
        state.copyWith(
          aboutItem: aboutInfo,
          aboutStatus: AboutStatus.loaded,
        );
      } catch (_) {
        emit(
          state.copyWith(aboutStatus: AboutStatus.error),
        );
      }
    });
  }
}
