class Insurance {
  Insurance({
    this.id,
    this.name,
    this.description,
  });

  Insurance.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  num? id;
  String? name;
  String? description;

  Insurance copyWith({
    num? id,
    String? name,
    String? description,
  }) =>
      Insurance(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    return map;
  }
}
