import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/services/ficha_clinica_service.dart';

import '../models/ficha_clinica_model.dart';

class FichaClinicaScreen extends StatefulWidget {
  const FichaClinicaScreen({Key? key}) : super(key: key);

  @override
  State<FichaClinicaScreen> createState() => _FichaClinicaScreenState();
}

class _FichaClinicaScreenState extends State<FichaClinicaScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getFichasClinicas();
  }

  Future<List<FichaClinicaModel>> getFichasClinicas() async {
    FichaClinicaService fichaClinicaService = FichaClinicaService();

    final fichas = await fichaClinicaService.getFichasClinicas();

    print(fichas);

    return fichas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<FichaClinicaModel>>(
        future: getFichasClinicas(),
        initialData: const [],
        builder: (BuildContext context,
            AsyncSnapshot<List<FichaClinicaModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final fichas = snapshot.data!;

              return ListView.builder(
                itemCount: fichas.length,
                itemBuilder: (BuildContext context, int index) {
                  final currentFicha = fichas[index];
                  return ListTile(
                    title: const Text("Nombre del Paciente"),
                    subtitle: Text(currentFicha.idCliente?.nombre ?? ""),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No hay datos'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
