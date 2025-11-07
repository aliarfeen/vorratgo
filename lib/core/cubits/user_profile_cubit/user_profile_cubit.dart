import 'package:bloc/bloc.dart';
import 'package:vorratgo/core/data/model/user.dart';
import 'package:vorratgo/core/data/repository/user_repository.dart';
import 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserRepository userRepository;

  UserProfileCubit(this.userRepository) : super(UserProfileInitial());

  Future<void> loadUserProfile({
    required String email,
    required String password,
  }) async {
    emit(UserProfileLoading());
    try {
      final data = await userRepository.loginUser(
        email: email,
        password: password,
      );

      if (data != null) {
        final user = UserModel.fromMap(data);
        emit(UserProfileLoaded(user));
      } else {
        emit(UserProfileError('User data not found'));
      }
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  Future<void> refreshUserProfile(String uid) async {
    emit(UserProfileLoading());
    try {
      final data = await userRepository.fetchUserData(uid);
      if (data != null) {
        final user = UserModel.fromMap(data);
        emit(UserProfileLoaded(user));
      } else {
        emit(UserProfileError('User data not found'));
      }
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
