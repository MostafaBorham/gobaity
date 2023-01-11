class WalletModel {
  String? _date;
  List<Balance>? _account;
  WalletModel(String? date, List<Balance>? account) {
    _date = date;
    _account = account;
  }
  String? get date => _date;

  set date(String? value) {
    _date = value;
  }

  List<Balance>? get account => _account;

  set account(List<Balance>? value) {
    _account = value;
  }
}

class Balance {
  String? _net;
  String? _tax;
  Balance({String? net, String? tax}) {
    _net = net;
    _tax = tax;
  }
  String? get net => _net;

  set net(String? value) {
    _net = value;
  }

  String? get tax => _tax;

  set tax(String? value) {
    _tax = value;
  }
}
