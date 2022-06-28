class UserDeatailsResponse {
  Result? result;
  bool? success;

  UserDeatailsResponse({this.result, this.success});

  UserDeatailsResponse.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Result {
  UserDetails? data;
  Null? paginatedData;

  Result({this.data, this.paginatedData});

  Result.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserDetails.fromJson(json['data']) : null;
    paginatedData = json['paginatedData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['paginatedData'] = this.paginatedData;
    return data;
  }
}

class UserDetails {
  Status? status;
  Status? gender;
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? birthDate;
  String? lastUpdatedDate;

  UserDetails(
      {this.status,
      this.gender,
      this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.birthDate,
      this.lastUpdatedDate});

  UserDetails.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    gender =
        json['gender'] != null ? new Status.fromJson(json['gender']) : null;
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    birthDate = json['birthDate'];
    lastUpdatedDate = json['lastUpdatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['birthDate'] = this.birthDate;
    data['lastUpdatedDate'] = this.lastUpdatedDate;
    return data;
  }
}

class Status {
  int? id;
  String? code;
  String? nameAr;
  String? nameEn;

  Status({this.id, this.code, this.nameAr, this.nameEn});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    return data;
  }
}
