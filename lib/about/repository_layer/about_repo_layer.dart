import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';

class AboutRepoLayer {
  AboutRepoLayer({required AboutDataLayer aboutDataLayer})
      : _aboutDataLayer = aboutDataLayer;

  final AboutDataLayer _aboutDataLayer;
  Future<AboutRepoModel> fetchAboutDataFromDataLayer() async {
    final data = await _aboutDataLayer.fetchAboutData();
    return AboutRepoModel(
      name: data.name,
      title: data.title,
      statement: data.statement,
      hobbies: data.hobbies as List<Hobbies>,
    );
  }
}
