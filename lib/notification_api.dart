import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  // static final _noNotifications=BehaviorSubject<String>();

  static Future notificationsDetails(
  {required String body,required String title}
      ) async {
     var  not=const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        playSound: true,
        priority: Priority.high,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );


    await _notifications.show(0, title, body,not);
  }

  static Future init({bool initSchedule = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
    );
    final settings = InitializationSettings(android: android, iOS: ios);

    await _notifications.initialize(
      settings,

        // onDidReceiveNotificationResponse:(payload )async{
        //   _noNotifications.add('');
        // }
    );
  }


  // onSelectNotification(payload)async{
  //   _noNotifications.add(payload);
  // }
}
