import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_web/home_page/repository_layer/homepage_repo_layer.dart';
import 'package:portfolio_web/home_page/repository_layer/models/homepage_repo_model.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageRepoLayer homePageRepoLayer;
  HomepageBloc(
    this.homePageRepoLayer,
  ) : super(const HomePageState()) {
    on<FetchHomePageInfo>((event, emit) async {
      emit(
        state.copyWith(
          homePageStatus: HomePageStatus.loading,
        ),
      );
      final homePageInfo =
          await homePageRepoLayer.fetchhomePageDataFromDataLayer();
      // print(homePageInfo.name);
      emit(
        state.copyWith(
          homePageRepoModel: homePageInfo,
          homePageStatus: HomePageStatus.loaded,
        ),
      );
      // print(state.homePageStatus);
    });
  }
}
