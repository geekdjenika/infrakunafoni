import 'dart:io';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/screens/auth/sign_in.dart';

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
  Widget build(BuildContext context) {
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
                    child: Text(
                      "Valider",
                      style: soustitregras(Colors.white),
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
                              maxRadius: MediaQuery.of(context).size.height * 0.08,
                              minRadius: MediaQuery.of(context).size.height * 0.08,
                              child: selectedImagePath == '' ? ClipRRect(child: Image.asset("assets/img/photo.jpg"),borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.08))) : ClipRRect(child: Image.file(File(selectedImagePath), fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,), borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.height * 0.08)),),
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
                          hintText: 'geekdjenika',
                          obscureText: false,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                        Text(
                          "E-mail",
                          style: soustitregras(background),
                        ),
                        MyTextField(
                          prefixIcon: const Icon(
                              CupertinoIcons.envelope
                          ),
                          controller: _emailController,
                          hintText: 'djenikaa@gmail.com',
                          obscureText: false,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                        Text(
                          'Vos scores :',
                          style: soustitregras(background),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        MyCard(
                          widget: Column(
                            children: [
                              for(int i = 0; i < 10; i++)
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${DateTime(2023,Random().nextInt(12),Random().nextInt(30))}',
                                      style: titreliste(background),
                                    ),
                                    Text(
                                      '${Random().nextInt(100)} points',
                                      style: titreliste(background),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                        MyButton(
                          text: 'Se deconnecter',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
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
