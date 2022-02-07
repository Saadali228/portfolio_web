import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/contact/repository_layer/models/contact_repo_model.dart';

void main() {
  group('contact', () {
    test('fromJson', () {
      expect(
        ContactRepoModel.fromJson(
          <String, dynamic>{
            "name": "Syed Saad Ali",
            "phone": "+92 334 3586862",
            "email": "saad.ali@venturedive.com"
          },
        ),
        isA<ContactRepoModel>(),
      );
    });
  });
}
