class ProductSizeModel {
  String? _description;
  String? _size;
  double? _price;
  List<String>? tags;

  ProductSizeModel({
    String? description,
    String? size ,
    double? price,
  }) {
    _description=description;
    _size=size;
    _price=price;

  }

  double? get price => _price;

  set price(double? value) {
    _price = value;
  }

  String? get size => _size;

  set size(String? value) {
    _size = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }
}
