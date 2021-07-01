import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knn_telur/pages/about.dart';
import 'package:knn_telur/pages/splash_screen.dart';
import 'package:knn_telur/pages/training.dart';
import 'package:knn_telur/pages/training2.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.skia
      .invokeMethod<void>('setResourceCacheMaxBytes', 512 * (1 << 20));
  SystemChannels.skia
      .invokeMethod<void>('Skia.setResourceCacheMaxBytes', 512 * (1 << 20));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.getKeys();
  for (String key in preferences.getKeys()) {
    if (key != "k") {
      preferences.remove(key);
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Klasifikasi Telur Ayam Ras',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/about': (context) => AboutPage(),
        '/trainingbaik': (context) => TrainingPage(),
        '/trainingkurang': (context) => Training2Page(),
      },
      // home: SplashScreen(),
    );
  }
}
