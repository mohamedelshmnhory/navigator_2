import 'package:beautyapp/models/user_model.dart';

abstract class AuthStates {}

class CustomerLoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final UserModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends AuthStates {
  final String? error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final UserModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends AuthStates {
  final String? error;

  RegisterErrorState(this.error);
}

class ConfirmationLoadingState extends AuthStates {}

class ConfirmationSuccessState extends AuthStates {
  final UserModel loginModel;
  ConfirmationSuccessState(this.loginModel);
}

class ConfirmationErrorState extends AuthStates {
  final String? error;

  ConfirmationErrorState(this.error);
}

class CodeSentLoadingState extends AuthStates {}

class CodeSentSuccessState extends AuthStates {}

class CodeSentErrorState extends AuthStates {
  final String? error;

  CodeSentErrorState(this.error);
}

class PasswordResetLoadingState extends AuthStates {}

class PasswordResetSuccessState extends AuthStates {
  final String? token;

  PasswordResetSuccessState(this.token);
}

class PasswordResetErrorState extends AuthStates {
  final String? error;

  PasswordResetErrorState(this.error);
}

class CustomerChangePasswordVisibilityState extends AuthStates {}

class CustomerRegisterChangePasswordVisibilityState extends AuthStates {}

class ProfileLoadingState extends AuthStates {}

class ProfileSuccessState extends AuthStates {
  final String msg;
  final UserModel loginModel;

  ProfileSuccessState(this.loginModel, this.msg);
}

class ProfileErrorState extends AuthStates {
  final String? error;

  ProfileErrorState(this.error);
}

class EditProfileLoadingState extends AuthStates {}

class EditProfileSuccessState extends AuthStates {
  final String msg;
  final UserModel loginModel;

  EditProfileSuccessState(this.loginModel, this.msg);
}

class EditProfileErrorState extends AuthStates {
  final String? error;

  EditProfileErrorState(this.error);
}
