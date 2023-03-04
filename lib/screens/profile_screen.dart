import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';
import 'package:infrakunafoni/screens/auth/auth.dart';
import 'package:infrakunafoni/services/auth/utilisateur_service.dart';
import 'package:infrakunafoni/widgets/list_card.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/my_button.dart';
import '../widgets/my_card.dart';
import '../widgets/my_textfield.dart';
import '../widgets/square_tile.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();


  String selectedImagePath = '';

  UtilisateurService utilisateurService = UtilisateurService();

  late Map utilisateur;

  //late Utilisateur monuser;

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,dynamic>>(
      future: utilisateurService.getUser(),
      builder: (context, data) {
        if(data.hasError) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.xmark,
                  color: background,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Lottie.asset("assets/json/connectionlost.json"),
                    Text("Problème de connexion!", style: titregras(incorrect),),
                    InkWell(
                      onTap: () {
                        setState(() {

                        });
                      },
                      child: Icon(
                        CupertinoIcons.restart,
                        color: background,
                        size: 50,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
                        },
                        child: Text("Cliquer ici pour vous connecter !", style: soustitre(background),)),
                    MyButton(onTap: () => Navigator.pop(context), text: "Accueil")
                  ],
                ),
              ),
            ),
          );
        } else if(data.hasData) {
          if(data.data!.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.xmark,
                    color: background,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Lottie.asset("assets/json/connectionlost.json"),
                      Text("Vous n'êtes pas connecté !", style: titregras(incorrect),),

                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Auth()));
                          },
                          child: Text("Cliquer ici pour vous connecter !", style: soustitre(background),)),
                      MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth())), text: "Connexion")
                    ],
                  ),
                ),
              ),
            );
          } else {
            var utilisateur = Utilisateur.fromJson(data.data!);
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: background,
                    elevation: 0,
                    leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(CupertinoIcons.back)
                    ),
                    title: Center(
                      child: Text(
                        "Modifier le profil",
                        style: soustitregras(Colors.white),
                      ),
                    ),
                    actions: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              "Valider",
                              style: soustitregras(Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.25,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                          height: MediaQuery.of(context).size.height * 0.24,
                          width: double.infinity,
                          color: background,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      maxRadius: MediaQuery.of(context).size.height * 0.07,
                                      minRadius: MediaQuery.of(context).size.height * 0.07,
                                      child: selectedImagePath == '' ? ClipRRect(child: Image.asset("assets/img/${utilisateur.image}"),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.08))) : ClipRRect(child: Image.file(File(selectedImagePath), fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,), borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.08)),),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          AwesomeDialog(
                                              context: context,
                                              closeIcon: const Icon(
                                                  Icons.cancel_sharp
                                              ),
                                              dialogType: DialogType.noHeader,
                                              body: Padding(
                                                padding: const EdgeInsets.only(bottom: 15.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      child: const SquareTile(imagePath: 'assets/img/gallery.png'),
                                                      onTap: () async {
                                                        Fluttertoast.showToast(
                                                          msg: "Pick from gallery",
                                                        );
                                                        selectedImagePath = await selectImageFromGallery();

                                                        if (selectedImagePath != '') {
                                                          Navigator.pop(context);
                                                          setState(() {});
                                                        } else {
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                            content: Text("Aucune image selectionnée !"),
                                                          ));
                                                        }
                                                      },
                                                    ),

                                                    // apple button
                                                    GestureDetector(
                                                      child: const SquareTile(imagePath: 'assets/img/camera.png'),
                                                      onTap: () async {
                                                        Fluttertoast.showToast(
                                                          msg: "Pick from camera",
                                                        );

                                                        selectedImagePath = await selectImageFromCamera();

                                                        if (selectedImagePath != '') {
                                                          Navigator.pop(context);
                                                          setState(() {});
                                                        } else {
                                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                            content: Text("Erreur lors de la capture de l'image !"),
                                                          ));
                                                        }

                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                          ).show();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey[700],
                                          maxRadius: MediaQuery.of(context).size.height * 0.02,
                                          child: Icon(CupertinoIcons.camera, size: MediaQuery.of(context).size.height * 0.025,),
                                        ),
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        AwesomeDialog(
                                            context: context,
                                            closeIcon: const Icon(
                                                Icons.cancel_sharp
                                            ),
                                            dialogType: DialogType.noHeader,
                                            body: Padding(
                                              padding: const EdgeInsets.only(bottom: 15.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  for(int i = utilisateur.notifications!.length - 1; i >= 0; i--)
                                                  ListCard(
                                                    listTile: ListTile(
                                                    subtitle: Text(utilisateur.notifications![i].description!, style: soustitre(Colors.white),),
                                                  ),
                                                  )
                                                ],
                                              ),
                                            )
                                        ).show();
                                      },
                                      child: const Icon(
                                        Icons.notifications_active,
                                        color: Colors.pink,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                              Text(
                                "Nom d'utilisateur",
                                style: soustitregras(background),
                              ),
                              MyTextField(
                                prefixIcon: const Icon(
                                    Icons.person
                                ),
                                controller: _usernameController,
                                hintText: '${utilisateur.username}',
                                obscureText: false,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                              Text(
                                "e-mail",
                                style: soustitregras(background),
                              ),
                              MyTextField(
                                prefixIcon: const Icon(
                                    CupertinoIcons.envelope
                                ),
                                controller: _emailController,
                                hintText: '${utilisateur.email}',
                                obscureText: false,
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                              Text(
                                'Vos scores :',
                                style: soustitregras(background),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              utilisateur.sessionJeux!.isNotEmpty
                                  ?
                              MyCard(
                                widget: Column(
                                  children: [
                                    for(int i = 0; i < utilisateur.sessionJeux!.length; i++)
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              utilisateur.sessionJeux![i].date!.substring(0, 19),
                                              style: titreliste(background),
                                            ),
                                            Text(
                                              '${utilisateur.sessionJeux![i].points} points',
                                              style: titreliste(background),
                                            )
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              )
                                  :
                              Text("Vous n'avez pas encore joué !", style: soustitregras(background),),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                              MyButton(
                                text: 'Se deconnecter',
                                onTap: () async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.clear();
                                  connecte = false;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth()));
                                },
                              ),
                            ],
                          )
                      )
                  )
                ],
              ),
            );
          }
        } else {
          return Center(child: Lottie.asset("assets/json/loading.json", width: 50, height: 50));
        }
      },
    );
  }
}

//extendBodyBehindAppBar: true,
/*backgroundColor: neutral,
appBar: AppBar(
backgroundColor: background,
elevation: 0,
leading: const Icon(CupertinoIcons.back),
title: Center(
child: Text(
"Modifier le profil",
style: soustitregras(Colors.white),
),
),
actions: [
Center(
child: Padding(
padding: const EdgeInsets.only(right: 18),
child: Text(
"Valider",
style: soustitregras(Colors.white),
),
),
),
],
),
body: Column(
children: [
Container(
height: MediaQuery.of(context).size.height * 0.24,
width: double.infinity,
color: background,
child: Padding(
padding: const EdgeInsets.only(top: 25.0),
child: Column(
children: [
Stack(
children: [
CircleAvatar(
backgroundColor: Colors.white,
maxRadius: MediaQuery.of(context).size.height * 0.08,
child: Image.asset("assets/img/user_profile.png"),
),
const Positioned(
bottom: 0,
right: 0,
child: CircleAvatar(
backgroundColor: Colors.white,
child: Icon(CupertinoIcons.camera),
),
)
],
)

],
),
),
)
],
),
);*/
