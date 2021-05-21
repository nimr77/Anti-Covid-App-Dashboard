import 'dart:html' as html;

class MyFunctionsHtml {
  static const ImagesFormat = ".png, .jpg, .jpeg";
  static Future<html.File> getImage() async {
    late html.File myImage;

    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.accept = ImagesFormat;
    uploadInput.click();
    var elmStream = uploadInput.onChange;
    await elmStream.firstWhere((element) {
      if (uploadInput.files![0] != null) {
        myImage = uploadInput.files![0];
        return true;
      } else {
        return true;
      }
    });
    return myImage;
  }
}
