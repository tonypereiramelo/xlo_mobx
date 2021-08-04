import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Acessar com e-mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[900],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 3, bottom: 4),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 3, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.purple,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
