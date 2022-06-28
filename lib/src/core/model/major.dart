// ignore_for_file: public_member_api_docs, sort_constructors_first
class Major {
  final int id;
  final String? name;
  Major({
    required this.id,
    this.name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  factory Major.fromJson(Map<String, dynamic> json) {
    return Major(
      id: json['id'],
      name: json['name'],
    );
  }
}
