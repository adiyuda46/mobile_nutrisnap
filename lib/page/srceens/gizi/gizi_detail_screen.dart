import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/utils/color.dart';

// Contoh data dummy (bisa diganti dengan data real dari model atau API)
 final List<Map<String, dynamic>> giziData = [
  {'nama': 'Energi x', 'nilai': '250', 'satuan': 'kcal', 'persenAKG': '12.5%'},
  {'nama': 'Lemak Total', 'nilai': '250', 'satuan': 'kcal', 'persenAKG': '12.5%'},
  {'nama': 'Vitamin A', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B1', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B2', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B3', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin C', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Karbohidrat total', 'nilai': '40', 'satuan': 'g', 'persenAKG': '13.3%'},
  {'nama': 'Protein', 'nilai': '15', 'satuan': 'g', 'persenAKG': '30%'},
  {'nama': 'Serat pangan', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Kalsium', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Fosfor', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Natrium', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Kalium', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Tembaga', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Besi', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Seng', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'B-Karoten', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Karoten', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Air', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  
];

  
  // Tambah item lain sesuai kebutuhan


class GiziDetailScreen extends StatefulWidget {
  const GiziDetailScreen({super.key});

  @override
  State<GiziDetailScreen> createState() => _GiziDetailScreenState();
}

class _GiziDetailScreenState extends State<GiziDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Gizi',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: NutrisnapColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Informasi Nilai Gizi",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Per 100 g BDD (Berat Dapat Dimakan)",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              "Nilai Gizi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: giziData.length,
                itemBuilder: (context, index) {
                  final data = giziData[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(data['nama']),
                      subtitle: Text('${data['nilai']} ${data['satuan']}'),
                      trailing: Text(
                        data['persenAKG'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
