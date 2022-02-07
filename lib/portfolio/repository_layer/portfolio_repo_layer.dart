import 'package:portfolio_web/portfolio/data_layer/portfolio_data_layer.dart';

import 'models/portfolio_repo_model.dart';

class PortfolioRepoLayer {
  PortfolioRepoLayer(this._portfolioDataLayer);

  final PortfolioDataLayer _portfolioDataLayer;
  Future<List<PortfolioRepoModel>?> fetchPortfolioDataFromDataLayer() async {
    final portFolioList = await _portfolioDataLayer.fetchPortfolioData();
    return portFolioList
        ?.map(
          (e) => PortfolioRepoModel(
            id: e.id,
            title: e.title,
            image: e.image,
          ),
        )
        .toList();
  }
}
