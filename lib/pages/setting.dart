import 'package:auto_size_text/auto_size_text.dart';
import 'package:dialog_loader/dialog_loader.dart';
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
  int? kL;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DialogLoader dialogLoader = DialogLoader(context: context);
    _dialogLoader(context) async {
      setState(() {
        k = kL!;
        setPrefK(kL);
      });
      dialogLoader.show(
        theme: LoaderTheme.dialogCircle,
        title: AutoSizeText(
          "Menyimpan",
          style: globalTextStyle,
        ),
        leftIcon: SizedBox(
          child: CircularProgressIndicator(),
          height: 25.0,
          width: 25.0,
        ),
      );
    }

    void _update() {
      _dialogLoader(context);
      Future.delayed(const Duration(milliseconds: 500), () {
        dialogLoader.update(
          title: AutoSizeText(
            "Berhasil",
            style: globalTextStyle,
          ),
          leftIcon: Icon(Icons.done),
          autoClose: false,
          barrierDismissible: true,
        );
      });
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pop(context);
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
                      kL = dataTraining.length;
                    } else if (int.parse(val) == 0) {
                    } else {
                      kL = int.parse(val);
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
                      return "Tidak boleh kosong";
                    }
                    // else if (int.parse(val) > dataTraining.length) {
                    //   return "Tidak boleh lebih dari jumlah data training";
                    // }
                    else if (int.parse(val) == 0) {
                      return "Tidak boleh nol (0)";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              menuButton('Simpan', () {
                if (_formKey.currentState!.validate()) {
                  _update();
                }
              }, context)
            ],
          ),
        ),
      ),
    );
  }
}
