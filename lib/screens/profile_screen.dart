import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

import '../widgets/my_button.dart';
import '../widgets/my_card.dart';
import '../widgets/my_textfield.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

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
                  child: Icon(CupertinoIcons.back)
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
                              backgroundColor: Colors.white,
                              maxRadius: MediaQuery.of(context).size.height * 0.08,
                              child: Image.asset("assets/img/user_profile.png"),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: MediaQuery.of(context).size.height * 0.02,
                                child: const Icon(CupertinoIcons.camera),
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
                          controller: _emailController,
                          hintText: 'djenikaa@gmail.com',
                          obscureText: false,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
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
                                      '${DateTime(2023,1,24)}',
                                      style: titreliste(background),
                                    ),
                                    Text(
                                      '34 points',
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
                          onTap: () {},
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
