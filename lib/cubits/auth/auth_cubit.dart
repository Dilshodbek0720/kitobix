import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kitobix/data/models/form/form_status.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';
import 'package:kitobix/data/repositories/auth_repository.dart';
import 'package:kitobix/utils/ui_utils/loading_dialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> signUp(context) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.signUpUser(
      email: state.email,
      password: state.password,
    );
    hideLoading(context: context);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
    }
    emit(state.copyWith(status: FormStatus.pure));
  }

  Future<void> logIn(context) async {
    emit(state.copyWith(status: FormStatus.loading));
    showLoading(context: context);
    UniversalData data = await authRepository.loginUser(
      email: state.email,
      password: state.password,
    );
    hideLoading(context: context);
    if (data.error.isEmpty) {
      emit(state.copyWith(status: FormStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusMessage: data.error,
        ),
      );
    }
    emit(state.copyWith(status: FormStatus.pure));
  }

  void updateEmail(String email) {
    debugPrint("AUTH EMAIL: $email");
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    debugPrint("AUTH PASSWORD: $password");
    emit(state.copyWith(password: password));
  }
}
