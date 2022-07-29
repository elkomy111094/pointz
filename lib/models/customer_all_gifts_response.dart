class CustomerAllGiftsResponse {
  Result? result;
  bool? success;

  CustomerAllGiftsResponse({this.result, this.success});

  CustomerAllGiftsResponse.fromJson(Map<String, dynamic> json) {
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
  List<ApiGiftModel>? data;
  PaginatedData? paginatedData;

  Result({this.data, this.paginatedData});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ApiGiftModel>[];
      json['data'].forEach((v) {
        data!.add(new ApiGiftModel.fromJson(v));
      });
    }
    paginatedData = json['paginatedData'] != null
        ? new PaginatedData.fromJson(json['paginatedData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paginatedData != null) {
      data['paginatedData'] = this.paginatedData!.toJson();
    }
    return data;
  }
}

class ApiGiftModel {
  int? id;
  int? originalAmount;
  int? availableAmount;
  String? message;
  String? receiverName;
  String? receiverPhoneNumber;
  String? lastUpdatedDate;
  Sender? sender;
  GiftBusiness? business;

  ApiGiftModel(
      {this.id,
      this.originalAmount,
      this.availableAmount,
      this.message,
      this.receiverName,
      this.receiverPhoneNumber,
      this.lastUpdatedDate,
      this.sender,
      this.business});

  ApiGiftModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalAmount = json['originalAmount'];
    availableAmount = json['availableAmount'];
    message = json['message'];
    receiverName = json['receiverName'];
    receiverPhoneNumber = json['receiverPhoneNumber'];
    lastUpdatedDate = json['lastUpdatedDate'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    business = json['business'] != null
        ? new GiftBusiness.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['originalAmount'] = this.originalAmount;
    data['availableAmount'] = this.availableAmount;
    data['message'] = this.message;
    data['receiverName'] = this.receiverName;
    data['receiverPhoneNumber'] = this.receiverPhoneNumber;
    data['lastUpdatedDate'] = this.lastUpdatedDate;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class Sender {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? birthDate;
  String? lastUpdatedDate;

  Sender(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.birthDate,
      this.lastUpdatedDate});

  Sender.fromJson(Map<String, dynamic> json) {
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

class GiftBusiness {
  int? id;
  String? nameAr;
  String? nameEn;
  String? detailsAr;
  String? detailsEn;
  String? contactNumber;
  String? websiteUrl;
  LogoUploadedFile? logoUploadedFile;

  GiftBusiness(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.detailsAr,
      this.detailsEn,
      this.contactNumber,
      this.websiteUrl,
      this.logoUploadedFile});

  GiftBusiness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    detailsAr = json['detailsAr'];
    detailsEn = json['detailsEn'];
    contactNumber = json['contactNumber'];
    websiteUrl = json['websiteUrl'];
    logoUploadedFile = json['logo_UploadedFile'] != null
        ? new LogoUploadedFile.fromJson(json['logo_UploadedFile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['detailsAr'] = this.detailsAr;
    data['detailsEn'] = this.detailsEn;
    data['contactNumber'] = this.contactNumber;
    data['websiteUrl'] = this.websiteUrl;
    if (this.logoUploadedFile != null) {
      data['logo_UploadedFile'] = this.logoUploadedFile!.toJson();
    }
    return data;
  }
}

class LogoUploadedFile {
  int? id;
  String? name;
  int? size;
  String? fileType;
  String? base64Format;

  LogoUploadedFile(
      {this.id, this.name, this.size, this.fileType, this.base64Format});

  LogoUploadedFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
    fileType = json['fileType'];
    base64Format = json['base64_Format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['fileType'] = this.fileType;
    data['base64_Format'] = this.base64Format;
    return data;
  }
}

class PaginatedData {
  int? totalRecords;
  int? pageSize;

  PaginatedData({this.totalRecords, this.pageSize});

  PaginatedData.fromJson(Map<String, dynamic> json) {
    totalRecords = json['totalRecords'];
    pageSize = json['pageSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalRecords'] = this.totalRecords;
    data['pageSize'] = this.pageSize;
    return data;
  }
}
