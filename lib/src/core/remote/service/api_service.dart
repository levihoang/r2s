import 'package:dio/dio.dart';
import 'package:it_intership_jobs_r2s/src/core/remote/response/register_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../model/candidate.dart';
import '../../model/company.dart';
import '../../model/country.dart';
import '../../model/district.dart';
import '../../model/job.dart';
import '../../model/location.dart';
import '../../model/major.dart';
import '../../model/province.dart';
import '../request/login_request.dart';
import '../request/register_request.dart';
import '../response/login_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8085')
abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: 5000,
        receiveTimeout: 5000,
        connectTimeout: 5000,
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  // @GET('/api/user')
  // Future<List<User>> getUsers(@Header("Authorization") String auth);
  // @GET('/api/user/{username}')
  // Future<User> getUser(@Path('username') String username);

  @GET('/api/candidate')
  Future<List<Candidate>> getCandidates();
  @GET('/api/candidate/u/{username}')
  Future<Candidate> getCandidate(@Path('username') String username);

  @GET('/api/district')
  Future<List<District>> getDistricts();
  @GET('/api/district/{id}')
  Future<List<District>> getDistrict(@Path('id') int id);

  @GET('/api/country')
  Future<List<Country>> getCountries();
  @GET('/api/country/{id}')
  Future<Country> getCountry(@Path('id') int id);

  @GET('/api/province')
  Future<List<Province>> getProvinces();
  @GET('/api/province/{id}')
  Future<Province> getProvince(@Path('id') int id);

  @GET('/api/location')
  Future<List<Location>> getLocations();
  @GET('/api/location/{id}')
  Future<Location> getLocation(@Path('id') int id);

  @GET('/api/major')
  Future<List<Major>> getMajors();
  @GET('/api/major/{id}')
  Future<List<Major>> getMajor(@Path('id') int id);

  @GET('/api/job')
  Future<List<Job>> getJobs();
  @GET('/api/job/{id}')
  Future<Job> getJob(@Path('id') int id);

  @GET('/api/company')
  Future<List<Company>> getCompanies();
  @GET('/api/company/{id}')
  Future<Company> getCompany(@Path('id') int id);

  @POST('/api/user/add')
  Future<RegisterResponse> register(@Body() RegisterRequest register);

  @POST('/api/signin')
  Future<LoginResponse> login(@Body() LoginRequest login);
}
