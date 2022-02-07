import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:portfolio_web/contact/data_layer/models/contact_data_model.dart';

class ContactDataLayer {
  Future<List<ContactDataModel>?> fetchContactData() async {
    final String response =
        await rootBundle.loadString('assets/data/contact.json');
    final data = await json.decode(response);
    final contactData = data["data"];
    List<ContactDataModel>? contactList;
    if (data["status"] == "ok") {
      contactList =
          contactData.map((e) => ContactDataModel.fromJson(e)).toList();
    } else {
      contactList = null;
    }
    return contactList;
  }
}
