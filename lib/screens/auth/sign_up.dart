import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infrakunafoni/models/signup_model.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';
import 'package:infrakunafoni/screens/auth/sign_in.dart';
import 'package:infrakunafoni/services/auth/utilisateur_service.dart';

import '../../constants.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/square_tile.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmController = TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  UtilisateurService utilisateurService = UtilisateurService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // logo
                  CircleAvatar(
                    minRadius: MediaQuery.of(context).size.width / 5,
                    maxRadius: MediaQuery.of(context).size.width / 5,
                    child: Image.asset(
                        "assets/img/logo.png"
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  // welcome back, you've been missed!
                  Text(
                      'Créez un compte pour vous !',
                      style: soustitre(Colors.grey)
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // username textfield
                  MyTextField(
                    prefixIcon: const Icon(
                        Icons.person
                    ),
                    controller: usernameController,
                    hintText: 'Nom d\'utilisateur',
                    obscureText: false,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),

                  MyTextField(
                    prefixIcon: const Icon(
                        CupertinoIcons.envelope
                    ),
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),

                  // password textfield
                  MyTextField(
                    prefixIcon: const Icon(
                        Icons.lock
                    ),
                    sufixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                          showPassword
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill
                      ),
                    ),
                    controller: passwordController,
                    hintText: 'Mot de passe',
                    obscureText: !showPassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // password textfield
                  MyTextField(
                    prefixIcon: const Icon(
                        Icons.lock
                    ),
                    sufixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      child: Icon(
                          showConfirmPassword
                              ? CupertinoIcons.eye_slash_fill
                              : CupertinoIcons.eye_fill
                      ),
                    ),
                    controller: passwordConfirmController,
                    hintText: 'Confirmer le mot de passe',
                    obscureText: !showConfirmPassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // sign in button
                  MyButton(
                    text: 'S\'inscrire',
                    onTap: () async {
                      SignUp signuprequest = SignUp(
                          username: usernameController.value.text,
                          email: emailController.value.text,
                          password: passwordController.value.text
                      );
                      String retour = await utilisateurService.signup(signuprequest);
                      print(retour);
                      Fluttertoast.showToast(msg: retour);
                    },
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'J\'ai un compte ?',
                        style: soustitre(Colors.grey[700]),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
                        },
                        child: Text(
                            'Se connecter',
                            style: soustitregras(background)
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),


                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Ou continuer avec',
                            style: soustitre(Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      GestureDetector(
                        child: const SquareTile(imagePath: 'assets/img/google.png'),
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "Inscription avec google en cours de développement !",
                          );
                        },
                      ),

                      SizedBox(width: MediaQuery.of(context).size.height * 0.03),

                      // apple button
                      GestureDetector(
                        child: const SquareTile(imagePath: 'assets/img/github.png'),
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: "Inscription avec github en cours de développement !",
                          );
                        },
                      )
                    ],
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
