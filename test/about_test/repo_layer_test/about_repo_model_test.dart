import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/about/repository_layer/models/about_repo_model.dart';

void main() {
  group('about', () {
    test('fromJson', () {
      expect(
        AboutRepoModel.fromJson(
          <String, dynamic>{
            "name": "Syed Saad Ali",
            "title": "Software Developer",
            "statement": "Final Year Student at Nuces",
            "hobbies": [
              {"id": "1", "hobby": "Movies"},
              {"id": "2", "hobby": "Travel"},
              {"id": "3", "hobby": "Photo"}
            ]
          },
        ),
        isA<AboutRepoModel>(),
      );
    });
  });
}
