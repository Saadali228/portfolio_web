part of 'homepage_bloc.dart';

enum HomePageStatus {
  intial,
  loading,
  loaded,
  error,
}

class HomePageState extends Equatable {
  const HomePageState({
    this.homePageRepoModel,
    this.homePageStatus = HomePageStatus.intial,
  });
  final HomePageStatus homePageStatus;
  final HomePageRepoModel? homePageRepoModel;
  HomePageState copyWith({
    HomePageStatus? homePageStatus,
    HomePageRepoModel? homePageRepoModel,
    HomePageRepoModel,
  }) {
    return HomePageState(
      homePageRepoModel: homePageRepoModel ?? this.homePageRepoModel,
      homePageStatus: homePageStatus ?? this.homePageStatus,
    );
  }

  List<Object> get props => [
        homePageStatus,
        homePageStatus,
      ];
}
