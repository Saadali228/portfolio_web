import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/home_page/data_layer/models/homepage_data_model.dart';

void main() {
  group('contact', () {
    test('fromJson', () {
      expect(
        HomePageDataModel.fromJson(
          <String, dynamic>{
            "name": "Saad Ali",
            "title": "Software Developer",
            "subtitle":
                "Final Year Student at Nuces & Flutter Intern at VentureDive"
          },
        ),
        isA<HomePageDataModel>(),
      );
    });
  });
}
