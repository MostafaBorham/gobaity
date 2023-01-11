import 'package:shared_preferences/shared_preferences.dart';

abstract class CartLocalDataSource {

}
class CartImplWithPrefs extends CartLocalDataSource{
  final SharedPreferences preferences;
  CartImplWithPrefs({required this.preferences});
}