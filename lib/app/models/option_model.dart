import 'package:get/get.dart';

import 'media_model.dart';
import 'parents/model.dart';

class Option extends Model {
  String? _optionGroupId;
  String? _doctorId;
  String? _name;
  double? _price = 0;
  Media? _image;
  String? _description;
  var checked = false.obs;

  Option({String? id, String? optionGroupId, String? doctorId, String? name, double price = 0, String? description}) {
    _description = description;
    _price = price;
    _name = name;
    _doctorId = doctorId;
    _optionGroupId = optionGroupId;
    this.id = id;
  }

  Option.fromJson(Map<String, dynamic>? json) {
    super.fromJson(json);
    optionGroupId = stringFromJson(json, 'option_group_id', defaultValue: '0');
    doctorId = stringFromJson(json, 'doctor_id', defaultValue: '0');
    name = transStringFromJson(json, 'name');
    price = doubleFromJson(json, 'price');
    description = transStringFromJson(json, 'description');
    image = mediaFromJson(json, 'image');
  }

  String get description => _description ?? '';

  set description(String? value) {
    _description = value;
  }

  String get doctorId => _doctorId ?? '';

  set doctorId(String? value) {
    _doctorId = value;
  }

  @override
  int get hashCode =>
      super.hashCode ^ id.hashCode ^ optionGroupId.hashCode ^ doctorId.hashCode ^ name.hashCode ^ price.hashCode ^ image.hashCode ^ description.hashCode ^ checked.hashCode;

  Media get image => _image ?? Media();

  set image(Media? value) {
    _image = value;
  }

  String get name => _name ?? '';

  set name(String? value) {
    _name = value;
  }

  String get optionGroupId => _optionGroupId ?? '';

  set optionGroupId(String? value) {
    _optionGroupId = value;
  }

  double get price => _price ?? 0;

  set price(double value) {
    _price = value;
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
          super == other &&
              other is Option &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              optionGroupId == other.optionGroupId &&
              doctorId == other.doctorId &&
              name == other.name &&
              price == other.price &&
              image == other.image &&
              description == other.description &&
              checked == other.checked;

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    if (this.hasData) map["id"] = id;
    if (_name != null) map["name"] = name;
    if (_price != null) map["price"] = price;
    if (_description != null) map["description"] = description;
    map["checked"] = checked.value;
    if (_optionGroupId != null) map["option_group_id"] = optionGroupId;
    if (_doctorId != null) map["doctor_id"] = doctorId;
    if (this._image != null) {
      map['image'] = this.image.toJson();
    }
    return map;
  }
}
