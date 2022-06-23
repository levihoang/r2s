import 'package:it_intership_jobs_r2s/models/Province.dart';

class District {
  int? id;
  String? name;
  String? prefix;
  Province? province;

  District({this.id, this.name, this.prefix, this.province});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    prefix = json['prefix'];
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['prefix'] = prefix;
    if (province != null) {
      data['province'] = province!.toJson();
    }
    return data;
  }
}
