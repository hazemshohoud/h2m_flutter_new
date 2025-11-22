import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h2m_destrib/core/networking/api_constants.dart';
import 'package:h2m_destrib/core/networking/api_result.dart';
import 'package:h2m_destrib/features/login/data/models/login_request_body.dart';
import 'package:h2m_destrib/features/login/data/models/representative_request_body.dart';
import 'package:h2m_destrib/features/login/data/repos/login_repo.dart';
import 'package:h2m_destrib/features/login/logic/state/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/helpers/mainclass.dart';
import '../../data/repos/representative_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  final RepresentativeRepo _repRepo;

  LoginCubit(this._loginRepo, this._repRepo)
      : super(const LoginState.initial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //TextEditingController pathController = TextEditingController();
  String? mandoubName = '';
  final formKey = GlobalKey<FormState>();
  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //final String? userId = prefs.getString('h2m_user_id');

    emit(const LoginState.loading());

    final response = await _loginRepo.logiIn(loginRequestBody);
    response.when(success: (loginResponse) async {
      try {
        //if (userId == null) {
        prefs.setString(
            "h2m_user_id",
            loginResponse.user_id == null
                ? "-1"
                : loginResponse.user_id.toString());
        prefs.setString("h2m_path", ApiConstants.apiBaseUrl);
        prefs.setString("h2m_user_name", loginResponse.user_namee ?? '');
        prefs.setString("h2m_isAdmin", loginResponse.admin.toString());
        prefs.setString("h2m_password", loginRequestBody.passwordText);
        print('ADMIN >>>>>> ${loginResponse.admin}');
        MainClass.h2m_isAdmin = loginResponse.admin ?? false;
        MainClass.userName = loginResponse.user_namee ?? '';
        print(
            'path ::: ${prefs.getString('h2m_path')} ::: username ::: ${prefs.getString('h2m_user_name')} ::: password ::: ${prefs.getString('h2m_password')} ::: userId ::: ${prefs.getString('h2m_user_id')}');
        //}
      } catch (e) {
        //print(e);
      }
      RepresentativeRequestBody representativeRequestBody =
          RepresentativeRequestBody(
        user_id: loginResponse.user_id ?? -1,
      );
      final repResponse =
          await _repRepo.getRepresentative(representativeRequestBody);
      repResponse.when(success: (responseBody) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("h2m_namemndob", responseBody.namemndob ?? "");
        mandoubName = prefs.getString("h2m_namemndob");
        await prefs.setString(
            "h2m_idFreaShrka", responseBody.idFreaShrka ?? "1");
        await prefs.setString("h2m_idKhazna", responseBody.idKhazna ?? "1");
        await prefs.setString("h2m_idMakhzan", responseBody.idMakhzan ?? "1");
        await prefs.setString("h2m_replastname", responseBody.lastname ?? "0");
        await prefs.setString("h2m_khazna", responseBody.khazna ?? "");
        await prefs.setString("h2m_makhzan", responseBody.makhzan ?? "");
        await prefs.setString("h2m_nameshrka", responseBody.nameshrka ?? "");
        await prefs.setString(
            "h2m_avergSerSHra", responseBody.avergSerSHra ?? "");

        MainClass.namemndob = responseBody.namemndob ?? "";
        MainClass.idFreaShrka = responseBody.idFreaShrka ?? "1";
        MainClass.idKhazna = responseBody.idKhazna ?? "1";
        MainClass.idMakhzan = responseBody.idMakhzan ?? "1";
        MainClass.lastname = responseBody.lastname ?? "0";
        MainClass.khazna = responseBody.khazna ?? "";
        MainClass.makhzan = responseBody.makhzan ?? "";
        MainClass.nameshrka = responseBody.nameshrka ?? "";
        MainClass.avergSerSHra = responseBody.avergSerSHra ?? "";
        MainClass.currUserId = loginResponse.user_id == null
            ? "-1"
            : loginResponse.user_id.toString();
        //print('mandoubName_prefs: $mandoubName');
      }, failure: (error) {
        //emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      });

      final mosamAmalResponse = await _repRepo.getMosamAmal();
      mosamAmalResponse.when(success: (responseBody) async {
        await prefs.setString("h2m_idMosam", responseBody.mosam_id ?? "1");
        await prefs.setString("h2m_nameMosam", responseBody.mosam_name ?? '');
        MainClass.idMosam = responseBody.mosam_id ?? "";
        MainClass.nameMosam = responseBody.mosam_name ?? "";
      }, failure: (error) {
        //emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
      });

      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ""));
    });
  }
}
