import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web/contact/data_layer/models/contact_data_model.dart';

void main() {
  group('contact', () {
    test('fromJson', () {
      expect(
        ContactDataModel.fromJson(
          <String, dynamic>{
            "name": "Syed Saad Ali",
            "phone": "+92 334 3586862",
            "email": "saad.ali@venturedive.com"
          },
        ),
        isA<ContactDataModel>(),
      );
    });
  });
}
