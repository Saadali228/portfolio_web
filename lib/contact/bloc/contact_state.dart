part of 'contact_bloc.dart';

enum ContactStatus {
  intial,
  loading,
  loaded,
  error,
}

class ContactState extends Equatable {
  const ContactState({
    this.contactRepoModel,
    this.contactStatus = ContactStatus.intial,
  });
  final ContactStatus contactStatus;
  final ContactRepoModel? contactRepoModel;
  ContactState copyWith({
    ContactStatus? contactStatus,
    ContactRepoModel? contactRepoModel,
  }) {
    return ContactState(
      contactRepoModel: contactRepoModel ?? this.contactRepoModel,
      contactStatus: contactStatus ?? this.contactStatus,
    );
  }

  @override
  List<Object> get props => [
        contactStatus,
        contactStatus,
      ];
}
