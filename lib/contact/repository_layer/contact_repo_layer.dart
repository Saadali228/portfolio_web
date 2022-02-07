import 'package:portfolio_web/contact/data_layer/contact_data_layer.dart';
import 'package:portfolio_web/contact/repository_layer/models/contact_repo_model.dart';

class ContactRepoLayer {
  ContactRepoLayer(this._contactDataLayer);
  final ContactDataLayer _contactDataLayer;
  Future<List<ContactRepoModel>?> fetchContactDataFromDataLayer() async {
    final ContactList = await _contactDataLayer.fetchContactData();
    return ContactList?.map(
      (e) => ContactRepoModel(
        name: e.name,
        phone: e.phone,
        email: e.email,
      ),
    ).toList();
  }
}
