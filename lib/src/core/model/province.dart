import 'country.dart';

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
        ? Countries.fromJson(json['countries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    if (countries != null) {
      data['countries'] = countries!.toJson();
    }
    return data;
  }
}
