class UserData {
  dynamic status;
  String? accessToken;
  String? tokenType;
  int? userId;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? dateOfBirth;
  String? profilePic;
  String? deviceToken;
  String? createdAt;
  UserData(
      {this.status,
        this.accessToken,
        this.tokenType,
        this.userId,
        this.phone,
        this.firstName,
        this.lastName,
        this.email,
        this.dateOfBirth,
        this.profilePic,
        this.deviceToken,
        this.createdAt});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    userId = json['user_id'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    profilePic = json['profile_pic'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['date_of_birth'] = this.dateOfBirth;
    data['profile_pic'] = this.profilePic;
    data['device_token'] = this.deviceToken;
    data['created_at'] = this.createdAt;
    return data;
  }
}
