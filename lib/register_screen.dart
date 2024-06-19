import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _register() async {
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('username', isEqualTo: _usernameController.text)
          .get();

      if (result.docs.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('El nombre de usuario ya está en uso.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('usuarios').add({
        'name': _nameController.text,
        'username': _usernameController.text,
        'password': _passwordController.text,
        'phone': _phoneController.text,
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Registro exitoso'),
          content: Text('El usuario ha sido registrado exitosamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Nombre de usuario'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Teléfono'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text('Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
