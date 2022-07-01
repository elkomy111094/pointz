class ServicesProvider {
  String? websiteUrl;
  LogoUploadedFile? logoUploadedFile;
  LogoUploadedFile? bannerUploadedFile;
  TopBusinessInCategory? topBusinessInCategory;
  bool? isTopInItsCategory;
  int? id;
  String? nameAr;
  String? nameEn;
  String? detailsAr;
  String? detailsEn;
  String? contactNumber;
  String? commercialRegistrationNumber;

  ServicesProvider(
      {this.websiteUrl,
      this.logoUploadedFile,
      this.bannerUploadedFile,
      this.topBusinessInCategory,
      this.isTopInItsCategory,
      this.id,
      this.nameAr,
      this.nameEn,
      this.detailsAr,
      this.detailsEn,
      this.contactNumber,
      this.commercialRegistrationNumber});

  ServicesProvider.fromJson(Map<String, dynamic> json) {
    websiteUrl = json['websiteUrl'];
    logoUploadedFile = json['logo_UploadedFile'] != null
        ? new LogoUploadedFile.fromJson(json['logo_UploadedFile'])
        : null;
    bannerUploadedFile = json['banner_UploadedFile'] != null
        ? new LogoUploadedFile.fromJson(json['banner_UploadedFile'])
        : null;
    topBusinessInCategory = json['topBusinessInCategory'] != null
        ? new TopBusinessInCategory.fromJson(json['topBusinessInCategory'])
        : null;
    isTopInItsCategory = json['isTopInItsCategory'];
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    detailsAr = json['detailsAr'];
    detailsEn = json['detailsEn'];
    contactNumber = json['contactNumber'];
    commercialRegistrationNumber = json['commercialRegistrationNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['websiteUrl'] = this.websiteUrl;
    if (this.logoUploadedFile != null) {
      data['logo_UploadedFile'] = this.logoUploadedFile!.toJson();
    }
    if (this.bannerUploadedFile != null) {
      data['banner_UploadedFile'] = this.bannerUploadedFile!.toJson();
    }
    if (this.topBusinessInCategory != null) {
      data['topBusinessInCategory'] = this.topBusinessInCategory!.toJson();
    }
    data['isTopInItsCategory'] = this.isTopInItsCategory;
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['detailsAr'] = this.detailsAr;
    data['detailsEn'] = this.detailsEn;
    data['contactNumber'] = this.contactNumber;
    data['commercialRegistrationNumber'] = this.commercialRegistrationNumber;
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

class TopBusinessInCategory {
  int? id;
  int? displayOrder;
  bool? isActive;
  bool? isPromoted;

  TopBusinessInCategory(
      {this.id, this.displayOrder, this.isActive, this.isPromoted});

  TopBusinessInCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayOrder = json['displayOrder'];
    isActive = json['isActive'];
    isPromoted = json['isPromoted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['displayOrder'] = this.displayOrder;
    data['isActive'] = this.isActive;
    data['isPromoted'] = this.isPromoted;
    return data;
  }
}
