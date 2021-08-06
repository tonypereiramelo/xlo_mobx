import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/screens/signup/components/text_field_custom.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
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
                    Observer(
                      builder: (_) {
                        return TextFieldCustom(
                          text: 'Apelido',
                          text2: 'Como aparecerá em seus anúncios.',
                          hintText: 'Exemplo: Francisco S',
                          errorText: signupStore.nameError,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          onChanged: signupStore.setName,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFieldCustom(
                          text: 'E-Mail',
                          text2: 'Enviaremos um e-mail de Confirmação.',
                          hintText: 'Exemplo: francisco@gmail.com',
                          errorText: signupStore.emailError,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onChanged: signupStore.setEmail,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFieldCustom(
                          text: 'Telefone',
                          text2: 'Proteja sua conta',
                          hintText: '(11)99999-9999',
                          errorText: signupStore.phoneError,
                          keyboardType: TextInputType.phone,
                          obscureText: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: signupStore.setPhone,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFieldCustom(
                          text: 'Senha',
                          text2: 'Use números, letras e caracteres especiais',
                          errorText: signupStore.errorPass1,
                          obscureText: true,
                          onChanged: signupStore.setPass1,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return TextFieldCustom(
                          text: 'Confirmar Senha',
                          text2: 'Repita a senha',
                          errorText: signupStore.errorPass2,
                          obscureText: true,
                          onChanged: signupStore.setPass2,
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          height: 40,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          child: ElevatedButton(
                            onPressed: signupStore.formIsValid ? () {} : null,
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
                        );
                      },
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
      ),
    );
  }
}
