class GetBuyerHomePageModel {
  bool? status;
  List<RecentListingB>? recentListing;
  List<PopularListingB>? popularListing;
  List<NearbyListingB>? nearbyListing;

  GetBuyerHomePageModel({this.status, this.recentListing, this.popularListing, this.nearbyListing});

  GetBuyerHomePageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['recent_listing'] != null) {
      recentListing = <RecentListingB>[];
      json['recent_listing'].forEach((v) {
        recentListing!.add(new RecentListingB.fromJson(v));
      });
    }
    if (json['popular_listing'] != null) {
      popularListing = <PopularListingB>[];
      json['popular_listing'].forEach((v) {
        popularListing!.add(new PopularListingB.fromJson(v));
      });
    }
    if (json['nearby_listing'] != null) {
      nearbyListing = <NearbyListingB>[];
      json['nearby_listing'].forEach((v) {
        nearbyListing!.add(new NearbyListingB.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.recentListing != null) {
      data['recent_listing'] = this.recentListing!.map((v) => v.toJson()).toList();
    }
    if (this.popularListing != null) {
      data['popular_listing'] = this.popularListing!.map((v) => v.toJson()).toList();
    }
    if (this.nearbyListing != null) {
      data['nearby_listing'] = this.nearbyListing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentListingB {
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
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? deviceToken;
  String? favorite;
  String? discountPercentage;

  RecentListingB(
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
      this.phone,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.deviceToken,
      this.favorite,
      this.discountPercentage});

  RecentListingB.fromJson(Map<String, dynamic> json) {
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
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    deviceToken = json['device_token'];
    favorite = json['favorite'];
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
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['device_token'] = this.deviceToken;
    data['favorite'] = this.favorite;
    data['discount_percentage'] = this.discountPercentage;
    return data;
  }
}

class PopularListingB {
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
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? deviceToken;

  String? favorite;
  String? discountPercentage;

  PopularListingB(
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
      this.phone,
      this.firstName,
      this.lastName,
      this.email,
      this.dob,
      this.deviceToken,
      this.favorite,
      this.discountPercentage});

  PopularListingB.fromJson(Map<String, dynamic> json) {
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
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    deviceToken = json['device_token'];
    favorite = json['favorite'];
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
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['device_token'] = this.deviceToken;
    data['favorite'] = this.favorite;
    data['discount_percentage'] = this.discountPercentage;
    return data;
  }
}
class NearbyListingB {
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
  Null? stock;
  String? location;
  String? status;
  String? windowSticker;
  String? featuredImage;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  String? manufactureName;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? deviceToken;
  String? favorite;
  String? discountPercentage;

  NearbyListingB(
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
        this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.dob,
        this.deviceToken,
        this.favorite,
        this.discountPercentage});

  NearbyListingB.fromJson(Map<String, dynamic> json) {
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
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    deviceToken = json['device_token'];
    favorite = json['favorite'];
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
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['device_token'] = this.deviceToken;
    data['favorite'] = this.favorite;
    data['discount_percentage'] = this.discountPercentage;
    return data;
  }
}

// class GetBuyerHomePageModel {
//   GetBuyerHomePageModel({
//     required this.status,
//     required this.recentListing,
//     required this.popularListing,
//     required this.nearbyListing,
//   });
//   late final bool status;
//   late final List<RecentListingB> recentListing;
//   late final List<PopularListingB> popularListing;
//   late final List<NearbyListingB> nearbyListing;
//
//   GetBuyerHomePageModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     recentListing = List.from(json['recent_listing']).map((e)=>RecentListingB.fromJson(e)).toList();
//     popularListing = List.from(json['popular_listing']).map((e)=>PopularListingB.fromJson(e)).toList();
//     nearbyListing = List.from(json['nearby_listing']).map((e)=>NearbyListingB.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['recent_listing'] = recentListing.map((e)=>e.toJson()).toList();
//     _data['popular_listing'] = popularListing.map((e)=>e.toJson()).toList();
//     _data['nearby_listing'] = nearbyListing.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class RecentListingB {
//   RecentListingB({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.actualPrice,
//     required this.discountPrice,
//     required this.engineType,
//     required this.mpg,
//     required this.exteriorColorId,
//     required this.interiorColorId,
//     required this.drivetrain,
//     required this.transmission,
//     required this.door,
//     required this.seatCapacity,
//     required this.typeId,
//     required this.vin,
//     required this.stock,
//     required this.location,
//     required this.status,
//     required this.windowSticker,
//     required this.featuredImage,
//     required this.images,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.discountPercentage,
//   });
//   late final int id;
//   late final String userId;
//   late final String title;
//   late final String actualPrice;
//   late final String discountPrice;
//   late final String engineType;
//   late final String mpg;
//   late final String exteriorColorId;
//   late final String interiorColorId;
//   late final String drivetrain;
//   late final String transmission;
//   late final String door;
//   late final String seatCapacity;
//   late final String typeId;
//   late final String vin;
//   String? stock;
//   late final String location;
//   late final String status;
//   late final String windowSticker;
//   late final String featuredImage;
//   late final List<String> images;
//   late final String createdAt;
//   late final String updatedAt;
//   late final String discountPercentage;
//
//   RecentListingB.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     userId = json['user_id'];
//     title = json['title'];
//     actualPrice = json['actual_price'];
//     discountPrice = json['discount_price'];
//     engineType = json['engine_type'];
//     mpg = json['mpg'];
//     exteriorColorId = json['exterior_color_id'];
//     interiorColorId = json['interior_color_id'];
//     drivetrain = json['drivetrain'];
//     transmission = json['transmission'];
//     door = json['door'];
//     seatCapacity = json['seat_capacity'];
//     typeId = json['type_id'];
//     vin = json['vin'];
//     stock = json['stock'];
//     location = json['location'];
//     status = json['status'];
//     windowSticker = json['window_sticker'];
//     featuredImage = json['featured_image'];
//     images = List.castFrom<dynamic, String>(json['images']);
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     discountPercentage = json['discount_percentage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_id'] = userId;
//     _data['title'] = title;
//     _data['actual_price'] = actualPrice;
//     _data['discount_price'] = discountPrice;
//     _data['engine_type'] = engineType;
//     _data['mpg'] = mpg;
//     _data['exterior_color_id'] = exteriorColorId;
//     _data['interior_color_id'] = interiorColorId;
//     _data['drivetrain'] = drivetrain;
//     _data['transmission'] = transmission;
//     _data['door'] = door;
//     _data['seat_capacity'] = seatCapacity;
//     _data['type_id'] = typeId;
//     _data['vin'] = vin;
//     _data['stock'] = stock;
//     _data['location'] = location;
//     _data['status'] = status;
//     _data['window_sticker'] = windowSticker;
//     _data['featured_image'] = featuredImage;
//     _data['images'] = images;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['discount_percentage'] = discountPercentage;
//     return _data;
//   }
// }
//
// class PopularListingB {
//   PopularListingB({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.actualPrice,
//     required this.discountPrice,
//     required this.engineType,
//     required this.mpg,
//     required this.exteriorColorId,
//     required this.interiorColorId,
//     required this.drivetrain,
//     required this.transmission,
//     required this.door,
//     required this.seatCapacity,
//     required this.typeId,
//     required this.vin,
//     required this.stock,
//     required this.location,
//     required this.status,
//     required this.windowSticker,
//     required this.featuredImage,
//     required this.images,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.discountPercentage,
//   });
//   late final int id;
//   late final String userId;
//   late final String title;
//   late final String actualPrice;
//   late final String discountPrice;
//   late final String engineType;
//   late final String mpg;
//   late final String exteriorColorId;
//   late final String interiorColorId;
//   late final String drivetrain;
//   late final String transmission;
//   late final String door;
//   late final String seatCapacity;
//   late final String typeId;
//   late final String vin;
//    String? stock;
//   late final String location;
//   late final String status;
//   late final String windowSticker;
//   late final String featuredImage;
//   late final List<String> images;
//   late final String createdAt;
//   late final String updatedAt;
//   late final String discountPercentage;
//
//   PopularListingB.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     userId = json['user_id'];
//     title = json['title'];
//     actualPrice = json['actual_price'];
//     discountPrice = json['discount_price'];
//     engineType = json['engine_type'];
//     mpg = json['mpg'];
//     exteriorColorId = json['exterior_color_id'];
//     interiorColorId = json['interior_color_id'];
//     drivetrain = json['drivetrain'];
//     transmission = json['transmission'];
//     door = json['door'];
//     seatCapacity = json['seat_capacity'];
//     typeId = json['type_id'];
//     vin = json['vin'];
//     stock = json['stock'];
//     location = json['location'];
//     status = json['status'];
//     windowSticker = json['window_sticker'];
//     featuredImage = json['featured_image'];
//     images = List.castFrom<dynamic, String>(json['images']);
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     discountPercentage = json['discount_percentage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_id'] = userId;
//     _data['title'] = title;
//     _data['actual_price'] = actualPrice;
//     _data['discount_price'] = discountPrice;
//     _data['engine_type'] = engineType;
//     _data['mpg'] = mpg;
//     _data['exterior_color_id'] = exteriorColorId;
//     _data['interior_color_id'] = interiorColorId;
//     _data['drivetrain'] = drivetrain;
//     _data['transmission'] = transmission;
//     _data['door'] = door;
//     _data['seat_capacity'] = seatCapacity;
//     _data['type_id'] = typeId;
//     _data['vin'] = vin;
//     _data['stock'] = stock;
//     _data['location'] = location;
//     _data['status'] = status;
//     _data['window_sticker'] = windowSticker;
//     _data['featured_image'] = featuredImage;
//     _data['images'] = images;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['discount_percentage'] = discountPercentage;
//     return _data;
//   }
// }
//
// class NearbyListingB {
//   NearbyListingB({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.actualPrice,
//     required this.discountPrice,
//     required this.engineType,
//     required this.mpg,
//     required this.exteriorColorId,
//     required this.interiorColorId,
//     required this.drivetrain,
//     required this.transmission,
//     required this.door,
//     required this.seatCapacity,
//     required this.typeId,
//     required this.vin,
//     required this.stock,
//     required this.location,
//     required this.status,
//     required this.windowSticker,
//     required this.featuredImage,
//     required this.images,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.discountPercentage,
//   });
//   late final int id;
//   late final String userId;
//   late final String title;
//   late final String actualPrice;
//   late final String discountPrice;
//   late final String engineType;
//   late final String mpg;
//   late final String exteriorColorId;
//   late final String interiorColorId;
//   late final String drivetrain;
//   late final String transmission;
//   late final String door;
//   late final String seatCapacity;
//   late final String typeId;
//   late final String vin;
//   String? stock;
//   late final String location;
//   late final String status;
//   late final String windowSticker;
//   late final String featuredImage;
//   late final List<String> images;
//   late final String createdAt;
//   late final String updatedAt;
//   late final String discountPercentage;
//
//   NearbyListingB.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     userId = json['user_id'];
//     title = json['title'];
//     actualPrice = json['actual_price'];
//     discountPrice = json['discount_price'];
//     engineType = json['engine_type'];
//     mpg = json['mpg'];
//     exteriorColorId = json['exterior_color_id'];
//     interiorColorId = json['interior_color_id'];
//     drivetrain = json['drivetrain'];
//     transmission = json['transmission'];
//     door = json['door'];
//     seatCapacity = json['seat_capacity'];
//     typeId = json['type_id'];
//     vin = json['vin'];
//     stock = json['stock'];
//     location = json['location'];
//     status = json['status'];
//     windowSticker = json['window_sticker'];
//     featuredImage = json['featured_image'];
//     images = List.castFrom<dynamic, String>(json['images']);
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     discountPercentage = json['discount_percentage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user_id'] = userId;
//     _data['title'] = title;
//     _data['actual_price'] = actualPrice;
//     _data['discount_price'] = discountPrice;
//     _data['engine_type'] = engineType;
//     _data['mpg'] = mpg;
//     _data['exterior_color_id'] = exteriorColorId;
//     _data['interior_color_id'] = interiorColorId;
//     _data['drivetrain'] = drivetrain;
//     _data['transmission'] = transmission;
//     _data['door'] = door;
//     _data['seat_capacity'] = seatCapacity;
//     _data['type_id'] = typeId;
//     _data['vin'] = vin;
//     _data['stock'] = stock;
//     _data['location'] = location;
//     _data['status'] = status;
//     _data['window_sticker'] = windowSticker;
//     _data['featured_image'] = featuredImage;
//     _data['images'] = images;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['discount_percentage'] = discountPercentage;
//     return _data;
//   }
// }
