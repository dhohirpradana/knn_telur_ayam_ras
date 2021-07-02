import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knn_telur/bloc/show_widget_bloc.dart';
import 'package:knn_telur/helper/palette_gen.dart';
import 'package:knn_telur/helper/pref.dart';
import 'package:knn_telur/helper/state_store.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/molecul/button.dart';
import 'package:knn_telur/utils/molecul/data.dart';
import 'package:knn_telur/utils/molecul/heading.dart';
import 'package:knn_telur/utils/molecul/list_result.dart';
import 'package:knn_telur/utils/molecul/photo_asset.dart';
import 'package:knn_telur/utils/molecul/photo_icon.dart';
import 'package:knn_telur/utils/molecul/text_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TesterPage extends StatefulWidget {
  @override
  _TesterPageState createState() => _TesterPageState();
}

class _TesterPageState extends State<TesterPage> {
  final ShowWidgetBloc _showWidgetBloc = ShowWidgetBloc();
  _getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    base64 = prefs.getString('image') ?? '';
    k = prefs.getInt('k') ?? 3;
    _writeFile(base64);
    _showWidgetBloc.add(GetPageState());
  }

  void _writeFile(string) async {
    if (string != '') {
      Uint8List bytes = base64Decode(string);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
      await file.writeAsBytes(bytes);
    } else {
      pickedFile = null;
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: AutoSizeText(
                        'Galeri',
                        style: globalTextStyle,
                      ),
                      onTap: () {
                        _imgPicker(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: AutoSizeText(
                      'Kamera',
                      style: globalTextStyle,
                    ),
                    onTap: () {
                      _imgPicker(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgPicker(source) async {
    final imageProvider = await ImagePicker()
        .getImage(source: source, maxHeight: 1321, maxWidth: 1602);
    if (imageProvider != null) {
      final croppedImage = await ImageCropper.cropImage(
        sourcePath: imageProvider.path,
        aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 2.5),
      );
      if (croppedImage != null) {
        final bytes = croppedImage.readAsBytesSync();
        setPref(base64Encode(bytes));
        state = 0;
        pickedFile = croppedImage;
        base64 = base64Encode(bytes);
        _showWidgetBloc.add(GetPageState());
      } else {
        pickedFile = null;
        resetPref();
        base64 = '';
        _showWidgetBloc.add(GetPageState());
      }
    } else {
      pickedFile = null;
      resetPref();
      base64 = '';
      _showWidgetBloc.add(GetPageState());
    }
  }

  @override
  void initState() {
    super.initState();
    _getPref();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _showWidgetBloc,
      child: BlocListener<ShowWidgetBloc, ShowWidgetState>(
        listener: (context, state) {
          if (state is ShowWidgetError) {}
        },
        child: BlocBuilder<ShowWidgetBloc, ShowWidgetState>(
          bloc: _showWidgetBloc,
          builder: (context, state) {
            if (state is ShowWidgetInitial) {
              return _buildLoading();
            } else if (state is ShowWidgetLoading) {
              return _buildLoading();
            } else if (state is ShowWidgetLoaded) {
              return (state.pageState == 0)
                  ? _pageState0()
                  : (state.pageState == 2)
                      ? _pageData()
                      : _buildLoading();
            } else if (state is ShowWidgetError) {
              return Container(
                child: Text(state.error),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _pageState0() => Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              photoIcon(context),
              menuButton('Pilih Gambar', () {
                _showPicker(context);
              }, context),
            ],
          ),
        ),
      );

  Widget _pageData() => FutureBuilder<Object>(
      future: getImagePalette(pickedFile!),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _top(data),
              _bottom()
            ],
          );
        }
        return _buildLoading();
      });

  Widget _top(data) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(flex: 2, child: photoAsset(context, base64)),
                  widgetData(context, data![0], data[1], data[2], data[3],
                      data[4], data[5]),
                ],
              ),
            ),
            menuButton('Pilih Gambar', () {
              _showPicker(context);
            }, context),
          ],
        ),
      );

  Widget _bottom() => (pickedFile != null)
      ? Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              headingListView(),
              SizedBox(
                height: (k > 7) ? MediaQuery.of(context).size.height / 4 : null,
                child: Scrollbar(
                  isAlwaysShown: false,
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    children: [
                      //Non Fix K
                      for (int i = 0; i < k; i++) listResult(i),
                    ],
                  ),
                ),
              ),
              textState(sum, k)
            ],
          ),
        )
      : const SizedBox();
  Widget _buildLoading() => Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.width / 2,
        child: JumpingDotsProgressIndicator(
          fontSize: 20.0,
          color: Colors.cyan,
        ),
      ));
}
