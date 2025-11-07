part of 'firebase_email_password_auth_cubit.dart';

abstract class FirebaseEmailPasswordAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FirebaseEmailPasswordAuthInitial extends FirebaseEmailPasswordAuthState {}

class FirebaseEmailPasswordRegisterLoading
    extends FirebaseEmailPasswordAuthState {}

class FirebaseEmailPasswordRegisterSuccess
    extends FirebaseEmailPasswordAuthState {}

class FirebaseEmailPasswordRegisterFailure
    extends FirebaseEmailPasswordAuthState {
  final String message;
  FirebaseEmailPasswordRegisterFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class FirebaseEmailPasswordLogInLoading
    extends FirebaseEmailPasswordAuthState {}

class FirebaseEmailPasswordLogInSuccess extends FirebaseEmailPasswordAuthState {
  final UserModel user;
  FirebaseEmailPasswordLogInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class FirebaseEmailPasswordLogInFailure extends FirebaseEmailPasswordAuthState {
  final String message;
  FirebaseEmailPasswordLogInFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class FirebaseEmailPasswordSignOut extends FirebaseEmailPasswordAuthState {}

class FirebaseEmailPasswordAuthPasswordVisibilityChanged
    extends FirebaseEmailPasswordAuthState {}
