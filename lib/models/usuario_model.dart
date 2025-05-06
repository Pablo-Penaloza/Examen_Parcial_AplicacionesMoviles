class UsuarioModel {
  final int? id;
  final String usuario;
  final String clave;

  UsuarioModel({this.id, required this.usuario, required this.clave});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'clave': clave,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      usuario: map['usuario'],
      clave: map['clave'],
    );
  }
}
