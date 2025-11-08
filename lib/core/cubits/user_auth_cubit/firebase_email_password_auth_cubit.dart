import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vorratgo/core/data/model/user.dart';
import 'package:vorratgo/core/data/repository/local_repository.dart';
import 'package:vorratgo/core/data/repository/user_repository.dart';

part 'firebase_email_password_auth_state.dart';

class FirebaseEmailPasswordAuthCubit
    extends Cubit<FirebaseEmailPasswordAuthState> {
  final UserRepository userRepository;
  final LocalRepo localRepo;

  FirebaseEmailPasswordAuthCubit(this.userRepository, this.localRepo)
    : super(FirebaseEmailPasswordAuthInitial());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  bool isPasswordVisible = false;

  Future<void> register() async {
    if (!registerFormKey.currentState!.validate()) return;

    emit(FirebaseEmailPasswordRegisterLoading());
    try {
      await userRepository.registerUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        username: usernameController.text.trim(),
      );
      emit(FirebaseEmailPasswordRegisterSuccess());
    } catch (e) {
      emit(FirebaseEmailPasswordRegisterFailure(e.toString()));
    }
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) return;

    emit(FirebaseEmailPasswordLogInLoading());
    try {
      final data = await userRepository.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // After successful login, fetch user data and save it locally
      final userModel = UserModel.fromMap(data!);
      await localRepo.saveUser(userModel);

      final user = UserModel.fromMap(data);

      emit(FirebaseEmailPasswordLogInSuccess(user));
    } catch (e) {
      emit(FirebaseEmailPasswordLogInFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await userRepository.signOut();
    emit(FirebaseEmailPasswordSignOut());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    return super.close();
  }
}
