import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraAccess extends StatefulWidget {
  const CameraAccess({Key? key}) : super(key: key);

  @override
  State<CameraAccess> createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {
  File? _selectedFile;

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      String? path = photo?.path;

      print(path);
      if (path != null) {
        _selectedFile = File(photo!.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Picture'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: _selectedFile != null
                ? Image.file(
                    _selectedFile!,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : const Text('No image available'),
          ),
          const SizedBox(height: 50),
          ElevatedButton.icon(
            onPressed: _takePicture,
            icon: const Icon(Icons.camera),
            label: const Text('Take Pickture'),
          ),
        ],
      ),
    );
  }
}
