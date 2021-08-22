import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:knn_telur/helper/chooch_helper.dart';
import 'package:knn_telur/helper/list_hitung.dart';
import 'package:knn_telur/helper/list_training.dart';
import 'package:knn_telur/helper/pref.dart';
import 'package:knn_telur/helper/state_store.dart';
import 'package:palette_generator/palette_generator.dart';

//get data rgbhsl dari gambar
//sampai hasil hitung knn
Future<List> getImagePalette(File file) async {
  final isTelur = await choochEgg(file);
  //mengambil data warna dari gambar
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(FileImage(file));
  final dominantColor = (paletteGenerator.lightVibrantColor != null)
      ? paletteGenerator.lightVibrantColor!.color
      : (paletteGenerator.darkVibrantColor != null)
          ? paletteGenerator.darkVibrantColor!.color
          : paletteGenerator.dominantColor!.color;
  final hsl = HSLColor.fromColor(dominantColor);

  //clear list selisis
  selisihList.clear();
  //Data Training
  final rT = (state == 1) ? r : dominantColor.red;
  final gT = (state == 1) ? g : dominantColor.green;
  final bT = (state == 1) ? b : dominantColor.blue;
  final hT = (state == 1) ? h : hsl.hue;
  final sT = (state == 1) ? s : hsl.saturation;
  final lT = (state == 1) ? l : hsl.lightness;
  for (int i = 0; i < dataTraining.length; i++) {
    final hsli = HSLColor.fromColor(Color.fromRGBO(
        dataTraining[i]['r'], dataTraining[i]['g'], dataTraining[i]['b'], 1));
    //declarasi data training
    final ri = dataTraining[i]['r'];
    final gi = dataTraining[i]['g'];
    final bi = dataTraining[i]['b'];
    final hi = hsli.hue;
    final si = hsli.saturation;
    final vi = hsli.lightness;

    final selisihH = (hT / 360 - hi / 360).abs();
    final selisihS = (sT - si).abs();
    final selisihV = (lT - vi).abs();

    //eulidean distance
    final selisih =
        sqrt((selisihH * selisihH + selisihS * selisihS + selisihV * selisihV));
    selisihList.add({
      'r': ri,
      'g': gi,
      'b': bi,
      'h': hsli.hue,
      's': hsli.saturation,
      'l': hsli.lightness,
      'state': dataTraining[i]['k'],
      'jarak': selisih,
    });
  }

  //sort data jarak list
  selisihList.sort((a, b) {
    var aJarak = a['jarak'];
    var bJarak = b['jarak'];
    return aJarak.compareTo(bJarak);
  });
  //SUM List State
  sum = 0;
  // Non Fix K
  final List selisihListK = [];
  for (var i = 0; i < k; i++) {
    sum = sum + selisihList[i]['state'] as int;
    selisihListK.add({
      'state': selisihList[i]['state'],
    });
  }

  num baik = selisihListK.where((f) => f['state'] == 1).toList().length;
  num kurangBaik = selisihListK.where((f) => f['state'] == 0).toList().length;
  num buruk = selisihListK.where((f) => f['state'] == -1).toList().length;

  print(baik.toString() + ' ' + kurangBaik.toString() + ' ' + buruk.toString());
  final rankState = [
    {
      'name': 1,
      'state': baik,
    },
    {
      'name': 0,
      'state': kurangBaik,
    },
    {'name': -1, 'state': buruk}
  ];

  rankState.sort((a, b) => a['state']!.compareTo(b['state']!));
  sum = rankState.last['name']!.toInt();
  print(rankState.last['name']);

  //menyimpan nilai warna ke preferences
  setPrefRGBHSL(dominantColor.red.toDouble(), dominantColor.green.toDouble(),
      dominantColor.blue.toDouble(), hsl.hue, hsl.saturation, hsl.lightness);
  //set pref state ke nilai 1
  setPrefState();
  //kembalian nilai
  return [
    rT,
    gT,
    bT,
    hsl.hue,
    hsl.saturation,
    hsl.lightness,
    isTelur["predictions"].length
  ];
}
