part of 'portfolio_bloc.dart';

enum PortFolioStatus {
  intial,
  loading,
  loaded,
  error,
}

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portFolioList = const [],
    this.portFolioStatus = PortFolioStatus.intial,
  });
  final PortFolioStatus portFolioStatus;
  final List<PortfolioRepoModel>? portFolioList;
  PortfolioState copyWith({
    PortFolioStatus? portFolioStatus,
    List<PortfolioRepoModel>? portFolioList,
  }) {
    return PortfolioState(
      portFolioList: portFolioList ?? this.portFolioList,
      portFolioStatus: portFolioStatus ?? this.portFolioStatus,
    );
  }

  @override
  List<Object> get props => [
        portFolioList!,
        portFolioStatus,
      ];
}
