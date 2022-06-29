import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:it_intership_jobs_r2s/src/core/model/response/login_response.dart';

import '../model/candidate.dart';
import '../model/job.dart';
import '../model/request/login_request.dart';
import '../remote/api_service.dart';

class Controller extends GetxController {
  Candidate? candidate;
  String? username;
  List<Job>? jobs;
  String? token;

  bool isSigned() {
    return token == null ? false : true;
  }

  Future<bool> signIn({String? username, String? password}) async {
    LoginResponse loginResponse = await ApiService(Dio()).login(LoginRequest(
      username: username,
      password: password,
    ));
    if (loginResponse.token == null) {
      return false;
    } else {
      token = 'Bearer ${loginResponse.token}';
      this.username = username;
      getCandidate();
      log('SUCCEED LOGIN');
      return true;
    }
  }

  void signOut() {
    token = null;
    candidate = null;
    username = null;
  }

  @override
  void onInit() async {
    super.onInit();
    log('start GetxController');
    Future.wait([getCandidate(), getJobs()]);
    log('succeed GetxController');
  }

  void setToken({String? token}) {
    this.token = token;
  }

  void setUserName({String? username}) {
    this.username = username;
  }

  Future<Candidate?> getCandidate() async {
    if (username == null) {
      log('please dont call me if you dont add USERNAME');
      return Candidate();
    }

    if (candidate == null) {
      candidate = await ApiService(Dio()).getCandidate(username ?? '');
      log('Call API getCandidate');
      return candidate;
    }

    log('Return Candidate');
    return candidate;
  }

  void refreshCandidate() {
    candidate = null;
  }

  Future<List<Job>?> getJobs() async {
    if (jobs == null) {
      jobs = await ApiService(Dio()).getJobs();
      log('CALL API getJobs');
      return jobs;
    }
    log('Return Jobs');
    return jobs;
  }

  void refreshJobs() {
    jobs = null;
  }
}
