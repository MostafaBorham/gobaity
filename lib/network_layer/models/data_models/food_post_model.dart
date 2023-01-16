import 'package:yallabaity/application/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';
import 'package:yallabaity/domain/entities/requests_entites/food_post_entity.dart';
import 'package:yallabaity/domain/entities/requests_entites/size_entity.dart';
import 'package:yallabaity/network_layer/models/data_models/size_model.dart';
class FoodPostModel extends FoodPostEntity {
  FoodPostModel({
    String? foodName,
      double? price,
       String? description,
       int? userId,
       String? latitude,
       String? longitude,
      List<String>? images,
       List<SizeModel>? sizes,
       List<int>? categories,
  }) : super(
          userId: userId,
          price: price,
          images: images,
          categories: categories,
          sizes: sizes,
          foodName: foodName,
          description: description,
          latitude: latitude,
          longitude: longitude,
        );

  factory FoodPostModel.fromJson(Map<String, dynamic> json) => FoodPostModel(
        foodName: json['foodName'],
        userId: json['userId'],
        sizes: (json['sizes'] as List<dynamic>)
            .map((e) => SizeModel.fromJson(e))
            .toList(),
        categories: (json['categories'] as List<dynamic>)
            .map((e) => int.parse(e.toString()))
            .toList(),
        images:
            (json['images'] as List<dynamic>).map((e) => e.toString()).toList(),
        price: json['price'],
        description: json['description'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['foodName'] = foodName;
    data['price'] = price;
    data['description'] = description;
    // data['latitude'] = latitude;
    // data['longitude'] = longitude;
    data['sizes'] = sizes!.map((SizeEntity e) => (e as SizeModel).toJson()).toList();
    data['categories'] = categories!;

    return data;
  }

  Future toMultiPart(http.MultipartRequest request) async {
    request.fields['UserId'] = userId!.toString();
    request.fields['FoodName'] = foodName!;
    request.fields['Price'] = price!.toString();
    request.fields['Description'] = description!;

    List<Map<String,String>> sizesList= [];

    for (SizeModel size in sizes as List<SizeModel>) {
      sizesList.add(size.toMultiPart());
    }
    print(sizesList.fromJsonToString);
    request.files.add(
        http.MultipartFile.fromString('Sizes', sizesList.fromJsonToString));
    request.files.add(
          http.MultipartFile.fromString('categories', categories.toString()));

    for (int index = 0; index < images!.length; index++) {
      request.files.add(await http.MultipartFile.fromPath(
          'images', images![index],
          filename: index.toString(), contentType: MediaType('image', 'jpg'),),);
    }
  }
/*  Future<Map<String,String>> toJson(Dio dio) async {
    Map<String,String> data={};
    data['UserId'] = userId!.toString();
    data['FoodName'] = foodName!;
    data['Price'] = price!.toString();
    data['Description'] = description!;

    for (SizeModel size in sizes as List<SizeModel>) {
      dio.MultipartFile(
          http.MultipartFile.fromString('Sizes', size.toJson().toJsonEncode));
    }

    for (int category in categories!) {
      request.files.add(
          http.MultipartFile.fromString('categories', category.toString()));
    }
    for (int index = 0; index < images!.length; index++) {
      request.files.add(await http.MultipartFile.fromPath(
          'images', images![index],
          filename: index.toString(), contentType: MediaType('image', 'jpg')));
    }
    return data;
  }*/
}

