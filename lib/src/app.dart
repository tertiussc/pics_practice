import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show Response, get;
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  // counter to display onscreen, also used to indicate photo id on the API get request
  int counter = 0;

  // used to hold the list of images to be used when updating and displaying images on screen
  List<ImageModel> images = [];

  /// ## Fetch Images from API endpoint
  /// API call to fetch images and put them in the images using the ImageModel model type
  /// Uses the **http package** to make the API get request
  void fetchImage() async {
    counter++;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    Response response = await get(url);

    ImageModel imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Let\'s see some images!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Counter is $counter',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
