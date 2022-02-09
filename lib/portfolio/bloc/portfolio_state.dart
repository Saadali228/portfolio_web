part of 'portfolio_bloc.dart';

enum PortfolioStatus {
  intial,
  loading,
  loaded,
  error,
}

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioList = const [],
    this.portfolioStatus = PortfolioStatus.intial,
  });
  final PortfolioStatus portfolioStatus;
  final List<PortfolioRepoModel>? portfolioList;
  PortfolioState copyWith({
    PortfolioStatus? portfolioStatus,
    List<PortfolioRepoModel>? portfolioList,
  }) {
    return PortfolioState(
      portfolioList: portfolioList ?? this.portfolioList,
      portfolioStatus: portfolioStatus ?? this.portfolioStatus,
    );
  }

  @override
  List<Object?> get props => [
        portfolioList,
        portfolioStatus,
      ];
}
