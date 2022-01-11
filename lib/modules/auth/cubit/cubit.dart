import 'package:beautyapp/models/user_model.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/network/end_points.dart';
import 'package:beautyapp/shared/network/remote/dio_helper.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(CustomerLoginInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  UserModel? loginModel;

  Future getProfile() async {
    bool isInternet = await isInternetConnected();
    if (isInternet) {
      if (userToken != '' && userToken != 'x') {
        // deviceToken = await FirebaseMessaging.instance.getToken();
        emit(ProfileLoadingState());
        DioHelper.getData(
          url: PROFILE,
          token: userToken,
        ).then((value) {
          if (value.data['status']) {
            loginModel = UserModel.fromJson(value.data);
            emit(ProfileSuccessState(loginModel!, value.data['message']));
          } else {
            emit(ProfileErrorState(value.data['message']));
          }
        }).catchError((error) {
          debugPrint(error.toString());
          emit(ProfileErrorState(internetErrorMsg));
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 5)).then((value) => getProfile());
    }
  }

  void updateProfile({
    required Map<String, dynamic> data,
  }) async {
    emit(EditProfileLoadingState());
    DioHelper.postData(
      url: EDITPROFILE,
      token: userToken,
      data: FormData.fromMap(data),
    ).then((value) {
      if (value.data['status']) {
        loginModel = UserModel.fromJson(value.data);

        emit(EditProfileSuccessState(loginModel!, value.data['message']));
      } else {
        emit(EditProfileErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(EditProfileErrorState(internetErrorMsg));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (value.data['status']) {
        loginModel = UserModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel!));
      } else {
        emit(LoginErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(LoginErrorState(internetErrorMsg));
    });
  }

  void userRegister({
    required Map data,
  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: data,
    ).then((value) {
      if (value.data['status']) {
        loginModel = UserModel.fromJson(value.data);
        emit(RegisterSuccessState(loginModel!));
      } else {
        emit(RegisterErrorState(value.data['message']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(RegisterErrorState(internetErrorMsg));
    });
  }

  void phoneConfirmation({
    required String? phone,
    required String code,
    required String url,
  }) {
    emit(ConfirmationLoadingState());
    debugPrint(code + phone!);
    DioHelper.postData(
      url: url,
      data: {
        'code': code,
        'phone': phone,
      },
    ).then((value) {
      if (value.data['state']) {
        loginModel = UserModel.fromJson(value.data);
        emit(ConfirmationSuccessState(loginModel!));
      } else {
        emit(ConfirmationErrorState(value.data['msg']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ConfirmationErrorState(internetErrorMsg));
    });
  }

  forgetPassword({
    required String? phone,
  }) {
    emit(ConfirmationLoadingState());
    DioHelper.postData(
      url: FORGETPASSWORD,
      data: {
        'phone': phone,
      },
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['state']) {
        emit(CodeSentSuccessState());
      } else {
        emit(CodeSentErrorState(value.data['msg']));
      }
    }).catchError((error) {
      emit(CodeSentErrorState(internetErrorMsg));
    });
  }

  void passwordReset({
    required String? code,
    required String? token,
    required String password,
  }) {
    emit(PasswordResetLoadingState());
    DioHelper.postData(
      url: RESETPASSWORD,
      token: token,
      data: {
        // 'code': code,
        // 'phone': phone,
        'old_password': code,
        'password': password,
      },
    ).then((value) {
      debugPrint(value.data.toString());
      if (value.data['state']) {
        emit(PasswordResetSuccessState(value.data['data']['token']));
      } else {
        emit(PasswordResetErrorState(value.data['msg']));
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(PasswordResetErrorState(internetErrorMsg));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(CustomerChangePasswordVisibilityState());
  }
}
