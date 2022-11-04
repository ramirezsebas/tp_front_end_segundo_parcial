import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _usuarioController,
            decoration: const InputDecoration(
              labelText: "Usuario",
              hintText: "Ingrese su usuario",
              icon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              labelText: "Contraseña",
              hintText: "Ingrese su contraseña",
              icon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                AuthService authService = AuthService();
                try {
                  final isValidUser = await authService.login(
                      _usuarioController.text, _passwordController.text);

                  if (!mounted) {
                    return;
                  }

                  if (isValidUser) {
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Usuario o contraseña incorrectos'),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al iniciar sesión'),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Complete los campos'),
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
