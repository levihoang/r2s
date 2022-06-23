import 'package:it_intership_jobs_r2s/models/Country.dart';

class Province {
  int? id;
  String? name;
  String? shortName;
  Countries? countries;

  Province({this.id, this.name, this.shortName, this.countries});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    countries = json['countries'] != null
        ? new Countries.fromJson(json['countries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    if (this.countries != null) {
      data['countries'] = this.countries!.toJson();
    }
    return data;
  }
}
