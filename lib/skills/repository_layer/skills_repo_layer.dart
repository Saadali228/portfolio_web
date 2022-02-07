import 'package:portfolio_web/skills/data_layer/skills_data_layer.dart';
import 'package:portfolio_web/skills/repository_layer/model/skills_repo_model.dart';

class SkillsRepoLayer {
  SkillsRepoLayer(this._skillsDataLayer);

  final SkillsDataLayer _skillsDataLayer;
  Future<List<SkillsRepoModel>?> fetchskillsDataFromDataLayer() async {
    final skillsList = await _skillsDataLayer.fetchskillsData();
    return skillsList
        ?.map(
          (e) => SkillsRepoModel(
            id: e.id,
            title: e.title,
            image: e.image,
            description: e.description,
          ),
        )
        .toList();
  }
}
