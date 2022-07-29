class CustomerPointsResponse {
  Result? result;
  bool? success;

  CustomerPointsResponse({this.result, this.success});

  CustomerPointsResponse.fromJson(Map<String, dynamic> json) {
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
  List<CustomerPointModel>? data;
  PaginatedData? paginatedData;

  Result({this.data, this.paginatedData});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CustomerPointModel>[];
      json['data'].forEach((v) {
        data!.add(new CustomerPointModel.fromJson(v));
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

class CustomerPointModel {
  int? id;
  int? available;
  String? lastUpdatedDate;
  Business? business;

  CustomerPointModel(
      {this.id, this.available, this.lastUpdatedDate, this.business});

  CustomerPointModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    available = json['available'];
    lastUpdatedDate = json['lastUpdatedDate'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['available'] = this.available;
    data['lastUpdatedDate'] = this.lastUpdatedDate;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class Business {
  int? id;
  String? nameAr;
  String? nameEn;
  String? detailsAr;
  String? detailsEn;
  String? contactNumber;
  String? websiteUrl;
  LogoUploadedFile? logoUploadedFile;

  Business(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.detailsAr,
      this.detailsEn,
      this.contactNumber,
      this.websiteUrl,
      this.logoUploadedFile});

  Business.fromJson(Map<String, dynamic> json) {
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
