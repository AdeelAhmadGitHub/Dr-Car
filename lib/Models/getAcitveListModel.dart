import 'DataList.dart';

class GetActiveListingModel {
  bool? status;
  Data? data;

  GetActiveListingModel({this.status, this.data});

  GetActiveListingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<DataList>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataList>[];
      json['data'].forEach((v) {
        data!.add(new DataList.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

// class DataList{
//   int? id;
//   String? userId;
//   String? title;
//   String? actualPrice;
//   String? discountPrice;
//   String? engineType;
//   String? mpg;
//   String? exteriorColorId;
//   String? interiorColorId;
//   String? drivetrain;
//   String? transmission;
//   String? door;
//   String? seatCapacity;
//   String? typeId;
//   String? vin;
//   String? stock;
//   String? location;
//   String? status;
//   String? windowSticker;
//   String? featuredImage;
//   List<String>? images;
//   String? createdAt;
//   String? updatedAt;
//   String? discountPercentage;
//
//   DataList(
//       {this.id,
//         this.userId,
//         this.title,
//         this.actualPrice,
//         this.discountPrice,
//         this.engineType,
//         this.mpg,
//         this.exteriorColorId,
//         this.interiorColorId,
//         this.drivetrain,
//         this.transmission,
//         this.door,
//         this.seatCapacity,
//         this.typeId,
//         this.vin,
//         this.stock,
//         this.location,
//         this.status,
//         this.windowSticker,
//         this.featuredImage,
//         this.images,
//         this.createdAt,
//         this.updatedAt,
//         this.discountPercentage});
//
//   DataList.fromJson(Map<String, dynamic> json) {
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
//     images = json['images'].cast<String>();
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     discountPercentage = json['discount_percentage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['title'] = this.title;
//     data['actual_price'] = this.actualPrice;
//     data['discount_price'] = this.discountPrice;
//     data['engine_type'] = this.engineType;
//     data['mpg'] = this.mpg;
//     data['exterior_color_id'] = this.exteriorColorId;
//     data['interior_color_id'] = this.interiorColorId;
//     data['drivetrain'] = this.drivetrain;
//     data['transmission'] = this.transmission;
//     data['door'] = this.door;
//     data['seat_capacity'] = this.seatCapacity;
//     data['type_id'] = this.typeId;
//     data['vin'] = this.vin;
//     data['stock'] = this.stock;
//     data['location'] = this.location;
//     data['status'] = this.status;
//     data['window_sticker'] = this.windowSticker;
//     data['featured_image'] = this.featuredImage;
//     data['images'] = this.images;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['discount_percentage'] = this.discountPercentage;
//     return data;
//   }
// }

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
