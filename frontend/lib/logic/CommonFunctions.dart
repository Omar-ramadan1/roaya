
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:roaya/constant/constant.dart';
class CommonFunctions{


  uploadAssetImages(String imagePath) async {
    Uri uri =
    Uri.parse("${serverURL}image");
    http.MultipartRequest request = http.MultipartRequest("POST", uri);
    // we read the image from the image path and convert it to Uint8List
    // to be easier to send to the server
    Uint8List byteData = await File(imagePath).readAsBytes();
    // final result = await FlutterImageCompress.compressWithList(byteData.buffer.asUint8List() , quality: 15);

    // image data is added to multipart variable
    http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      'File',
      byteData,

    );
    request.files.add(multipartFile);
  // the request is send here by this command
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
  // the response is returned with a data type StreamResponse
    return response;
  }
}