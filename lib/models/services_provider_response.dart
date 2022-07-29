class CategoriesTopsRespons {
  Type? type;
  List<ServicesProvider>? ServicesProviderList;

  CategoriesTopsRespons({this.type, this.ServicesProviderList});

  CategoriesTopsRespons.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    if (json['details'] != null) {
      ServicesProviderList = [];
      json['details'].forEach((v) {
        ServicesProviderList!.add(ServicesProvider.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.ServicesProviderList != null) {
      data['details'] =
          this.ServicesProviderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
class Type {
  int? id;
  String? code;
  String? nameAr;
  String? nameEn;

  Type({this.id, this.code, this.nameAr, this.nameEn});

  Type.fromJson(Map<String, dynamic> json) {
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

////////////////////////////////////////////////////////////////////////////////
class ServicesProvider {
  int? id;
  String? nameAr;
  String? nameEn;
  String? detailsAr;
  String? detailsEn;
  String? contactNumber;
  String? websiteUrl;
  Type? type;
  Type? status;
  LogoUploadedFile? logoUploadedFile;
  LogoUploadedFile? bannerUploadedFile;
  PointsSystem? pointsSystem;
  List<SocialMediaAccounts>? socialMediaAccounts;
  List<Tags>? tags;
  List<Addresses>? addresses;
  bool? isTopInItsCategory;
  bool? isFavoriteForCustomer;

  ServicesProvider(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.detailsAr,
      this.detailsEn,
      this.contactNumber,
      this.websiteUrl,
      this.type,
      this.status,
      this.logoUploadedFile,
      this.bannerUploadedFile,
      this.pointsSystem,
      this.socialMediaAccounts,
      this.tags,
      this.addresses,
      this.isTopInItsCategory,
      this.isFavoriteForCustomer});

  ServicesProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    detailsAr = json['detailsAr'];
    detailsEn = json['detailsEn'];
    contactNumber = json['contactNumber'];
    websiteUrl = json['websiteUrl'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    status = json['status'] != null ? new Type.fromJson(json['status']) : null;
    logoUploadedFile = json['logo_UploadedFile'] != null
        ? new LogoUploadedFile.fromJson(json['logo_UploadedFile'])
        : null;
    bannerUploadedFile = json['banner_UploadedFile'] != null
        ? new LogoUploadedFile.fromJson(json['logo_UploadedFile'])
        : null;
    pointsSystem = json['pointsSystem'] != null
        ? new PointsSystem.fromJson(json['pointsSystem'])
        : null;
    if (json['socialMediaAccounts'] != null) {
      socialMediaAccounts = <SocialMediaAccounts>[];
      json['socialMediaAccounts'].forEach((v) {
        socialMediaAccounts!.add(new SocialMediaAccounts.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    isTopInItsCategory = json['isTopInItsCategory'];
    isFavoriteForCustomer = json['isFavoriteForCustomer'];
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
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.logoUploadedFile != null) {
      data['logo_UploadedFile'] = this.logoUploadedFile!.toJson();
    }
    data['banner_UploadedFile'] = this.bannerUploadedFile;
    if (this.pointsSystem != null) {
      data['pointsSystem'] = this.pointsSystem!.toJson();
    }
    if (this.socialMediaAccounts != null) {
      data['socialMediaAccounts'] =
          this.socialMediaAccounts!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['isTopInItsCategory'] = this.isTopInItsCategory;
    data['isFavoriteForCustomer'] = this.isFavoriteForCustomer;
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
class LogoUploadedFile {
  Null? notes;
  int? id;
  String? name;
  int? size;
  String? fileType;
  String? base64Format;

  LogoUploadedFile(
      {this.notes,
      this.id,
      this.name,
      this.size,
      this.fileType,
      this.base64Format});

  LogoUploadedFile.fromJson(Map<String, dynamic> json) {
    notes = json['notes'];
    id = json['id'];
    name = json['name'];
    size = json['size'];
    fileType = json['fileType'];
    base64Format = json['base64_Format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes'] = this.notes;
    data['id'] = this.id;
    data['name'] = this.name;
    data['size'] = this.size;
    data['fileType'] = this.fileType;
    data['base64_Format'] = this.base64Format;
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
class PointsSystem {
  int? id;
  int? percentage;

  PointsSystem({this.id, this.percentage});

  PointsSystem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['percentage'] = this.percentage;
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
class Tags {
  Type? type;
  int? id;

  Tags({this.type, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class SocialMediaAccounts {
  Type? type;
  int? id;
  String? accountName;

  SocialMediaAccounts({this.type, this.id, this.accountName});

  SocialMediaAccounts.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    id = json['id'];
    accountName = json['accountName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['id'] = this.id;
    data['accountName'] = this.accountName;
    return data;
  }
}

class Addresses {
  Type? country;
  Type? city;
  int? id;
  String? nameAr;
  String? nameEn;
  double? longtitude;
  double? latitude;
  String? lastUpdatedDate;

  Addresses(
      {this.country,
      this.city,
      this.id,
      this.nameAr,
      this.nameEn,
      this.longtitude,
      this.latitude,
      this.lastUpdatedDate});

  Addresses.fromJson(Map<String, dynamic> json) {
    country =
        json['country'] != null ? new Type.fromJson(json['country']) : null;
    city = json['city'] != null ? new Type.fromJson(json['city']) : null;
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    longtitude = json['longtitude'];
    latitude = json['latitude'];
    lastUpdatedDate = json['lastUpdatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['longtitude'] = this.longtitude;
    data['latitude'] = this.latitude;
    data['lastUpdatedDate'] = this.lastUpdatedDate;
    return data;
  }
}
