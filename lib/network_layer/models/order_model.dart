import 'package:yallabaity/network_layer/models/order_model.dart';

class ProviderOrdersModel {
  String? _id;
  String? _clientName;
  List<OrderModel>? _ordersList;
  bool _confirm=false;
  int _nSelected=0;
  ProviderOrdersModel(
      {String? id, String? clientName, List<OrderModel>? ordersList}) {
    _id = id;
    _clientName = clientName;
    _ordersList = ordersList;
  }

  String? get clientName => _clientName;

  set clientName(String? value) {
    _clientName = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  List<OrderModel>? get ordersList => _ordersList;

  set ordersList(List<OrderModel>? value) {
    _ordersList = value;
  }

  bool get confirm => _confirm;

  set confirm(bool value) {
    _confirm = value;
  }

  int get nSelected => _nSelected;

  set nSelected(int value) {
    _nSelected = value;
  }
}

class OrderModel {
  String? _foodName;
  int? _quantity;

  String? _asset;
  String? _location;
  String? _sizes;
  String? _totalPrice;
  bool _selected=false;
  OrderModel(
      {String? foodName,
      int? quantity,
      String? asset,
      String? location,
      String? sizes,
        String?  totalPrice}) {
    _foodName = foodName;
    _asset = asset;
    _quantity = quantity;
    _sizes = sizes;
    _totalPrice = totalPrice;
    _location = location;
  }

  String?  get totalPrice => _totalPrice;

  set totalPrice(String?  value) {
    _totalPrice = value;
  }

  String? get sizes => _sizes;

  set sizes(String? value) {
    _sizes = value;
  }

  String? get location => _location;

  set location(String? value) {
    _location = value;
  }

  String? get asset => _asset;

  set asset(String? value) {
    _asset = value;
  }

  int? get quantity => _quantity;

  set quantity(int? value) {
    _quantity = value;
  }

  String? get foodName => _foodName;

  set foodName(String? value) {
    _foodName = value;
  }

  bool get selected => _selected;

  set selected(bool value) {
    _selected = value;
  }
}

/*
class SizeModel {
  String? _size;
  int? _quantity;
  SizeModel({
    String? size,
    int? quantity,
  }) {
    _size = size;
    _quantity = quantity;
  }

  int? get quantity => _quantity;

  set quantity(int? value) {
    _quantity = value;
  }

  String? get size => _size;

  set size(String? value) {
    _size = value;
  }

}
*/
