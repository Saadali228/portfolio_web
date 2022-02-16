import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/about/data_layer/about_data_layer.dart';
import 'package:portfolio_web/about/data_layer/models/about_data_model.dart';

void main() {
  AboutDataModel aboutDataModel = AboutDataModel(
      name: "s", title: "s", statement: "ss", hobbies: [], skills: []);
  AboutDataLayer aboutDataLayer = AboutDataLayer();
  group(
    'about data layer',
    () {
      test(
        'data layer',
        () {
          expect(
            aboutDataLayer.fetchAboutData(),
            aboutDataModel,
          );
        },
      );
    },
  );
}
