import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:typed_data';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImagePickerWidget1(),
      ),
    );
  }
}

class ImagePickerWidget1 extends StatefulWidget {
  @override
  _ImagePickerWidget1State createState() => _ImagePickerWidget1State();
}

class _ImagePickerWidget1State extends State<ImagePickerWidget1> {
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _imageBytes = result.files.single.bytes;
      });
    }
  }

  void _removeImage() {
    setState(() {
      _imageBytes = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: DottedBorder(
          color: Colors.grey,
          strokeWidth: 2,
          dashPattern: [6, 6],
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          child: Container(
            width: 200,
            height: 300,
            child: _imageBytes == null
                ? Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 50, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'Add Image',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Drag and drop or choose file to upload',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  )
                : Stack(
                    children: <Widget>[
                      Image.memory(
                        _imageBytes!,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: _removeImage,
                          child: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
