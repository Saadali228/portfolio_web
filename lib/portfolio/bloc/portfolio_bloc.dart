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
    on<FetchPortFolioInfo>((event, emit) async {
      emit(
        state.copyWith(
          portFolioStatus: PortFolioStatus.loading,
        ),
      );
      try {
        final PortFolioInfo =
            await portfolioRepoLayer.fetchPortfolioDataFromDataLayer();
        state.copyWith(
          portFolioList: PortFolioInfo,
          portFolioStatus: PortFolioStatus.loaded,
        );
      } catch (_) {
        emit(
          state.copyWith(portFolioStatus: PortFolioStatus.error),
        );
      }
    });
  }
}
