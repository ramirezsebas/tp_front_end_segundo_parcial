import 'package:tp_front_end_segundo_parcial/services/persona_service.dart';

import '../models/persona_model.dart';

class AuthService {
  PersonaService personaService = PersonaService();

  Future<bool> login(String email, String password) async {
    final personas = await personaService.getPersonasDelSistema();
    final List<PersonaModel> persona =
        personas.where((element) => element.email == email).toList();

    return persona.isNotEmpty;
  }
}
