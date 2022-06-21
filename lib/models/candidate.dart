// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:it_intership_jobs_r2s/models/major.dart';
import 'package:it_intership_jobs_r2s/models/user.dart';

class Candidate {
  final int? id;
  final User? userDTO;
  final Major? major;
  final List? careJobs;
  final String? cv;
  Candidate(
    this.id,
    this.userDTO,
    this.major,
    this.careJobs,
    this.cv,
  );

  Map<String, dynamic> toJson() => {
        'id ': id,
        'userDTO': userDTO,
        'major': major,
        'careJobs': careJobs,
        'cv': cv
      };

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      json['id'],
      User.fromJson(json['userDTO']),
      Major.fromJson(json['major']),
      json['careJobs'],
      json['cv'],
    );
  }
}
