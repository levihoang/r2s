// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'hr.dart';
import 'job_position.dart';
import 'location.dart';
import 'major.dart';
import 'status.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'hr')
  final HR? hr;

  @JsonKey(name: 'desciption')
  final String? description;

  @JsonKey(name: 'major')
  final Major? major;

  @JsonKey(name: 'jobposition')
  final JobPosition? jobposition;

  @JsonKey(name: 'amount')
  final int? amount;

  @JsonKey(name: 'salaryMin')
  final int? salaryMin;

  @JsonKey(name: 'salaryMax')
  final int? salaryMax;

  @JsonKey(name: 'requirement')
  final String? requirement;

  @JsonKey(name: 'otherInfo')
  final String? otherInfo;

  @JsonKey(name: 'timeStartStr')
  final String? timeStartStr;

  @JsonKey(name: 'timeEndStr')
  final String? timeEndStr;

  @JsonKey(name: 'locationjob')
  final Location? locationjob;

  @JsonKey(name: 'createDate')
  final String? createDate;

  @JsonKey(name: 'status')
  final Status? status;

  @JsonKey(name: 'applyDTO')
  final List<Job>? applyDTO;
  Job({
    this.id,
    this.hr,
    this.description,
    this.major,
    this.jobposition,
    this.amount,
    this.salaryMin,
    this.salaryMax,
    this.requirement,
    this.otherInfo,
    this.timeStartStr,
    this.timeEndStr,
    this.locationjob,
    this.createDate,
    this.status,
    this.applyDTO,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
