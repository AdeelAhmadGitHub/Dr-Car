// class AllManufacturesModel {
//   bool? status;
//   Data? data;
//
//   AllManufacturesModel({this.status, this.data});
//
//   AllManufacturesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   int? currentPage;
//   List<Data11>? data1;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   // Null? nextPageUrl;
//   String? path;
//   int? perPage;
//   // Null? prevPageUrl;
//   int? to;
//   int? total;
//
//   Data(
//       {this.currentPage,
//       this.data1,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.links,
//       // this.nextPageUrl,
//       this.path,
//       this.perPage,
//       // this.prevPageUrl,
//       this.to,
//       this.total});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'] ?? 0;
//     if (json['data'] != null) {
//       data1 = <Data11>[];
//       json['data'].forEach((v) {
//         data1!.add(new Data11.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'] ?? '';
//     from = json['from'] ?? 0;
//     lastPage = json['last_page'] ?? 0;
//     lastPageUrl = json['last_page_url'] ?? "";
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(new Links.fromJson(v));
//       });
//     }
//     // nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     // prevPageUrl = json['prev_page_url'];
//     to = json['to'] ?? 0;
//     total = json['total'] ?? 0;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     if (this.data1 != null) {
//       data['data'] = this.data1!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     if (this.links != null) {
//       data['links'] = this.links!.map((v) => v.toJson()).toList();
//     }
//     // data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     // data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }
//
// class Data11 {
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
//   String? manufactureId;
//   String? vin;
//   // Null? stock;
//   String? location;
//   String? status;
//   String? windowSticker;
//   String? featuredImage;
//   List<String>? images;
//   String? createdAt;
//   String? updatedAt;
//   String? manufactureName;
//   String? discountPercentage;
//
//   Data11(
//       {this.id,
//       this.userId,
//       this.title,
//       this.actualPrice,
//       this.discountPrice,
//       this.engineType,
//       this.mpg,
//       this.exteriorColorId,
//       this.interiorColorId,
//       this.drivetrain,
//       this.transmission,
//       this.door,
//       this.seatCapacity,
//       this.typeId,
//       this.manufactureId,
//       this.vin,
//       // this.stock,
//       this.location,
//       this.status,
//       this.windowSticker,
//       this.featuredImage,
//       this.images,
//       this.createdAt,
//       this.updatedAt,
//       this.manufactureName,
//       this.discountPercentage});
//
//   Data11.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     userId = json['user_id'] ?? "";
//     title = json['title'] ?? "";
//     actualPrice = json['actual_price'] ?? "";
//     discountPrice = json['discount_price'] ?? "";
//     engineType = json['engine_type'] ?? "";
//     mpg = json['mpg'] ?? "";
//     exteriorColorId = json['exterior_color_id'] ?? "";
//     interiorColorId = json['interior_color_id'] ?? "";
//     drivetrain = json['drivetrain'] ?? "";
//     transmission = json['transmission'] ?? "";
//     door = json['door'] ?? "";
//     seatCapacity = json['seat_capacity'] ?? "";
//     typeId = json['type_id'] ?? "";
//     manufactureId = json['manufacture_id'] ?? "";
//     vin = json['vin'] ?? "";
//     // stock = json['stock'];
//     location = json['location'] ?? "";
//     status = json['status'] ?? "";
//     windowSticker = json['window_sticker'] ?? "";
//     featuredImage = json['featured_image'] ?? "";
//     images = json['images'].cast<String>() ?? [];
//     createdAt = json['created_at'] ?? "";
//     updatedAt = json['updated_at'] ?? "";
//     manufactureName = json['manufacture_name'] ?? "";
//     discountPercentage = json['discount_percentage'] ?? "";
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
//     data['manufacture_id'] = this.manufactureId;
//     data['vin'] = this.vin;
//     // data['stock'] = this.stock;
//     data['location'] = this.location;
//     data['status'] = this.status;
//     data['window_sticker'] = this.windowSticker;
//     data['featured_image'] = this.featuredImage;
//     data['images'] = this.images;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['manufacture_name'] = this.manufactureName;
//     data['discount_percentage'] = this.discountPercentage;
//     return data;
//   }
// }
//
// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }

class AllManufacturesModel {
  bool? status;
  List<Manufactures>? manufactures;

  AllManufacturesModel({this.status, this.manufactures});

  AllManufacturesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['manufactures'] != null) {
      manufactures = <Manufactures>[];
      json['manufactures'].forEach((v) {
        manufactures!.add(new Manufactures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.manufactures != null) {
      data['manufactures'] = this.manufactures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manufactures {
  int? id;
  String? name;
  String? logo;
  String? bannerImage;

  Manufactures({this.id, this.name, this.logo, this.bannerImage});

  Manufactures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['banner_image'] = this.bannerImage;
    return data;
  }
}
