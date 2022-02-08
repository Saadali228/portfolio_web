part of 'about_bloc.dart';

enum AboutStatus {
  intial,
  loading,
  loaded,
  error,
}

class AboutState extends Equatable {
  const AboutState({
    this.aboutStatus = AboutStatus.intial,
    this.aboutItem,
  });
  final AboutRepoModel?
      aboutItem; //making it nullable as it will have nothing in intial state?
  final AboutStatus aboutStatus;

  AboutState copyWith({
    AboutStatus? aboutStatus,
    AboutRepoModel? aboutItem,
  }) {
    return AboutState(
        aboutItem: aboutItem ?? this.aboutItem,
        aboutStatus: aboutStatus ?? this.aboutStatus);
  }

  @override
  List<Object?> get props => [
        aboutItem,
        aboutStatus,
      ];
}
