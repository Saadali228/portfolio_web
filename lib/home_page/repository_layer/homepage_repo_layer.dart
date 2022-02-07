import 'package:portfolio_web/home_page/data_layer/homepage_data_layer.dart';
import 'package:portfolio_web/home_page/repository_layer/models/homepage_repo_model.dart';

class HomePageRepoLayer {
  HomePageRepoLayer(this._homePageDataLayer);

  final HomePageDataLayer _homePageDataLayer;
  Future<HomePageRepoModel> fetchhomePageDataFromDataLayer() async {
    final homePageList = await _homePageDataLayer.fetchhomePageData();
    return HomePageRepoModel(
      name: homePageList.name,
      title: homePageList.title,
      subtitle: homePageList.subtitle,
    );
  }
}
