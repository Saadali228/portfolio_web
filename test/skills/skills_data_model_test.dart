import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/skills/data_layer/models/skills_data_model.dart';

void main() {
  group('contact', () {
    test('fromJson', () {
      expect(
        SkillsDataModel.fromJson(
          <String, dynamic>{
            "id": "1",
            "title": "Product Design",
            "image": "https://imgur.com/Hp6gP52",
            "description":
                "Product design is the process designers use to blend user       needs with business goals to help brands make consistently successful products."
          },
        ),
        isA<SkillsDataModel>(),
      );
    });
  });
}
