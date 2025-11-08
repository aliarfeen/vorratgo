import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/data/model/user.dart';
import 'package:vorratgo/core/data/repository/local_repository.dart';

part 'user_center_state.dart';

class UserProfileCenterCubit extends Cubit<UserProfileCenterState> {
  final LocalRepo localRepo;

  UserProfileCenterCubit(this.localRepo) : super(UserProfileInitial());

  void loadUserProfile() {
    final user = localRepo.getUser();
    if (user != null) {
      emit(UserProfileLoaded(user));
    } else {
      emit(UserProfileError('No user data found'));
    }
  }

  void logOut() {
    localRepo.clearAll();
  }
}
