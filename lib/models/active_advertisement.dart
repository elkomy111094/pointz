class Advertisment {
  Status? status;
  UploadedFile? uploadedFile;
  int? id;
  String? nameAr;
  String? nameEn;
  String? activeFrom;
  String? activeTo;
  String? activeFromString;
  String? activeToString;

  Advertisment(
      {this.status,
      this.uploadedFile,
      this.id,
      this.nameAr,
      this.nameEn,
      this.activeFrom,
      this.activeTo,
      this.activeFromString,
      this.activeToString});

  Advertisment.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    uploadedFile = json['uploadedFile'] != null
        ? new UploadedFile.fromJson(json['uploadedFile'])
        : null;
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
    activeFrom = json['activeFrom'];
    activeTo = json['activeTo'];
    activeFromString = json['activeFromString'];
    activeToString = json['activeToString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.uploadedFile != null) {
      data['uploadedFile'] = this.uploadedFile!.toJson();
    }
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    data['activeFrom'] = this.activeFrom;
    data['activeTo'] = this.activeTo;
    data['activeFromString'] = this.activeFromString;
    data['activeToString'] = this.activeToString;
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

class UploadedFile {
  int? id;
  String? name;
  int? size;
  String? fileType;
  String? base64Format;

  UploadedFile(
      {this.id, this.name, this.size, this.fileType, this.base64Format});

  UploadedFile.fromJson(Map<String, dynamic> json) {
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
