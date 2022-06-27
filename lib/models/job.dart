class Job {
  int? id;
  String? name;
  String? hr;
  String? desciption;
  String? major;
  Jobposition? jobposition;
  int? amount;
  int? salaryMin;
  int? salaryMax;
  String? requirement;
  String? otherInfo;
  String? timeStartStr;
  String? timeEndStr;
  String? locationjob;
  String? createDate;
  bool? status;
  List? applyDTO;

  Job(
      {this.id,
      this.name,
      this.hr,
      this.desciption,
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
      this.applyDTO});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hr = json['hr'];
    desciption = json['desciption'];
    major = json['major'];
    jobposition = json['jobposition'] != null
        ? Jobposition.fromJson(json['jobposition'])
        : null;
    amount = json['amount'];
    salaryMin = json['salaryMin'];
    salaryMax = json['salaryMax'];
    requirement = json['requirement'];
    otherInfo = json['otherInfo'];
    timeStartStr = json['timeStartStr'];
    timeEndStr = json['timeEndStr'];
    locationjob = json['locationjob'];
    createDate = json['createDate'];
    status = json['status'];
    // if (json['applyDTO'] != null) {
    //   applyDTO = <Null>[];
    //   json['applyDTO'].forEach((v) {
    //     applyDTO!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['hr'] = hr;
    data['desciption'] = desciption;
    data['major'] = major;
    if (jobposition != null) {
      data['jobposition'] = jobposition!.toJson();
    }
    data['amount'] = amount;
    data['salaryMin'] = salaryMin;
    data['salaryMax'] = salaryMax;
    data['requirement'] = requirement;
    data['otherInfo'] = otherInfo;
    data['timeStartStr'] = timeStartStr;
    data['timeEndStr'] = timeEndStr;
    data['locationjob'] = locationjob;
    data['createDate'] = createDate;
    data['status'] = status;
    // if (this.applyDTO != null) {
    //   data['applyDTO'] = this.applyDTO!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Jobposition {
  int? id;
  String? name;
  String? demandUnis;
  String? jobs;

  Jobposition({this.id, this.name, this.demandUnis, this.jobs});

  Jobposition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    demandUnis = json['demandUnis'];
    jobs = json['jobs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['demandUnis'] = demandUnis;
    data['jobs'] = jobs;
    return data;
  }
}
