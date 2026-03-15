import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/page/cubit/predict_cubit.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/button_primary.dart';

class GiziSrceen extends StatefulWidget {
  final File? imageFile;
  final String? buahBase64;
  const GiziSrceen({super.key, this.imageFile, this.buahBase64});

  @override
  State<GiziSrceen> createState() => _GiziSrceenState();
}

class _GiziSrceenState extends State<GiziSrceen> {
  File? _imageFile;
  String? _buahBase64;

  @override
  void initState() {
    _buahBase64 = widget.buahBase64;
    // print('new data base 64 : $_buahBase64');
    _imageFile = widget.imageFile;
    context
        .read<PredictCubit>()
        .predictBuah(_buahBase64 ?? "data gambar gagal di input");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gizi',
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
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PredictCubit, PredictCubitState>(
          builder: (context, state) {
            if (state is PredictCubitState) {
              print('Hasil Prediksi: ${state.giziBuah?.result?.label}');
            }
            if (state is PredictCubitState) {
              print('Gagal  prediksi: ${state.error}');
            }
            return Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.giziBuah?.result?.label ??
                            "data tidak di temukan",
                        style: TextStyle(fontSize: 25),
                      ),

                      _imageFile != null
                          ? Container(
                              width: double.infinity,
                              height: 250, // Atur tinggi maksimum
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  _imageFile!,
                                  fit: BoxFit
                                      .cover, // Cocokkan gambar ke area (cover)
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                              ),
                            )
                          : const Text(
                              'Belum ada gambar terpilih',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16)),
                                          color: NutrisnapColors.primary,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 50,
                                        child: const Center(
                                          child: Text(
                                            "Energi",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16)),
                                          color: Colors.grey.shade300,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                            state.giziBuah?.result?.energi ??
                                                "data tidak di temukan",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16)),
                                          color: NutrisnapColors.primary,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 50,
                                        child: const Center(
                                          child: Text(
                                            "Protein",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16)),
                                          color: Colors.grey.shade300,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                            state.giziBuah?.result?.protein ??
                                                "data tidak di temukan",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16)),
                                          color: NutrisnapColors.primary,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 50,
                                        child: const Center(
                                          child: Text(
                                            "Lemak",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16)),
                                          color: Colors.grey.shade300,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                                state.giziBuah?.result?.lemak ??
                                                    "data tidak di temukan",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16)),
                                          color: NutrisnapColors.primary,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 50,
                                        child: const Center(
                                          child: Text(
                                            "Korbo",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(16),
                                              bottomRight: Radius.circular(16)),
                                          color: Colors.grey.shade300,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                                state.giziBuah?.result
                                                        ?.energi ??
                                                    "data tidak di temukan",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomElevatedButton(
                        label: 'Detail Gizi',
                        onPressed: () {
                          context.pushNamed('gizi_detail');
                        },
                        backgroundColor: NutrisnapColors.primary,
                        horizontalPadding: 100,
                        verticalPadding: 10,
                        borderRadius: 16,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
