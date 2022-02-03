
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:roaya/constant/constant.dart';
class CommonFunctions{


  uploadAssetImages(String imagePath) async {
    Uri uri =
    Uri.parse("${serverURL}image");
    http.MultipartRequest request = http.MultipartRequest("POST", uri);
    Uint8List byteData = await File(imagePath).readAsBytes();
    // final result = await FlutterImageCompress.compressWithList(byteData.buffer.asUint8List() , quality: 15);
    print(byteData.length);

    http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      'File',
      byteData,

    );
    request.files.add(multipartFile);
// send
    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    return response;
  }
}