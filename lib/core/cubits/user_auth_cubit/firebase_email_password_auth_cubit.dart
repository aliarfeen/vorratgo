import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'firebase_email_password_auth_state.dart';

class FirebaseEmailPasswordAuthCubit
    extends Cubit<FirebaseEmailPasswordAuthState> {
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool isPasswordVisible = false;

  FirebaseEmailPasswordAuthCubit() : super(FirebaseEmailPasswordAuthInitial());

  //-----------------Register-------------------------------------------
  void register(String emailAddress, String password) async {
    try {
      emit(FirebaseEmailPasswordRegisterLoading());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      emit(FirebaseEmailPasswordRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(FirebaseEmailPasswordRegisterFailure(e.toString()));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(FirebaseEmailPasswordRegisterFailure(e.toString()));
      }
    } catch (e) {
      emit(FirebaseEmailPasswordRegisterFailure(e.toString()));
    }
  }

  //-----------------------login--------------------------
  void login(String emailAddress, String password) async {
    try {
      emit(FirebaseEmailPasswordLogInLoading());

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(FirebaseEmailPasswordLogInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(FirebaseEmailPasswordLogInFailure(e.toString()));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        emit(FirebaseEmailPasswordLogInFailure(e.toString()));
      }
    } catch (e) {
      emit(FirebaseEmailPasswordLogInFailure(e.toString()));
    }
  }

  //--------------------------sign out ------------------------------
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
