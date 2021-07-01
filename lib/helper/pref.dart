import 'package:shared_preferences/shared_preferences.dart';

setPref(image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('image', image);
}

setPrefState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('state', 1);
}

resetPrefState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('state', 0);
}

setPrefRGBHSL(r, g, b, h, s, l) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('r', r);
  await prefs.setDouble('g', g);
  await prefs.setDouble('b', b);
  await prefs.setDouble('h', h);
  await prefs.setDouble('s', s);
  await prefs.setDouble('l', l);
}

resetPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('image', '');
  await prefs.setDouble('r', 0);
  await prefs.setDouble('g', 0);
  await prefs.setDouble('b', 0);
  await prefs.setDouble('h', 0);
  await prefs.setDouble('s', 0);
  await prefs.setDouble('l', 0);
}

resetPrefxImage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('h', 0);
  await prefs.setDouble('s', 0);
  await prefs.setDouble('v', 0);
}

setPrefK(k) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('k', k);
}
