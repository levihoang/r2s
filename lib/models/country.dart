class Countries {
  int? id;
  String? name;
  String? areaCode;
  String? createDate;
  String? provinces;

  Countries(
      {this.id, this.name, this.areaCode, this.createDate, this.provinces});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    areaCode = json['areaCode'];
    createDate = json['createDate'];
    provinces = json['provinces'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['areaCode'] = this.areaCode;
    data['createDate'] = this.createDate;
    data['provinces'] = this.provinces;
    return data;
  }
}
