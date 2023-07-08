class GetAllColorModel {
  bool? status;
  List<ColorD>? colors;

  GetAllColorModel({this.status, this.colors});

  GetAllColorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['colors'] != null) {
      colors = <ColorD>[];
      json['colors'].forEach((v) {
        colors!.add(new ColorD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ColorD {
  int? id;
  String? name;

  ColorD({this.id, this.name});

  ColorD.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
