import 'package:portfolio_web/homepage/data_layer/homepage_data_layer.dart';
import 'package:portfolio_web/homepage/repository_layer/models/homepage_repo_model.dart';

class HomePageRepoLayer {
  HomePageRepoLayer(this._homePageDataLayer);

  final HomePageDataLayer _homePageDataLayer;
  Future<List<HomePageRepoModel>?> fetchhomePageDataFromDataLayer() async {
    final homePageList = await _homePageDataLayer.fetchhomePageData();
    return homePageList
        ?.map(
          (e) => HomePageRepoModel(
            name: e.name,
            title: e.title,
            subtitle: e.subtitle,
          ),
        )
        .toList();
  }
}
