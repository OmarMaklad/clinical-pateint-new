import 'package:flutter/material.dart';

import 'clinic_model.dart';
import 'doctor_model.dart';
import 'media_model.dart';
import 'parents/model.dart';

class Slide extends Model {
  int? _order;
  String? _text;
  String? _button;
  String? _textPosition;
  Color? _textColor;
  Color? _buttonColor;
  Color? _backgroundColor;
  Color? _indicatorColor;
  Media? _image;
  String? _imageFit;
  Doctor? _doctor;
  int? _doctorId;
  Clinic? _clinic;
  int? _clinicId;
  bool? _enabled;
  String? _type;
  String? _offerLink;

  Slide(
      {String? id,
      int? order,
      String? text,
      String? button,
      String? textPosition,
      Color? textColor,
      Color? buttonColor,
      Color? backgroundColor,
      Color? indicatorColor,
      Media? image,
      String? imageFit,
      Doctor? doctor,
      int? doctorId,
      Clinic? clinic,
      int? clinicId,
      bool? enabled,
      String? offerLink,
      }) {
    _order = order;
    _text = text;
    _button = button;
    _textPosition = textPosition;
    _textColor = textColor;
    _buttonColor = buttonColor;
    _backgroundColor = backgroundColor;
    _indicatorColor = indicatorColor;
    _image = image;
    _imageFit = imageFit;
    _doctor = doctor;
    _doctorId = doctorId;
    _clinic = clinic;
    _clinicId = clinicId;
    _enabled = enabled;
    _type = type;
    _offerLink = offerLink;
    this.id = id;
  }


  Slide.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    _order = intFromJson(json, 'order');
    _text = transStringFromJson(json, 'text');
    _button = transStringFromJson(json, 'button');
    _textPosition = stringFromJson(json, 'text_position');
    _textColor = colorFromJson(json, 'text_color');
    _buttonColor = colorFromJson(json, 'button_color');
    _backgroundColor = colorFromJson(json, 'background_color');
    _indicatorColor = colorFromJson(json, 'indicator_color');
    _image = mediaFromJson(json, 'image');
    _imageFit = stringFromJson(json, 'image_fit');
    _doctor = json['doctor_id'] != null ? Doctor(id: json['doctor_id'].toString()) : null;
    _clinic = json['clinic_id'] != null ? Clinic(id: json['clinic_id'].toString()) : null;
    _enabled = boolFromJson(json, 'enabled');
    _type = json['type'];
    _doctorId = json['doctor_id'];
    _clinicId = json['clinic_id'];
    _offerLink = json['offer_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Slide &&
          runtimeType == other.runtimeType &&
          _order == other._order &&
          _text == other._text &&
          _button == other._button &&
          _textPosition == other._textPosition &&
          _textColor == other._textColor &&
          _buttonColor == other._buttonColor &&
          _backgroundColor == other._backgroundColor &&
          _indicatorColor == other._indicatorColor &&
          _image == other._image &&
          _imageFit == other._imageFit &&
          _doctor == other._doctor &&
          _clinic == other._clinic &&
          _enabled == other._enabled &&
          _doctorId == other._doctorId &&
          _clinicId == other._clinicId &&
          _offerLink == other._offerLink &&
          _type == other._type;

  @override
  int get hashCode =>
      super.hashCode ^
      _order.hashCode ^
      _text.hashCode ^
      _button.hashCode ^
      _textPosition.hashCode ^
      _textColor.hashCode ^
      _buttonColor.hashCode ^
      _backgroundColor.hashCode ^
      _indicatorColor.hashCode ^
      _image.hashCode ^
      _imageFit.hashCode ^
      _doctor.hashCode ^
      _clinic.hashCode ^
      _enabled.hashCode ^
      _doctorId.hashCode ^
      _clinicId.hashCode ^
      _offerLink.hashCode ^
      _type.hashCode;

  String? get offerLink => _offerLink;

  set offerLink(String? value) {
    _offerLink = value;
  }

  String? get type => _type;

  set type(String? value) {
    _type = value;
  }


  int? get doctorId => _doctorId;

  set doctorId(int? value) {
    _doctorId = value;
  }

  int? get clinicId => _clinicId;

  set clinicId(int? value) {
    _clinicId = value;
  }

  bool get enabled => _enabled ?? false;

  set enabled(bool value) {
    _enabled = value;
  }

  Clinic get clinic => _clinic  ?? Clinic();

  set clinic(Clinic value) {
    _clinic = value;
  }

  Doctor get doctor => _doctor ?? Doctor();

  set doctor(Doctor value) {
    _doctor = value;
  }

  String get imageFit => _imageFit  ?? '';

  set imageFit(String value) {
    _imageFit = value;
  }

  Media get image => _image ?? Media();

  set image(Media value) {
    _image = value;
  }

  Color get indicatorColor => _indicatorColor ?? Colors.white24;

  set indicatorColor(Color value) {
    _indicatorColor = value;
  }

  Color get backgroundColor => _backgroundColor ?? Colors.white24;

  set backgroundColor(Color value) {
    _backgroundColor = value;
  }

  Color get buttonColor => _buttonColor  ?? Colors.white24;

  set buttonColor(Color value) {
    _buttonColor = value;
  }

  Color get textColor => _textColor ?? Colors.white24;

  set textColor(Color value) {
    _textColor = value;
  }

  String get textPosition => _textPosition ?? '';

  set textPosition(String value) {
    _textPosition = value;
  }

  String get button => _button ?? '';

  set button(String value) {
    _button = value;
  }

  String get text => _text ?? '';

  set text(String value) {
    _text = value;
  }

  int get order => _order ?? 0;

  set order(int value) {
    _order = value;
  }
}
