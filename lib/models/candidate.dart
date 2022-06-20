import 'major.dart';

class Candidate {
  final int id;
  final Major? major;
  final List? careJobs;
  final String? cv;

  Candidate({
    required this.id,
    this.major,
    this.careJobs,
    this.cv,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'major': major,
        'careJobs': careJobs,
        'cv': cv,
      };

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
        id: json['id'],
        major: json['major'],
        careJobs: json['careJobs'],
        cv: json['cv']);
  }
}
