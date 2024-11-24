/// id : 1
/// title : "Oso"
/// title_ar : "Omnis est laborum U"
/// article_category_id : 1
/// is_content_video : false
/// link : null
/// description : "<p>Veritatis vel quia d</p><p>iiiiiiiiiiiiiiiiiiiiiii</p><p>pppppppppppppppppp</p><figure class=\"media\"><oembed url=\"https://www.youtube.com/watch?v=jr53oJY6aHw\"></oembed></figure>"
/// description_ar : "<p>Eius voluptas conseq ppppppppppppppppppp</p>"
/// image : "article_image/1672596287d85c53c3fca8f2dc74da3a47fc9f79d1.png"
/// status : 1
/// hospital_id : 1
/// liked : 6
/// model_create : "Doctor"
/// created_by : 1
/// updated_by : 5
/// deleted_at : null
/// custom_fields : []
/// has_media : false
/// media : []

class Blog {
  Blog({
    num? id,
    String? title,
    String? titleAr,
    num? articleCategoryId,
    bool? isContentVideo,
    dynamic link,
    String? description,
    String? descriptionAr,
    String? image,
    num? status,
    num? hospitalId,
    num? liked,
    String? modelCreate,
    num? createdBy,
    num? updatedBy,
    dynamic deletedAt,
    List<String>? customFields,
    bool? hasMedia,
    List<String>? media,
  }) {
    _id = id;
    _title = title;
    _titleAr = titleAr;
    _articleCategoryId = articleCategoryId;
    _isContentVideo = isContentVideo;
    _link = link;
    _description = description;
    _descriptionAr = descriptionAr;
    _image = image;
    _status = status;
    _hospitalId = hospitalId;
    _liked = liked;
    _modelCreate = modelCreate;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _deletedAt = deletedAt;
    _customFields = customFields;
    _hasMedia = hasMedia;
    _media = media;
  }

  Blog.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _titleAr = json['title_ar'];
    _articleCategoryId = json['article_category_id'];
    _isContentVideo = json['is_content_video'];
    _link = json['link'];
    _description = json['description'];
    _descriptionAr = json['description_ar'];
    _image = json['image'];
    _status = json['status'];
    _hospitalId = json['hospital_id'];
    _liked = json['liked'];
    _modelCreate = json['model_create'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedAt = json['deleted_at'];
    if (json['custom_fields'] != null) {
      _customFields = [];
      json['custom_fields'].forEach((v) {
        _customFields?.add(v);
      });
    }
    _hasMedia = json['has_media'];
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
        _media?.add(v);
      });
    }
  }

  num? _id;
  String? _title;
  String? _titleAr;
  num? _articleCategoryId;
  bool? _isContentVideo;
  dynamic _link;
  String? _description;
  String? _descriptionAr;
  String? _image;
  num? _status;
  num? _hospitalId;
  num? _liked;
  String? _modelCreate;
  num? _createdBy;
  num? _updatedBy;
  dynamic _deletedAt;
  List<dynamic>? _customFields;
  bool? _hasMedia;
  List<String>? _media;



  num? get id => _id;

  String? get title => _title;

  String? get titleAr => _titleAr;

  num? get articleCategoryId => _articleCategoryId;

  bool? get isContentVideo => _isContentVideo;

  dynamic get link => _link;

  String? get description => _description;

  String? get descriptionAr => _descriptionAr;

  String? get image => _image;

  num? get status => _status;

  num? get hospitalId => _hospitalId;

  num? get liked => _liked;

  String? get modelCreate => _modelCreate;

  num? get createdBy => _createdBy;

  num? get updatedBy => _updatedBy;

  dynamic get deletedAt => _deletedAt;

  List<dynamic>? get customFields => _customFields;

  bool? get hasMedia => _hasMedia;

  List<dynamic>? get media => _media;


}
