// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://10.0.2.2:8085';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Candidate>> getCandidates() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Candidate>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/candidate',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Candidate.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Candidate> getCandidate(username) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Candidate>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/candidate/u/${username}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Candidate.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<District>> getDistricts() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<District>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/district',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => District.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<District>> getDistrict(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<District>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/district/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => District.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Country>> getCountries() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Country>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/country',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Country.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Country> getCountry(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Country>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/country/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Country.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<Province>> getProvinces() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Province>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/province',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Province.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Province> getProvince(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Province>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/province/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Province.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<Location>> getLocations() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Location>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/location',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Location.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Location> getLocation(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Location>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/location/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Location.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<Major>> getMajors() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Major>>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, '/api/major',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Major.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Major>> getMajor(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Major>>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, '/api/major/${id}',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Major.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Job>> getJobs() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Job>>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, '/api/job',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Job.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Job> getJob(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Job>(
        Options(method: 'GET', headers: headers, extra: extra)
            .compose(_dio.options, '/api/job/${id}',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Job.fromJson(result.data!);
    return value;
  }

  @override
  Future<List<Company>> getCompanies() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Company>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/company',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => Company.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Company> getCompany(id) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Company>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/company/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Company.fromJson(result.data!);
    return value;
  }

  @override
  Future<HttpResponse<dynamic>> register(auth, register) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'Authorization': auth};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    data.addAll(register.toJson());
    final result = await _dio.fetch(_setStreamType<HttpResponse<dynamic>>(
        Options(method: 'POST', headers: headers, extra: extra)
            .compose(_dio.options, '/api/user',
                queryParameters: queryParameters, data: data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = result.data;
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
