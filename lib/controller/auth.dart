import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muta/network/network/api/user/api_rep.dart';
import 'package:muta/network/network/dio_exception.dart';
import 'package:muta/services/secure_storage/secure_storage.dart';
import 'package:muta/utils/util_helpers.dart';

class AuthController extends GetxService{
  final _apiRepo = ApiRepo();
  final emailController = TextEditingController();

  late String firstName;
  late String lastName;
  String email = '';
  late String password;
  late String confirmedPassword;
  late String userToken;
  String errorMessage = "";
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  Future<bool> logIn() async {
    try {
      errorMessage = '';
      getProgressDialog();
      final response = await _apiRepo.loginUserApi(email, password);
      final responseBody = response.data;
      userToken = responseBody['token'];
      await SecureStorage().loggedIn(isLogged: true);
      await SecureStorage().saveToken(token: userToken);
      getSnackBar(responseBody["message"]);
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      return false;
    } finally {
      Get.back();
    }
  }

  Future<bool> createAccount() async {
    try {
      errorMessage = '';
      getProgressDialog();
      final response = await _apiRepo.createAccountApi(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      final responseBody = response.data;
      getSnackBar(responseBody["message"]);
      debugPrint(responseBody.toString());
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      return false;
    } finally {
      Get.back();
    }
  }
}