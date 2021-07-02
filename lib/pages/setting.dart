import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/helper/list_training.dart';
import 'package:knn_telur/helper/pref.dart';
import 'package:knn_telur/helper/state_store.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/molecul/button.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int? _kL;

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _update() {
      AwesomeDialog(
        dismissOnTouchOutside: false,
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.SUCCES,
        body: const Center(
          child: Text(
            'Berhasil Update Nilai K',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        btnOkOnPress: () {
          // Navigator.pop(context);
        },
      )..show();
      setState(() {
        k = _kL!;
        setPrefK(_kL);
      });
    }

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber[100]),
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.all(10),
                      child: AutoSizeText(
                        'K: ' + k.toString(),
                        style: globalTextStyle,
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: TextFormField(
                  controller: _textEditingController,
                  onChanged: (val) {
                    if (val.length == 0) {
                    } else if (int.parse(val) > dataTraining.length) {
                      _kL = dataTraining.length;
                    } else if (int.parse(val) == 0) {
                    } else {
                      _kL = int.parse(val);
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Masukan nilai K",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.cyan, width: 1),
                      ),
                      //fillColor: Colors.green
                      focusColor: Colors.blue),
                  validator: (val) {
                    if (val!.length == 0) {
                      return "Tidak boleh kosong!";
                    } else if (int.parse(val) > dataTraining.length) {
                      return "Tidak boleh lebih dari jumlah data training!";
                    } else if (int.parse(val) < 0) {
                      return "Tidak boleh bernilai negatif(-)!";
                    } else if (int.parse(val) == 0) {
                      return "Tidak boleh nol (0)!";
                    } else if (int.parse(val) == k) {
                      return "Tidak ada perubahan nilai K";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              MenuButtonWidget(
                  v: 'Simpan',
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _update();
                    }
                  },
                  c: context)
            ],
          ),
        ),
      ),
    );
  }
}
