import 'package:get_storage/get_storage.dart';
import 'package:tp_front_end_segundo_parcial/services/persona_service.dart';

import '../models/persona_model.dart';

class AuthService {
  final PersonaService personaService = PersonaService();
  final box = GetStorage();

  Future<bool> login(String usuario, String password) async {
    final personas = await personaService.getPersonasDelSistema();
    final PersonaModel persona =
        personas.where((element) => element.usuarioLogin == usuario).first;

    if (persona.usuarioLogin != null) {
      box.write('token', persona.usuarioLogin);
    }
    return persona.usuarioLogin != null;
  }

  Future<void> logout() async {
    box.remove('token');
  }
}
