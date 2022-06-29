import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/core/model/company.dart';

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

  Future<bool> isSucceedSignIn({String? username, String? password}) async {
    LoginResponse loginResponse = await ApiService(Dio()).login(LoginRequest(
      username: username,
      password: password,
    ));
    if (loginResponse.token == null) {
      return false;
    } else {
      _token = 'Bearer ${loginResponse.token}';
      _username = username;
      getCandidate();
      log('SUCCEED LOGIN');
      return true;
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
