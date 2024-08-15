import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/image_model.dart';

class ImageRepository {
  Future<List<PixelFordImage>> getNetworkImages() async {
    try {
      var endPointUrl = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endPointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelFordImage> _imageList = decodedList.map((listItem) {
          return PixelFordImage.fromJson(listItem);
        }).toList();

        print(_imageList[0].urlFullSize);

        return _imageList;
      } else {
        throw Exception('Api not successful');
      }
    } on SocketException {
      throw Exception('No internet');
    } on HttpException {
      throw Exception('Http error');
    } on FormatException {
      throw Exception('Does not support this application');
    } catch (e) {
      print(e);
      throw Exception('Unknown error');
    }
  }
}
