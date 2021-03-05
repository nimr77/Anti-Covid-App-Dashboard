import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyShapeSyle1 extends StatelessWidget {
  final int myFixColor;
  final x = Color(0x99999999);
  final String perImageUrl;
  MyShapeSyle1(this.myFixColor, this.perImageUrl);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: ImageClipper(),
        child: Image.network(
          perImageUrl,
          loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) =>
              loadingProgress == null
                  ? child
                  : Center(
                      child: SpinKitCubeGrid(
                        color: Colors.white,
                      ),
                    ),
          fit: BoxFit.cover,
          width: screenWidth,
          color: Color(myFixColor),
          colorBlendMode: BlendMode.darken,
          height: screenHeight * 0.8,
        ),
      ),
    );
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartingPoint = Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * 0.9);
    path.lineTo(curveStartingPoint.dx, curveStartingPoint.dy - 5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.7,
        curveEndPoint.dx, curveEndPoint.dy + 10);
    // path.quadraticBezierTo(size.width * 0.99, size.height * 0.94,
    //     curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
