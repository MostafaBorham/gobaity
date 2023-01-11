
import '../../../domain/entities/requests_entites/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    int? userRatingId,
    int? foodId,
    int? userId,
    double? rating,
    String? description,
    String? userName,
    String? ratingDate,
  }) : super(
            foodId: foodId,
            description: description,
            userName: userName,
            userId: userId,
            rating: rating,
            ratingDate: ratingDate,
            userRatingId: userRatingId);

  ReviewModel.fromJson(Map<String, dynamic> json) {
    userRatingId = json['userRatingId'];
    foodId = json['foodId'];
    userId = json['userId'];
    rating =   double.parse(json['rating'].toString());
    description = json['description'];
    userName = json['userName'];
    ratingDate = json['ratingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userRatingId'] = userRatingId;
    data['foodId'] = foodId;
    data['userId'] = userId;
    data['rating'] = rating;
    data['description'] = description;
    data['userName'] = userName;
    data['ratingDate'] = ratingDate;
    return data;
  }
}
