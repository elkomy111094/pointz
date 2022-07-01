class Category {
  int? id;
  String? code;
  String? nameAr;
  String? nameEn;

  Category({this.id, this.code, this.nameAr, this.nameEn});

  Category.fromJson(Map<String, dynamic> json) {
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
