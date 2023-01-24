
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yallabaity/gobaity_app.dart';
import 'package:yallabaity/notification_api.dart';
import 'injection_container.dart' as di; // for dependancy inversion
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await NotificationApi.init();
  await NotificationApi.notificationsDetails(body: 'welcome in gobaity ❤️❤️', title: 'welcome');

  runApp( const GoBaityApp());
}
