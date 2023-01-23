import 'package:yallabaity/domain/entities/requests_entites/user_entity.dart';
import 'package:http/http.dart' as http;
class UserModel extends UserEntity {
  UserModel({
    int? userId,
    String? userName,
    String? password,
    String? phone,
    String? image,
    bool? isProvider,
    String? address,
    int? governorateId,
    double? latitude,
    double? longitude,
    String? nationalIdcardFace,
    String? nationalIdcardBack,
    bool? isApproved,
    bool? isActive,
    bool? isDelete,
    String? governorate,
/*  List<>? foodOrders;
  List<Null>? userRatings;
  List<Null>? usersLikes;
  List<Null>? usersViews;*/
  }) : super(
            userId: userId,
            userName: userName,
            password: password,
            phone: phone,
            isProvider: isProvider,
            governorateId: governorateId,
            latitude: latitude,
            longitude: longitude,
            nationalIdcardFace: nationalIdcardFace,
            nationalIdcardBack: nationalIdcardBack,
            isApproved: isApproved,
            isActive: isActive,
            governorate: governorate,
            image: image,
            address: address,
            isDelete: isDelete);

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    password = json['password'];
    phone = json['phone'];
    image = json['image'];
    isProvider = json['isProvider'];
    address = json['address'];
    governorateId = json['governorateId'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nationalIdcardFace = json['nationalIdcardFace'];
    nationalIdcardBack = json['nationalIdcardBack'];
    isApproved = json['isApproved'];
    isActive = json['isActive'];
    isDelete = json['isDelete'];
    governorate = json['governorate'];
/*    if (json['foodOrders'] != null) {
      foodOrders = <Null>[];
      json['foodOrders'].forEach((v) {
        foodOrders!.add(new Null.fromJson(v));
      });
    }
    if (json['userRatings'] != null) {
      userRatings = <Null>[];
      json['userRatings'].forEach((v) {
        userRatings!.add(new Null.fromJson(v));
      });
    }
    if (json['usersLikes'] != null) {
      usersLikes = <Null>[];
      json['usersLikes'].forEach((v) {
        usersLikes!.add(new Null.fromJson(v));
      });
    }
    if (json['usersViews'] != null) {
      usersViews = <Null>[];
      json['usersViews'].forEach((v) {
        usersViews!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['password'] = password;
    data['phone'] = phone;
    data['image'] = image;
    data['isProvider'] = isProvider;
    data['address'] = address;
    data['governorateId'] = governorateId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['nationalIdcardFace'] = nationalIdcardFace;
    data['nationalIdcardBack'] = nationalIdcardBack;
    data['isApproved'] = isApproved;
    data['isActive'] = isActive;
    data['isDelete'] = isDelete;
    data['governorate'] = governorate;
    /*  if (this.foodOrders != null) {
      data['foodOrders'] = this.foodOrders!.map((v) => v.toJson()).toList();
    }
    if (this.userRatings != null) {
      data['userRatings'] = this.userRatings!.map((v) => v.toJson()).toList();
    }
    if (this.usersLikes != null) {
      data['usersLikes'] = this.usersLikes!.map((v) => v.toJson()).toList();
    }
    if (this.usersViews != null) {
      data['usersViews'] = this.usersViews!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
  toMultiPart(http.MultipartRequest request)  {
    request.fields['UserId'] = userId!.toString();
    request.fields['userName'] = userName!;
    request.fields['password'] = password!;
    request.fields['phone'] = phone!;
  }
  toEntity()=>this;
}

