import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/page/cubit/gizi_detail_cubit.dart';
import 'package:nutrisnap_mobile/utils/color.dart';

// Contoh data dummy (bisa diganti dengan data real dari model atau API)
final List<Map<String, dynamic>> giziData = [
  {'nama': 'Energi x', 'nilai': '250', 'satuan': 'kcal', 'persenAKG': '12.5%'},
  {
    'nama': 'Lemak Total',
    'nilai': '250',
    'satuan': 'kcal',
    'persenAKG': '12.5%'
  },
  {'nama': 'Vitamin A', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B1', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B2', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin B3', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {'nama': 'Vitamin C', 'nilai': '40', 'satuan': 'mg', 'persenAKG': '44%'},
  {
    'nama': 'Karbohidrat total',
    'nilai': '40',
    'satuan': 'g',
    'persenAKG': '13.3%'
  },
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
  final String? labelBuah;

  const GiziDetailScreen({super.key, this.labelBuah});

  @override
  State<GiziDetailScreen> createState() => _GiziDetailScreenState();
}

class _GiziDetailScreenState extends State<GiziDetailScreen> {
  String? _labelBuah;

  @override
  void initState() {
    _labelBuah = widget.labelBuah;

    context.read<DetailGiziCubit>().giziDetail(_labelBuah ?? "data tidak dikirim");

    super.initState();
  }

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
          onPressed: () => context.go('/home'),
        ),
      ),
      body: BlocBuilder<DetailGiziCubit, DetailGiziCubitState>(
        builder: (context, state) {
          if (state is GiziDetailLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Container(
                child: Text("tess detail "),
              ),
              Text(state.giziBuahDetail?.result?.air ?? "data tidak di temukan")
            ],
          );
        },
      ),
    );
  }
}
