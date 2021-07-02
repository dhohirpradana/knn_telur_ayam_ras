import 'package:shared_preferences/shared_preferences.dart';

//Simpan
//base64 image string
setPref(image) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('image', image);
}

//cek di preferences sudah ada string base64 atau tidak
setPrefState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('state', 1);
}

//reset state
resetPrefState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('state', 0);
}

//data rgbhsl
setPrefRGBHSL(r, g, b, h, s, l) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('r', r);
  await prefs.setDouble('g', g);
  await prefs.setDouble('b', b);
  await prefs.setDouble('h', h);
  await prefs.setDouble('s', s);
  await prefs.setDouble('l', l);
}

//reset rgbhsl, base64
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

//preferences nilai K
setPrefK(k) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('k', k);
}
