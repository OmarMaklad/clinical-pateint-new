/// id : 1
/// name : "Gannon Valdez"
/// name_ar : "Mikayla Christensen"
/// image : "article_image/1672596287d85c53c3fca8f2dc74da3a47fc9f79d1.png"
/// status : 1
/// created_by : null
/// updated_by : null
/// deleted_at : null
/// custom_fields : []
/// has_media : false
/// media : []

class BlogCategory {
  BlogCategory({
    int? id,
    String? name,
    String? nameAr,
    String? image,
    num? status,
    List<dynamic>? customFields,
    bool? hasMedia,
    List<dynamic>? media,
  }) {
    id = id;
    name = name;
    nameAr = nameAr;
    image = image;
    status = status;
  }

  BlogCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
    status = json['status'];
  }

  int? id;
  String? name;
  String? nameAr;
  String? image;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_ar'] = nameAr;
    map['image'] = image;
    map['status'] = status;
    return map;
  }
}
