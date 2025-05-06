import 'package:flutter_app_examen/database/database_helper.dart';
import 'package:flutter_app_examen/models/usuario_model.dart';

class UsuarioDao {
  Future<int> insertUsuario(UsuarioModel usuario) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('usuarios', usuario.toMap());
  }

  Future<UsuarioModel?> validar(String usuario, String clave) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'usuarios',
      where: 'usuario = ? AND clave = ?',
      whereArgs: [usuario, clave],
    );
    if (result.isNotEmpty) {
      return UsuarioModel.fromMap(result.first);
    }
    return null;
  }
}
