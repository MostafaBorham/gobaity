
import '../../../domain/entities/requests_entites/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    int? serial,
    int? foodId,
    String? foodName,
    double? price,
    String? description,
    int? preparationTime,
    int? userId,
    bool? isApproved,
    bool? isDelete,
    bool? isActive,
    String? creationDate,
    String? cookName,
    double? latitude,
    double? longitude,
    String? imagePath,
    double? rate,
    int? rateCount,
    int? mostPopular,
    int? mostWatched,
    bool? isFavorited,
    String? date,
  }) : super(
    serial: serial,
    foodId: foodId,
    foodName: foodName,
    price: price,
    description: description,
    preparationTime: preparationTime,
    userId: userId,
    isApproved: isApproved,
    creationDate: creationDate,
    cookName: cookName,
    latitude: latitude,
    longitude: longitude,
    imagePath: imagePath,
    rate: rate,
    rateCount: rateCount,
    isFavorited: isFavorited,
    date: date,
  );
  FoodModel.fromJson(Map<String, dynamic> json) {
    serial = json['serial'];
    foodId = json['foodId'];
    foodName = json['foodName'];
    price = json['price'];
    description = json['description'];
    preparationTime = json['preparationTime'];
    userId = json['userId'];
    isApproved = json['isApproved'];
    creationDate = json['creationDate'];
    cookName = json['cookName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    imagePath = json['imagePath'];
    rate = json['rate'];
    rateCount = json['rateCount'];
    isFavorited = json['isFavorited'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['serial'] = serial;
    data['foodId'] = foodId;
    data['foodName'] = foodName;
    data['price'] = price;
    data['description'] = description;
    data['preparationTime'] = preparationTime;
    data['userId'] = userId;
    data['isApproved'] = isApproved;

    data['creationDate'] = creationDate;
    data['cookName'] = cookName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['imagePath'] = imagePath;
    data['rate'] = rate;
    data['rateCount'] = rateCount;

    data['isFavorited'] = isFavorited;
    data['date'] = date;
    return data;
  }
  static List<FoodModel> all = [
    FoodModel(
      foodName: 'Molokheya & Chicken',
      cookName: 'Chief Mohamed G.',
      rateCount: 23,
      rate: 4.9,
      price: 50.00,
      isFavorited: true,
      preparationTime: 2,

    ),

  ];

}
