import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio_web/contact/data_layer/models/contact_data_model.dart';

class ContactDataLayer {
  Future<ContactDataModel> fetchContactData() async {
    try {
      String? response =
          await rootBundle.loadString('assets/data/contact.json');
      final data = await json.decode(response);
      final contactData = data["data"];
      final _contactList = ContactDataModel.fromJson(contactData);
      return _contactList;
    } catch (e) {
      throw 'not found';
    }
  }
}
