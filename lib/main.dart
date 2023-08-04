import 'package:flutter/material.dart';
import 'package:flutter_local_noti/services/notifi_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // for remove the debug label from top right corner
      debugShowCheckedModeBanner: false,
      title: 'Flutter Local Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Local Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            NotificationService().showNotification(
                title: 'Sample title',
                body: "It's works!"
              );
          },
          child:const Text('Show Notifications'),
        )
      )
    );
  }
}
