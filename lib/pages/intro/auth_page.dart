// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_truco/services/functions/auth_functions.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullName = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                login ? "Login" : "Cadastro",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "Cadastre-se ou faça o login na sua conta para sincronizar o histórico das partidas.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    login
                        ? Container()
                        : TextFormField(
                            key: const ValueKey('fullName'),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              hintText: 'Nome completo',
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                            ),
                            textCapitalization: TextCapitalization.words,
                            cursorColor:
                                Theme.of(context).colorScheme.onPrimary,
                            style: Theme.of(context).textTheme.bodySmall,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Insira um nome';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                fullName = value!;
                              });
                            },
                          ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const ValueKey('email'),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        hintText: 'Email',
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      style: Theme.of(context).textTheme.bodySmall,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Insira um email válido';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      key: const ValueKey('password'),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        hintText: 'Senha',
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      style: Theme.of(context).textTheme.bodySmall,
                      validator: (value) {
                        if (value!.length < 6 || value.isEmpty) {
                          return 'A senha deve conter 6 ou mais caracteres';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          login
                              ? AuthServices.signinUser(
                                  email,
                                  password,
                                  context,
                                )
                              : AuthServices.signupUser(
                                  fullName,
                                  email,
                                  password,
                                  context,
                                );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        login ? "Entrar" : "Cadastrar",
                        style: const TextStyle(
                          color: Color(0xFF373737),
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(
                        login
                            ? "Ainda não tem conta? Cadastrar-se aqui"
                            : "Já tem conta? Faça o login aqui",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => AuthServices.signInWithGoogle(),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/google_icon.png',
                          height: 25,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          login
                              ? "Entrar com Google"
                              : "Fazer login com Google",
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF373737),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
