import 'package:json_annotation/json_annotation.dart';
import 'job.dart';
import 'major.dart';
import 'user.dart';

part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'userDTO')
  final User? userDTO;

  @JsonKey(name: 'major')
  final Major? major;

  @JsonKey(name: 'careJobs')
  final List<Job>? careJobs;

  @JsonKey(name: 'cv')
  final String? cv;
  Candidate({
    this.id,
    this.userDTO,
    this.major,
    this.careJobs,
    this.cv,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
