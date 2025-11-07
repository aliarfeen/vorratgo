part of 'user_center_cubit.dart';

abstract class UserProfileCenterState {}

class UserProfileInitial extends UserProfileCenterState {}

class UserProfileLoaded extends UserProfileCenterState {
  final UserModel user;
  UserProfileLoaded(this.user);
}

class UserProfileError extends UserProfileCenterState {
  final String message;
  UserProfileError(this.message);
}
