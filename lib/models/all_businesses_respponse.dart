class AllBusinessesResponse {
  Result? result;
  bool? success;

  AllBusinessesResponse({this.result, this.success});

  AllBusinessesResponse.fromJson(Map<String, dynamic> json) {
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
  List<DropDownBusiness>? data;
  Null? paginatedData;

  Result({this.data, this.paginatedData});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DropDownBusiness>[];
      json['data'].forEach((v) {
        data!.add(new DropDownBusiness.fromJson(v));
      });
    }
    paginatedData = json['paginatedData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['paginatedData'] = this.paginatedData;
    return data;
  }
}

class DropDownBusiness {
  int? id;
  String? nameAr;
  String? nameEn;

  DropDownBusiness({this.id, this.nameAr, this.nameEn});

  DropDownBusiness.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['nameAr'];
    nameEn = json['nameEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameAr'] = this.nameAr;
    data['nameEn'] = this.nameEn;
    return data;
  }
}
