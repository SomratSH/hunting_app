class HuntsModel {
  String? id;
  String? title;
  String? description;
  String? prizeAmount;
  String? difficultyLevel;
  String? duration;
  String? city;
  String? status;
  String? startDate;
  String? endDate;
  String? createdBy;
  bool? isPremiumOnly;
  String? createdAt;
  String? updatedAt;

  HuntsModel(
      {this.id,
      this.title,
      this.description,
      this.prizeAmount,
      this.difficultyLevel,
      this.duration,
      this.city,
      this.status,
      this.startDate,
      this.endDate,
      this.createdBy,
      this.isPremiumOnly,
      this.createdAt,
      this.updatedAt});

  HuntsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    prizeAmount = json['prize_amount'];
    difficultyLevel = json['difficulty_level'];
    duration = json['duration'];
    city = json['city'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdBy = json['created_by'];
    isPremiumOnly = json['is_premium_only'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['prize_amount'] = this.prizeAmount;
    data['difficulty_level'] = this.difficultyLevel;
    data['duration'] = this.duration;
    data['city'] = this.city;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_by'] = this.createdBy;
    data['is_premium_only'] = this.isPremiumOnly;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
