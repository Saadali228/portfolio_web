import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_web/contact/repository_layer/contact_repo_layer.dart';
import 'package:portfolio_web/contact/repository_layer/models/contact_repo_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepoLayer contactRepoLayer;
  ContactBloc(
    this.contactRepoLayer,
  ) : super(const ContactState()) {
    on<FetchContactInfo>((event, emit) async {
      emit(
        state.copyWith(
          contactStatus: ContactStatus.loading,
        ),
      );
      try {
        final contactInfo =
            await contactRepoLayer.fetchContactDataFromDataLayer();
        emit(
          state.copyWith(
            contactRepoModel: contactInfo,
            contactStatus: ContactStatus.loaded,
          ),
        );
      } catch (_) {
        emit(
          state.copyWith(contactStatus: ContactStatus.error),
        );
      }
    });
  }
}
