import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:managementapp/shared/erorr/exception.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode("osama:osama1234"));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Map> postData(String link, Map data) async {
    try {
      var response = await http.post(Uri.parse(link),
          body: data, headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        throw ServerException("Server Error");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Map> multiPostData(File imageFile, String link, Map data) async {
    final url = Uri.parse(link);
    var request = http.MultipartRequest('POST', url)
      ..fields['name'] = data["name"] // إضافة الاسم كحقل نصي
      ..files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));
    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(responseBody);
      print(decodedResponse);
      final res = decodedResponse;
      return res;
    } else {
      throw ServerException("Server Error");
    }
  }

  // Future<Either<StatusRequest, Map>> postDataPayment(
  //   String linkurl,
  //   Map data,
  // ) async {
  //   if (await checkInternet()) {
  //     var response = await http.post(Uri.parse(linkurl),
  //         body: jsonEncode(data),
  //         headers: {'Content-Type': 'application/json'});
  //     print(response.statusCode);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map responsebody = jsonDecode(response.body);
  //       print(responsebody);

  //       return right(responsebody);
  //     } else {
  //       return const Left(StatusRequest.serverfailure);
  //     }
  //   } else {
  //     return const Left(StatusRequest.offlinefaliure);
  //   }
  // }
}