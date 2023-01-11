import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yallabaity/application/app_prefs.dart';
import 'package:yallabaity/application/extensions.dart';
import 'package:yallabaity/application/app_failures/exception.dart';
import 'package:yallabaity/network_layer/models/data_models/user_model.dart';

abstract class UserLocalDataSource {
  UserModel getCachedUser();
  Future<Unit> cacheUser(UserModel user);
}

class UserImplWithPrefs implements UserLocalDataSource {
  final SharedPreferences preferences;
  UserImplWithPrefs({required this.preferences});

  @override
  UserModel getCachedUser()  {
    String? cachedUser = preferences.getString(AppPrefs.prefsUsersKey);
    if (cachedUser != null) {
      final UserModel user = UserModel.fromJson(cachedUser.fromStringToJson);
      return user;
    } else {
      throw EmptyCashException();
    }
  }

  @override
  Future<Unit> cacheUser(UserModel user) async {
    String userString = (user.toJson()).fromJsonToString;
    await preferences.setString(AppPrefs.prefsUsersKey, userString);
    return unit;
  }
}
