import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/widget/signup/text_field_custom.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
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
                  TextFieldCustom(
                    text: 'Apelido',
                    text2: 'Como aparecerá em seus anúncios.',
                    hintText: 'Exemplo: Francisco S',
                    keyboardType: TextInputType.name,
                    obscureText: false,
                  ),
                  TextFieldCustom(
                    text: 'E-Mail',
                    text2: 'Enviaremos um e-mail de Confirmação.',
                    hintText: 'Exemplo: francisco@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  TextFieldCustom(
                    text: 'Telefone',
                    text2: 'Proteja sua conta',
                    hintText: '(11)99999-9999',
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                  ),
                  TextFieldCustom(
                    text: 'Senha',
                    text2: 'Use números, letras e caracteres especiais',
                    obscureText: true,
                  ),
                  TextFieldCustom(
                    text: 'Confirmar Senhar',
                    text2: 'Repita senha',
                    obscureText: true,
                  ),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 20, bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Cadastra-se'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          'Já tem uma conta? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
