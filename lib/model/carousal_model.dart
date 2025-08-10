class CarousalModel {
  final int offerId;
  final int shopId;
  final String name;
  final String description;
  final String offerType;
  final String rate;
  final String image;

  CarousalModel({
    required this.offerId,
    required this.shopId,
    required this.name,
    required this.description,
    required this.offerType,
    required this.rate,
   required this.image,
  });

  factory CarousalModel.fromJason(Map<String, dynamic> json) {
    return CarousalModel(
        offerId: json["offer_id"]??0,
        shopId: json["shop_id"]??0,
        name: json["name"]??"",
        description: json["description"]??"",
        offerType: json["offer_type"]??"",
        rate: json["rate"]??"",
        image:  json["image"]??"");
  }
}
