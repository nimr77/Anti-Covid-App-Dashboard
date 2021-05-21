import 'dart:convert';
import 'dart:html';

class MyConverter {
  static Future<List<int>> getHtmlBloobAs64Biyte(File myBlob) async {
    List<int> myResults = <int>[];
    FileReader reader = FileReader();
    reader.readAsDataUrl(myBlob);
    await reader.onLoadEnd.firstWhere((element) {
      if (reader.result != null) {
        myResults =
            Base64Codec().decode(reader.result.toString().split(",").last);
        return true;
      }
      return false;
    });
    return myResults;
  }
}
