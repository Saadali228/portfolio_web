import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/about/data_layer/models/about_data_model.dart';

void main() {
  group('about', () {
    test('fromJson', () {
      expect(
        AboutDataModel.fromJson(
          <String, dynamic>{
            "name": "Syed Saad Ali",
            "title": "Software Developer",
            "statement": "Final Year Student at Nuces",
            "hobbies": [
              {
                "id": "1",
                "hobby": "Movies",
                "image": "https://imgur.com/u5xLSMy.png"
              },
              {
                "id": "2",
                "hobby": "Travel",
                "image": "https://imgur.com/J7jtjTI.png"
              },
              {
                "id": "3",
                "hobby": "Photo",
                "image": "https://imgur.com/t42FGrm.png"
              }
            ],
            "skills": [
              {
                "id": "1",
                "title": "User Research",
                "image": "https://imgur.com/sKpNkPO.png"
              },
              {
                "id": "2",
                "title": "Mockup",
                "image": "https://imgur.com/vul8CWk.png"
              },
              {
                "id": "3",
                "title": "Wireframing",
                "image": "https://imgur.com/jUmD2Fl.png"
              },
              {
                "id": "4",
                "title": "Prototype",
                "image": "https://imgur.com/48VuvHf.png"
              }
            ]
          },
        ),
        isA<AboutDataModel>(),
      );
    });
  });
}
