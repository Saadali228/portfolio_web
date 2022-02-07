import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';

class AboutRepoLayer {
  AboutRepoLayer(this._aboutDataLayer);

  final AboutDataLayer _aboutDataLayer;
  Future<List<AboutRepoModel>?> fetchAboutDataFromDataLayer() async {
    final portFolioList = await _aboutDataLayer.fetchAboutData();
    return portFolioList
        ?.map(
          (e) => AboutRepoModel(
            name: e.name,
            title: e.title,
            statement: e.statement,
            hobbies: e.hobbies as List<Hobbies>,
          ),
        )
        .toList();
  }
}
