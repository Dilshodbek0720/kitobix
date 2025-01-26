part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.status = FormStatus.pure,
    this.statusMessage = '',
  });

  final String email;
  final String password;
  final FormStatus status;
  final String statusMessage;

  AuthState copyWith({
    String? email,
    String? password,
    FormStatus? status,
    String? statusMessage,
  }) =>
      AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  @override
  String toString() {
    return '''
    email:$email
    password:$password
    status:$status
    ''';
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        statusMessage,
      ];
}
