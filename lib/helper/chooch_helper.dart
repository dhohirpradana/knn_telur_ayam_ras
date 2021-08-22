import 'dart:io';
import 'package:dio/dio.dart';

Future choochEgg(File file) async {
  Dio dio = new Dio();
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    "image": await MultipartFile.fromFile(file.path, filename: fileName),
  });
  final response = await dio.post(
      "https://api.chooch.ai/predict/image?apikey=197083a0-4342-4c70-bb8b-964a84b56b62&model_id=8077",
      data: formData);
  return response.data;
}
