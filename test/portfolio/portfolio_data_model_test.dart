import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/portfolio/data_layer/models/portfolio_data_model.dart';

void main() {
  group('contact', () {
    test('fromJson', () {
      expect(
        PortfolioDataModel.fromJson(
          <String, dynamic>{
            "id": "1",
            "title": "Movie Mart",
            "image": "https://i.ibb.co/Jv9d6qT/moviemart.jpg"
          },
        ),
        isA<PortfolioDataModel>(),
      );
    });
  });
}
