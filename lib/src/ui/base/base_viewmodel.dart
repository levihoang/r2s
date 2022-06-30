import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/core/model/company.dart';
import 'package:it_intership_jobs_r2s/src/core/model/role.dart';
import 'package:it_intership_jobs_r2s/src/core/remote/request/register_request.dart';
import 'package:it_intership_jobs_r2s/src/core/remote/response/register_response.dart';

import '../../core/model/candidate.dart';
import '../../core/model/job.dart';
import '../../core/remote/request/login_request.dart';
import '../../core/remote/response/login_response.dart';
import '../../core/remote/service/api_service.dart';

class Controller extends GetxController {
  Candidate? _candidate;
  String? _username;
  List<Job>? _jobs;
  String? _token;
  List<Company>? _companies;

  RxInt selectedIndex = 0.obs;

  void changeSelectedIndex(int selectedIndex) {
    this.selectedIndex.value = selectedIndex;
  }

  String? get username {
    return _username;
  }

  String? get token {
    return _token;
  }

  Future<List<Company>?> getCompanies() async {
    if (_companies == null) {
      _companies = await ApiService(Dio()).getCompanies();
      log('Call API getCompanies');
      return _companies;
    }

    log('Return getCompanies');
    return _companies;
  }

  void refreshCompanies() {
    _companies = null;
  }

  @override
  void onInit() async {
    super.onInit();
    1;
    // log('start GetxController');
    // Future.wait([getCandidate(), getJobs()]);
    // log('succeed GetxController');
  }

  bool isSigned() {
    return _token == null ? false : true;
  }

  void signOut() {
    _token = null;
    _candidate = null;
    _username = null;
  }

  Future<bool> isSucceedSignIn(
      {required String? username, required String? password}) async {
    LoginResponse loginResponse = await ApiService(Dio()).login(LoginRequest(
      username: username,
      password: password,
    ));
    if (loginResponse.token == null) {
      return false;
    } else {
      _token = 'Bearer ${loginResponse.token}';
      _username = username;
      log('username: $_username');
      log('SUCCEED LOGIN');
      return true;
    }
  }

  Future<String?> isAnnouncementRegister({
    required String? username,
    required String? password,
    required String? email,
  }) async {
    RegisterRequest registerRequest = RegisterRequest(
        username: username,
        password: password,
        confirmPassword: password,
        role: Role(id: 3),
        email: email);
    RegisterResponse registerResponse =
        await ApiService(Dio()).register(registerRequest);
    print(registerResponse.toJson());
    if (registerResponse.path == null) {
      return null;
    } else {
      String announcement = "";
      if (registerResponse.username != null) {
        announcement += '${registerResponse.username}\n';
      }
      if (registerResponse.Username != null) {
        announcement += '${registerResponse.Username}\n';
      }
      if (registerResponse.Email != null) {
        announcement += '${registerResponse.Email}\n';
      }
      if (registerResponse.email != null) {
        announcement += '${registerResponse.email}';
      }
      return announcement;
    }
  }

  Future<Candidate?> getCandidate() async {
    if (_username == null) {
      log('username Candidate NULL');
      return null;
    }

    if (_candidate == null) {
      _candidate = await ApiService(Dio()).getCandidate(_username ?? '');
      log('Call API getCandidate');
      return _candidate;
    }

    log('Return Candidate');
    return _candidate;
  }

  void refreshCandidate() {
    _candidate = null;
  }

  Future<List<Job>?> getJobs() async {
    if (_jobs == null) {
      _jobs = await ApiService(Dio()).getJobs();
      log('CALL API getJobs');
      return _jobs;
    }
    log('Return Jobs');
    return _jobs;
  }

  void refreshJobs() {
    _jobs = null;
  }
}
