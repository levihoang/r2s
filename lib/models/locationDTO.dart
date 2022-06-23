import 'package:it_intership_jobs_r2s/models/district.dart';
import 'package:it_intership_jobs_r2s/models/job.dart';

class LocationsDTO {
  int? id;
  District? district;
  String? address;
  String? note;
  String? companies;
  List? universities;
  List? jobs;

  LocationsDTO(
      {this.id,
      this.district,
      this.address,
      this.note,
      this.companies,
      this.universities,
      this.jobs});

  LocationsDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    address = json['address'];
    note = json['note'];
    companies = json['companies'];
    // if (json['universities'] != null) {
    //   universities = <Null>[];
    //   json['universities'].forEach((v) {
    //     universities!.add(Null.fromJson(v));
    //   });
    // }
    if (json['jobs'] != null) {
      jobs = [];
      json['jobs'].forEach((v) {
        jobs!.add(Job.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    data['address'] = address;
    data['note'] = note;
    data['companies'] = companies;
    if (universities != null) {
      data['universities'] = universities!.map((v) => v.toJson()).toList();
    }
    if (jobs != null) {
      data['jobs'] = jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
