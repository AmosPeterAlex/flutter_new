import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:typed_data';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ImagePickerWidget1(),
    ));
  }
}

class ImagePickerWidget1 extends StatefulWidget {
  @override
  _ImagePickerWidget1State createState() => _ImagePickerWidget1State();
}

class _ImagePickerWidget1State extends State<ImagePickerWidget1> {
  Uint8List? _imageBytes;
  File? _imageFile;
  late DropzoneViewController _controller;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.single.bytes != null) {
        setState(() {
          _imageBytes = result.files.single.bytes;
          _imageFile = null;
        });
      }
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
          _imageBytes = null;
        });
      }
    }
  }

  void _removeImage() {
    setState(() {
      _imageBytes = null;
      _imageFile = null;
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
            child: Stack(
              children: [
                if (kIsWeb) _buildDropZone(),
                if (_imageBytes == null && _imageFile == null)
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
                  )
                else
                  _buildImage(),
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

  Widget _buildDropZone() {
    return DropzoneView(
      onCreated: (DropzoneViewController controller) =>
          _controller = controller,
      onDrop: (dynamic event) async {
        final bytes = await _controller.getFileData(event);
        setState(() {
          _imageBytes = bytes;
          _imageFile = null;
        });
      },
      onHover: () {
        setState(() {});
      },
      onLeave: () {
        setState(() {});
      },
    );
  }

  Widget _buildImage() {
    return Stack(
      children: <Widget>[
        if (_imageBytes != null)
          Image.memory(
            _imageBytes!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        else if (_imageFile != null)
          Image.file(
            _imageFile!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
      ],
    );
  }
}
