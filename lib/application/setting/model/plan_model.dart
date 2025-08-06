class PlanModel {
  int? id;
  String? name;
  String? description;
  int? price;
  String? currency;
  String? interval;
  int? discountPercent;
  String? stripePriceId;
  String? createdAt;

  PlanModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.currency,
      this.interval,
      this.discountPercent,
      this.stripePriceId,
      this.createdAt});

  PlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    interval = json['interval'];
    discountPercent = json['discount_percent'];
    stripePriceId = json['stripe_price_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['interval'] = this.interval;
    data['discount_percent'] = this.discountPercent;
    data['stripe_price_id'] = this.stripePriceId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
