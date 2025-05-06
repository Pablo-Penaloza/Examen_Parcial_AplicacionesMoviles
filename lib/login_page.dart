import 'package:flutter/material.dart';
import 'registroestudiante_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String _error = '';

  void _login() {
    final user = _userController.text;
    final pass = _passController.text;

    if (user == 'pablin' && pass == '1720') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => RegisterStudentPage()),
      );
    } else {
      setState(() => _error = 'Usuario o contraseña incorrectos.');
    }
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
                Text(
                  'Ventana de Autenticación',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
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
                    padding: const EdgeInsets.only(bottom: 20),
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
