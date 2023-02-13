import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/screens/auth/auth.dart';
import 'package:infrakunafoni/screens/auth/sign_up.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';
import '../../widgets/square_tile.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool showPassword = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Form(
                  key: formKey,
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
                        'Connectez-vous pour pouvoir jouer !',
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
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Le nom d'utilisateur ne doit pas être null !";
                          }
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.012),

                      // password textfield
                      MyTextField(
                        prefixIcon: const Icon(
                          Icons.lock
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "Entrez un mot de passe s'il vous plaît !";
                          } else if (value.length < 8) {
                            return "Allez jusqu'à 8 caractères !";
                          }
                        },
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

                      // forgot password?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mot de passe oublié ?',
                            style: soustitre(background),
                          ),
                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                      // sign in button
                      MyButton(
                        text: 'Se connecter',
                        onTap: () async {
                          if(formKey.currentState!.validate()) {
                            Fluttertoast.showToast(msg: "Connexion ...");
                          }
                        },
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pas de compte ?',
                            style: soustitre(Colors.grey[700]),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          GestureDetector(
                            onTap: () {
                              connexion = false;
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => const Inscription()));
                            },
                            child: Text(
                              'S\'inscrire',
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
                                msg: "Connexion avec google en cours de développement !",
                              );
                            },
                          ),

                          SizedBox(width: MediaQuery.of(context).size.height * 0.03),

                          // apple button
                          GestureDetector(
                            child: const SquareTile(imagePath: 'assets/img/github.png'),
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Connexion avec github en cours de développement !",
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
        ),
    );
  }
}
