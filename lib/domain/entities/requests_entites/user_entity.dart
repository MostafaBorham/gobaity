

import '../../../network_layer/models/data_models/user_model.dart';

class UserEntity {
  int? userId;
  String? userName;
  String? password;
  String? phone;
  String? image;
  bool? isProvider;
  String? address;
  int? governorateId;
  double? latitude;
  double? longitude;
  String? nationalIdcardFace;
  String? nationalIdcardBack;
  bool? isApproved;
  bool? isActive;
  bool? isDelete;
  String? governorate;
/*  List<>? foodOrders;
  List<Null>? userRatings;
  List<Null>? usersLikes;
  List<Null>? usersViews;*/

  UserEntity({
    this.userId,
    this.userName,
    this.password,
    this.phone,
    this.image,
    this.isProvider,
    this.address,
    this.governorateId,
    this.latitude,
    this.longitude,
    this.nationalIdcardFace,
    this.nationalIdcardBack,
    this.isApproved,
    this.isActive,
    this.isDelete,
    this.governorate,
    /*   this.foodOrders,
        this.userRatings,
        this.usersLikes,
        this.usersViews*/
  });

   toModel()=>this as UserModel;


}
