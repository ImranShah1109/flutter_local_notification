import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService{
  // instance of FLNPlugin
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();


  // initialize the FLN for  android and ios
  Future<void> initNotification() async{
    //instance of initialise the settings for android
    AndroidInitializationSettings initializationSettingsAndroid = 
        const AndroidInitializationSettings('ic_launcher');

    // instance for initialization settings for ios
    var initializationSettingsIOS = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      // onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {},
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS
    );

    await notificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: 
        (NotificationResponse notificationResponse) async{}
    );
  }

  // notification detail about android and ios
  notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max
      ),
      iOS: DarwinNotificationDetails()
    );
  }
  // for showing notification
  Future showNotification({int id = 0, String? title, String? body, String? payload}) async {

    return notificationsPlugin.show(id, title, body, notificationDetails());
  }
}