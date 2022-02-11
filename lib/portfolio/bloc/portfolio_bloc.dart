import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_web/portfolio/repository_layer/models/portfolio_repo_model.dart';
import 'package:portfolio_web/portfolio/repository_layer/portfolio_repo_layer.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioRepoLayer portfolioRepoLayer;
  PortfolioBloc(
    this.portfolioRepoLayer,
  ) : super(const PortfolioState()) {
    on<FetchPortfolioInfo>((event, emit) async {
      emit(
        state.copyWith(
          portfolioStatus: PortfolioStatus.loading,
        ),
      );
      // try {
      final portfolioInfo =
          await portfolioRepoLayer.fetchPortfolioDataFromDataLayer();
      emit(
        state.copyWith(
          portfolioList: portfolioInfo,
          portfolioStatus: PortfolioStatus.loaded,
        ),
      );
      // } catch (_) {
      //   emit(
      //     state.copyWith(
      //       portfolioStatus: PortfolioStatus.error,
      //     ),
      //   );
      // }
    });
  }
}
