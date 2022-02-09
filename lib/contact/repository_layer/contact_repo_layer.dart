import 'package:portfolio_web/contact/data_layer/contact_data_layer.dart';
import 'package:portfolio_web/contact/repository_layer/models/contact_repo_model.dart';

class ContactRepoLayer {
  ContactRepoLayer(this._contactDataLayer);
  final ContactDataLayer _contactDataLayer;
  Future<ContactRepoModel> fetchContactDataFromDataLayer() async {
    final contactList = await _contactDataLayer.fetchContactData();
    return ContactRepoModel(
      name: contactList.name,
      phone: contactList.phone,
      email: contactList.email,
    );
  }
}
