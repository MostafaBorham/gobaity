
import '../../domain/entities/requests_entites/food_entity.dart';

class FoodStatus {
  String? _date;
  List<FoodEntity>? _list;
  FoodStatus({String? date, List<FoodEntity>? list}) {
    _date = date;
    _list = list;
  }

  List<FoodEntity>? get list => _list;

  set list(List<FoodEntity>? value) {
    _list = value;
  }

  String? get date => _date;

  set date(String? value) {
    _date = value;
  }
}
