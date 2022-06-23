import 'package:it_intership_jobs_r2s/models/locationDTO.dart';

class Company {
  int? id;
  String? name;
  String? logo;
  String? fileLogo;
  String? description;
  String? website;
  String? email;
  String? phone;
  String? tax;
  String? date;
  String? status;
  List<LocationsDTO>? locationsDTO;
  List? rates;

  Company(
      {this.id,
      this.name,
      this.logo,
      this.fileLogo,
      this.description,
      this.website,
      this.email,
      this.phone,
      this.tax,
      this.date,
      this.status,
      this.locationsDTO,
      this.rates});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    fileLogo = json['fileLogo'];
    description = json['description'];
    website = json['website'];
    email = json['email'];
    phone = json['phone'];
    tax = json['tax'];
    date = json['date'];
    status = json['status'];
    if (json['locationsDTO'] != null) {
      locationsDTO = <LocationsDTO>[];
      json['locationsDTO'].forEach((v) {
        locationsDTO!.add(LocationsDTO.fromJson(v));
      });
    }
    // if (json['rates'] != null) {
    //   rates = <Null>[];
    //   json['rates'].forEach((v) {
    //     rates!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['fileLogo'] = fileLogo;
    data['description'] = description;
    data['website'] = website;
    data['email'] = email;
    data['phone'] = phone;
    data['tax'] = tax;
    data['date'] = date;
    data['status'] = status;
    if (locationsDTO != null) {
      data['locationsDTO'] = locationsDTO!.map((v) => v.toJson()).toList();
    }
    // if (rates != null) {
    //   data['rates'] = rates!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
