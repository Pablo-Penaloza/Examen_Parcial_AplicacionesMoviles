import 'package:flutter/material.dart';
import 'package:flutter_app_examen/registroestudiante_page.dart';
import 'package:flutter_app_examen/dao/usuario_dao.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _error = '';

  final dao = UsuarioDao();

  void _login() async {
    final user = _userController.text.trim();
    final pass = _passController.text.trim();

    final usuario = await dao.validar(user, pass);
    if (usuario != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegisterStudentPage()),
      );
    } else {
      setState(() => _error = 'Usuario o contraseña incorrectos.');
    }
  }

  @override
  void initState() {
    super.initState();
    // Puedes crear aquí más usuarios si lo deseas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 200),
                SizedBox(height: 30),
                Text('Ventana de Autenticación',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                SizedBox(height: 30),
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Ingresar'),
                ),
                if (_error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(_error, style: TextStyle(color: Colors.red)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
