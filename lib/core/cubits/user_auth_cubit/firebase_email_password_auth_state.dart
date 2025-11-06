part of 'firebase_email_password_auth_cubit.dart';

sealed class FirebaseEmailPasswordAuthState extends Equatable {
  const FirebaseEmailPasswordAuthState();

  @override
  List<Object> get props => [];
}

final class FirebaseEmailPasswordAuthInitial
    extends FirebaseEmailPasswordAuthState {}

final class FirebaseEmailPasswordRegisterLoading
    extends FirebaseEmailPasswordAuthState {}

final class FirebaseEmailPasswordRegisterSuccess
    extends FirebaseEmailPasswordAuthState {}

final class FirebaseEmailPasswordRegisterFailure
    extends FirebaseEmailPasswordAuthState {
  final String message;
  const FirebaseEmailPasswordRegisterFailure(this.message);
}

//-----------------------login states-----------------

final class FirebaseEmailPasswordLogInLoading
    extends FirebaseEmailPasswordAuthState {}

final class FirebaseEmailPasswordLogInSuccess
    extends FirebaseEmailPasswordAuthState {}

final class FirebaseEmailPasswordLogInFailure
    extends FirebaseEmailPasswordAuthState {
  final String message;
  const FirebaseEmailPasswordLogInFailure(this.message);
}
