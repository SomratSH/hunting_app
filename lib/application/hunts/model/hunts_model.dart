class HuntsModel {
  int? count;
  Null? next;
  Null? previous;
  List<Results>? results;

  HuntsModel({this.count, this.next, this.previous, this.results});

  HuntsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? title;
  String? description;
  String? rules;
  String? prizeAmount;
  String? difficultyLevel;
  String? duration;
  int? hunters;
  String? city;
  String? image;
  String? label;
  String? status;
  dynamic? ratings;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  bool? isPremiumOnly;
  List<Clues>? clues;

  Results(
      {this.id,
      this.title,
      this.description,
      this.rules,
      this.prizeAmount,
      this.difficultyLevel,
      this.duration,
      this.hunters,
      this.city,
      this.image,
      this.label,
      this.status,
      this.ratings,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.isPremiumOnly,
      this.clues});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    rules = json['rules'];
    prizeAmount = json['prize_amount'];
    difficultyLevel = json['difficulty_level'];
    duration = json['duration'];
    hunters = json['hunters'];
    city = json['city'];
    image = json['image'];
    label = json['label'];
    status = json['status'];
    ratings = json['ratings'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isPremiumOnly = json['is_premium_only'];
    if (json['clues'] != null) {
      clues = <Clues>[];
      json['clues'].forEach((v) {
        clues!.add(new Clues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['rules'] = this.rules;
    data['prize_amount'] = this.prizeAmount;
    data['difficulty_level'] = this.difficultyLevel;
    data['duration'] = this.duration;
    data['hunters'] = this.hunters;
    data['city'] = this.city;
    data['image'] = this.image;
    data['label'] = this.label;
    data['status'] = this.status;
    data['ratings'] = this.ratings;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_premium_only'] = this.isPremiumOnly;
    if (this.clues != null) {
      data['clues'] = this.clues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clues {
  String? id;
  String? hunt;
  String? name;
  String? riddle;
  String? hint;
  int? order;
  QrCode? qrCode;
  bool? isFinalClue;
  bool ? isLocked;
  String? createdAt;
  String? updatedAt;
  String ? status;

  Clues(
      {this.id,
      this.hunt,
      this.name,
      this.riddle,
      this.hint,
      this.status,
      this.order,
      this.qrCode,
      this.isLocked,
      this.isFinalClue,
      this.createdAt,
      this.updatedAt});

  Clues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hunt = json['hunt'];
    name = json['name'];
    riddle = json['riddle'];
    hint = json['hint'];
    order = json['order'];
    status = json['status'];
    qrCode =
        json['qr_code'] != null ? new QrCode.fromJson(json['qr_code']) : null;
    isFinalClue = json['is_final_clue'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isLocked = json["is_final_clue"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hunt'] = this.hunt;
    data['name'] = this.name;
    data['riddle'] = this.riddle;
    data['hint'] = this.hint;
    data['order'] = this.order;
    if (this.qrCode != null) {
      data['qr_code'] = this.qrCode!.toJson();
    }
    data['is_final_clue'] = this.isFinalClue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class QrCode {
  String? id;
  String? code;
  double? latitude;
  double? longitude;
  String? qrImage;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  QrCode(
      {this.id,
      this.code,
      this.latitude,
      this.longitude,
      this.qrImage,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  QrCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    qrImage = json['qr_image'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['qr_image'] = this.qrImage;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
