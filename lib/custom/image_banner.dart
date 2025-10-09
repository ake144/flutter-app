import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  
  final Color _color;
  final String _imagePath;

  const ImageBanner({super.key, required Color color, required String imagePath})
      : _color = color,
        _imagePath = imagePath;



  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: 200,
          width: 299,
        ),
        decoration: BoxDecoration(color: _color),
        child: Image(image: AssetImage(_imagePath),
         fit: BoxFit.fill,
        ),
        // width: 299,
        // height: 200,

      );
  }
}