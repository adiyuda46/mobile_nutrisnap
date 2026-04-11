import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrisnap_mobile/page/cubit/gizi_detail_cubit.dart';
import 'package:nutrisnap_mobile/utils/color.dart';
import 'package:nutrisnap_mobile/utils/widget/row_detail_gizi.dart';

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

    context
        .read<DetailGiziCubit>()
        .giziDetail(_labelBuah ?? "data tidak dikirim");

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
              Text(
                "Informasi Nilai Gizi",
                style: TextStyle(fontSize: 28),
              ),
              Text("Komposisi gizi makanan dihitung per 100 g"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //height: 200,
                  //width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: NutrisnapColors.primary),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        GiziDetailRow(
                          label: "Air (Water)",
                          value: state.giziBuahDetail?.result?.air,
                        ),
                        GiziDetailRow(
                          label: "Energi (Energy",
                          value: state.giziBuahDetail?.result?.energi,
                        ),
                        GiziDetailRow(
                          label: "Protein (Protein)",
                          value: state.giziBuahDetail?.result?.protein,
                        ),
                         GiziDetailRow(
                          label: "Lemak (Fat)",
                          value: state.giziBuahDetail?.result?.lemak,
                        ),
                         GiziDetailRow(
                          label: "Karbohidrat (CHO)",
                          value: state.giziBuahDetail?.result?.karbo,
                        ),
                         GiziDetailRow(
                          label: "Serat (Fibre)",
                          value: state.giziBuahDetail?.result?.seratPangan,
                        ),
                        GiziDetailRow(
                          label: "Abu (ASH)",
                          value: state.giziBuahDetail?.result?.abu,
                        ),
                        GiziDetailRow(
                          label: "Kalsium (Ca)",
                          value: state.giziBuahDetail?.result?.kalsium,
                        ),
                        GiziDetailRow(
                          label: "Fosfor (P)",
                          value: state.giziBuahDetail?.result?.fosfor,
                        ),
                        GiziDetailRow(
                          label: "Besi (Fe)",
                          value: state.giziBuahDetail?.result?.besi,
                        ),
                        GiziDetailRow(
                          label: "Natrium (Na)",
                          value: state.giziBuahDetail?.result?.natrium,
                        ),
                        GiziDetailRow(
                          label: "Kalium (K)",
                          value: state.giziBuahDetail?.result?.natrium,
                        ),
                        GiziDetailRow(
                          label: "Tembaga (Cu)",
                          value: state.giziBuahDetail?.result?.tembaga,
                        ),
                        GiziDetailRow(
                          label: "Seng (Zn)",
                          value: state.giziBuahDetail?.result?.seng,
                        ),
                        GiziDetailRow(
                          label: "Beta-Karoten (Carotenes)",
                          value: state.giziBuahDetail?.result?.bKarotene,
                        ),
                        GiziDetailRow(
                          label: "Karoten Total (Re)",
                          value: state.giziBuahDetail?.result?.karotenTotal,
                        ),
                        GiziDetailRow(
                          label: "Thiamin (Vit. B1)",
                          value: state.giziBuahDetail?.result?.vitB1,
                        ),
                         GiziDetailRow(
                          label: "Riboflavin (Vit. B2)",
                          value: state.giziBuahDetail?.result?.vitB2,
                        ),
                        GiziDetailRow(
                          label: "Riboflavin (Vit. B2)",
                          value: state.giziBuahDetail?.result?.vitB2,
                        ),
                        GiziDetailRow(
                          label: "Niasin (Niacin)",
                          value: state.giziBuahDetail?.result?.vitB3,
                        ),
                        GiziDetailRow(
                          label: "Vitamin C (Vit. C)",
                          value: state.giziBuahDetail?.result?.vitC,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                          ],
          );
        },
      ),
    );
  }
}
