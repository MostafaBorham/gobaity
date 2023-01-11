
class ReviewEntity {
  int? userRatingId;
  int? foodId;
  int? userId;
  double? rating;
  String? description;
  String? userName;
  String? ratingDate;

  ReviewEntity(
      {this.userRatingId,
        this.foodId,
        this.userId,
        this.rating,
        this.description,
        this.userName,
        this.ratingDate});

/*  Reviews.fromJson(Map<String, dynamic> json) {
    userRatingId = json['userRatingId'];
    foodId = json['foodId'];
    userId = json['userId'];
    rating = json['rating'];
    description = json['description'];
    userName = json['userName'];
    ratingDate = json['ratingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userRatingId'] = this.userRatingId;
    data['foodId'] = this.foodId;
    data['userId'] = this.userId;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['userName'] = this.userName;
    data['ratingDate'] = this.ratingDate;
    return data;
  }*/
}
