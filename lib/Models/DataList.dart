class DataList {
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
  String? vin;
  String? stock;
  String? location;
  String? status;
  String? activeStatus;
  String? windowSticker;
  String? featuredImage;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  String? discountPercentage;

  DataList(
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
      this.vin,
      this.stock,
      this.location,
      this.status,
      this.activeStatus,
      this.windowSticker,
      this.featuredImage,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.discountPercentage});

  DataList.fromJson(Map<String, dynamic> json) {
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
    vin = json['vin'];
    stock = json['stock'];
    location = json['location'];
    status = json['status'];
    activeStatus = json['active_status'];
    windowSticker = json['window_sticker'];
    featuredImage = json['featured_image'];
    images = json['images'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['vin'] = this.vin;
    data['stock'] = this.stock;
    data['location'] = this.location;
    data['status'] = this.status;
    data['active_status'] = this.activeStatus;
    data['window_sticker'] = this.windowSticker;
    data['featured_image'] = this.featuredImage;
    data['images'] = this.images;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount_percentage'] = this.discountPercentage;
    return data;
  }
}
