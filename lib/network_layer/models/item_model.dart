class ItemModel{
  int? _id;
  String? _title;
  String? _icon;
  bool? _active;

  ItemModel({int? id,required String title,String? icon,bool active=false}){
    _title=title;
    _icon=icon;
    _active=active;
    _id=id;
  }
  String get title => _title!;

  set title(String? value) {
    _title = value;
  }

  String? get icon => _icon;

  set icon(String? value) {
    _icon = value;
  }

  bool get active => _active!;

  set active(bool value) {
    _active = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }
}