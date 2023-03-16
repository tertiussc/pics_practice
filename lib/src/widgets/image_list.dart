import 'package:flutter/material.dart';
import '../models/image_model.dart';
import 'package:basic_utils/basic_utils.dart' show StringUtils;

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  // Constructor
  const ImageList(this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return buldImage(images[index]);
      },
    );
  }

  Widget buldImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Image.network(image.url),
          SizedBox(height: 20),
          Text(
            StringUtils.capitalize(image.title),
          ),
        ],
      ),
    );
  }
}
