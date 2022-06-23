class Job {
  String? desciption;
  String? nameMajor;
  String? namePosition;
  int? amount;
  int? salaryMax;
  int? salaryMin;
  String? requirement;
  String? additionInfor;
  int? startTime;
  int? endtime;
  String? location;
  int? createDate;
  String? status;
  String? name;

  Job(
      {this.desciption,
      this.nameMajor,
      this.namePosition,
      this.amount,
      this.salaryMax,
      this.salaryMin,
      this.requirement,
      this.additionInfor,
      this.startTime,
      this.endtime,
      this.location,
      this.createDate,
      this.status,
      this.name});

  Job.fromJson(Map<String, dynamic> json) {
    desciption = json['desciption'];
    nameMajor = json['nameMajor'];
    namePosition = json['namePosition'];
    amount = json['amount'];
    salaryMax = json['salaryMax'];
    salaryMin = json['salaryMin'];
    requirement = json['requirement'];
    additionInfor = json['additionInfor'];
    startTime = json['startTime'];
    endtime = json['endtime'];
    location = json['location'];
    createDate = json['createDate'];
    status = json['status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['desciption'] = desciption;
    data['nameMajor'] = nameMajor;
    data['namePosition'] = namePosition;
    data['amount'] = amount;
    data['salaryMax'] = salaryMax;
    data['salaryMin'] = salaryMin;
    data['requirement'] = requirement;
    data['additionInfor'] = additionInfor;
    data['startTime'] = startTime;
    data['endtime'] = endtime;
    data['location'] = location;
    data['createDate'] = createDate;
    data['status'] = status;
    data['name'] = name;
    return data;
  }
}
