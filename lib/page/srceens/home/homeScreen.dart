import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/MenuButton.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Menyimpan file gambar yang dipilih
  File? _imageFile;

  // Membuat instance ImagePicker
  final ImagePicker _picker = ImagePicker();

  /// Memanggil kamera atau galeri sesuai [source] yang dipilih.
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: NutrisnapColors.primary,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: tinggi * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "NUTRISNAP",
                          style: TextStyle(
                            color: NutrisnapColors.textPrimary,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: tinggi * 0.78,
                  decoration: BoxDecoration(
                    color: NutrisnapColors.secondary,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MenuButton(
                          icon: Icons.camera_alt,
                          label: 'CAMERA',
                          onPressed: () async {
                            final XFile? pickedFile = await _picker.pickImage(
                                source: ImageSource.camera);
                            if (pickedFile != null) {
                              final File imageFile = File(pickedFile.path);
                              print("adi :$imageFile");
                              context.pushNamed('predict', extra: imageFile);
                            }
                          },
                          backgroundColor: NutrisnapColors.primary,
                          textColor: Colors.white,
                        ),
                        MenuButton(
                          icon: Icons.folder,
                          label: 'ASSET',
                          onPressed: () async {
                            final XFile? pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              final File imageFile = File(pickedFile.path);
                              print(
                                  "Gambar dipilih dari galeri: ${imageFile.path}");
                              context.pushNamed('predict', extra: imageFile);
                            } else {
                              print("Tidak ada gambar yang dipilih");
                            }
                          },
                          backgroundColor: NutrisnapColors.primary,
                          textColor: Colors.white,
                        ),
                        // MenuButton(
                        //   icon: Icons.help_outline,
                        //   label: 'HELP',
                        //   onPressed: () {
                        //     context.pushNamed(
                        //         'help'); // 💡 Sekarang aman jika 'home' punya name
                        //   },
                        //   backgroundColor: NutrisnapColors.primary,
                        //   textColor: Colors.white,
                        // ),
                        // MenuButton(
                        //   icon: Icons.info_outline,
                        //   label: 'INFO',
                        //   onPressed: () {
                        //     context.push(
                        //         '/info'); // 💡 Cukup jika rute /home ada di GoRouter
                        //   },
                        //   backgroundColor: NutrisnapColors.primary,
                        //   textColor: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
