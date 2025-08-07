class HuntModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  HuntModel({this.count, this.next, this.previous, this.results});

  HuntModel.fromJson(Map<String, dynamic> json) {
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
      this.isPremiumOnly});

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
    return data;
  }
}
