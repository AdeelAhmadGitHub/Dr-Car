class GetSearchFilterModel {
  bool? status;
  List<Data>? data;

  GetSearchFilterModel({this.status, this.data});

  GetSearchFilterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? title;
  String? actualPrice;
  String? discountPrice;
  String? engineType;
  String? mpg;
  String? exteriorColorId;
  String? interiorColorId;
  String? drivetrain;
  String? transmission;
  String? door;
  String? seatCapacity;
  String? typeId;
  String? manufactureId;
  String? vin;
  String? stock;
  String? location;
  String? status;
  String? windowSticker;
  String? featuredImage;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  String? manufactureName;
  String? discountPercentage;

  Data(
      {this.id,
        this.userId,
        this.title,
        this.actualPrice,
        this.discountPrice,
        this.engineType,
        this.mpg,
        this.exteriorColorId,
        this.interiorColorId,
        this.drivetrain,
        this.transmission,
        this.door,
        this.seatCapacity,
        this.typeId,
        this.manufactureId,
        this.vin,
        this.stock,
        this.location,
        this.status,
        this.windowSticker,
        this.featuredImage,
        this.images,
        this.createdAt,
        this.updatedAt,
        this.manufactureName,
        this.discountPercentage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    actualPrice = json['actual_price'];
    discountPrice = json['discount_price'];
    engineType = json['engine_type'];
    mpg = json['mpg'];
    exteriorColorId = json['exterior_color_id'];
    interiorColorId = json['interior_color_id'];
    drivetrain = json['drivetrain'];
    transmission = json['transmission'];
    door = json['door'];
    seatCapacity = json['seat_capacity'];
    typeId = json['type_id'];
    manufactureId = json['manufacture_id'];
    vin = json['vin'];
    stock = json['stock'];
    location = json['location'];
    status = json['status'];
    windowSticker = json['window_sticker'];
    featuredImage = json['featured_image'];
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    manufactureName = json['manufacture_name'];
    discountPercentage = json['discount_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['actual_price'] = this.actualPrice;
    data['discount_price'] = this.discountPrice;
    data['engine_type'] = this.engineType;
    data['mpg'] = this.mpg;
    data['exterior_color_id'] = this.exteriorColorId;
    data['interior_color_id'] = this.interiorColorId;
    data['drivetrain'] = this.drivetrain;
    data['transmission'] = this.transmission;
    data['door'] = this.door;
    data['seat_capacity'] = this.seatCapacity;
    data['type_id'] = this.typeId;
    data['manufacture_id'] = this.manufactureId;
    data['vin'] = this.vin;
    data['stock'] = this.stock;
    data['location'] = this.location;
    data['status'] = this.status;
    data['window_sticker'] = this.windowSticker;
    data['featured_image'] = this.featuredImage;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['manufacture_name'] = this.manufactureName;
    data['discount_percentage'] = this.discountPercentage;
    return data;
  }
}
