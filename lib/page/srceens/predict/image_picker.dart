import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/button_primary.dart';

class ImagePickerPage extends StatefulWidget {
  final File? imageFile;

  const ImagePickerPage({super.key, this.imageFile});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Ambil gambar dari state.extra di constructor
    _imageFile = widget.imageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Priview Image',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: NutrisnapColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _imageFile != null
                    ? Image.file(_imageFile!)
                    : const Text(
                        'Belum ada gambar terpilih',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              label: 'Klik Saya!',
              onPressed: () {
                print('Tombol ditekan!');
              },
              backgroundColor: NutrisnapColors.primary,
              horizontalPadding: 100,
              verticalPadding: 20,
              borderRadius: 16,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              
              
            )
          ],
        ),
      ),
    );
  }
}
