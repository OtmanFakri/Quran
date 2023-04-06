class surahs {
  int? code;
  String? status;
  Data? datas;

  surahs({this.code, this.status, this.datas});

  surahs.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    datas = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.datas != null) {
      data['data'] = this.datas!.toJson();
    }
    return data;
  }
}

class Data {
  Surahs? surahs;

  Data({this.surahs});

  Data.fromJson(Map<String, dynamic> json) {
    surahs =
    json['surahs'] != null ? new Surahs.fromJson(json['surahs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.toJson();
    }
    return data;
  }
}

class Surahs {
  int? count;
  List<References>? references;

  Surahs({this.count, this.references});

  Surahs.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['references'] != null) {
      references = <References>[];
      json['references'].forEach((v) {
        references!.add(new References.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.references != null) {
      data['references'] = this.references!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class References {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;

  References(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.numberOfAyahs,
        this.revelationType});

  References.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['englishName'] = this.englishName;
    data['englishNameTranslation'] = this.englishNameTranslation;
    data['numberOfAyahs'] = this.numberOfAyahs;
    data['revelationType'] = this.revelationType;
    return data;
  }
}
