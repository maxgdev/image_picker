import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Image Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  ImagePicker imgPicker;

  @override
  void initState() {
    super.initState();
    imgPicker = ImagePicker();
  }

  Future getImageFromGallery() async {
    print('Image Picker button pressed');
    final pickedFile = await imgPicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    print('Image Picker button pressed');
    final pickedFile = await imgPicker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile != null
                ? Image.file(_imageFile)
                : Icon(Icons.image, size: 150),
            Text(
              'Click the button to Select an Image',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageFromCamera,
        // onLongPress: _imageFromCamera,
        tooltip: 'Image Picker',
        child: Icon(Icons.image),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
