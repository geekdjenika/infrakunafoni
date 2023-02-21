import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/screens/conseil/conseil_screen.dart';
import 'package:infrakunafoni/screens/infraction/amende_screen.dart';
import 'package:infrakunafoni/screens/infraction/infraction_screen.dart';
import 'package:infrakunafoni/screens/profile_screen.dart';
import 'package:infrakunafoni/screens/quiz/quiz_screen.dart';

import 'infraction/infraction_list.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  static final List<Widget> _pages = [
    const ConseilScreen(),
    const InfractionScreen(),
    const AmendeScreen(),
    const QuizScreen(),
    InfractionList(infractions: infractions,amendes: amendes),
    InfractionList(infractions: infractions),
  ];
  int curveindex = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: background,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Profil()));
                    },
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: background,
                  child: GestureDetector(
                    onTap: () {
                      /*AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.rightSlide,
                        autoHide: const Duration(seconds: 5),
                        title: 'Salut !',
                        desc: 'Je vais disparaître dans 5 sécondes !',
                        btnCancelOnPress: () {
                          //Navigator.pop(context);
                        },

                        btnOkOnPress: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Connexion()));
                        },
                      ).show();*/
                    },
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            pinned: true,
            backgroundColor: background,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/img/appbar.png",
               // width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: useindex ? _pages[selectedPageIndex] : _pages[curveindex]
              )
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 50,
        color: background,
        index: curveindex,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        items: <Widget>[
          CircleAvatar(
            minRadius: 25,
            maxRadius: 25,
            backgroundColor: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.tips_and_updates_rounded,
                  color: Colors.white,
                ),
                Text(
                  'Conseils',
                  style: texticon(Colors.white),
                )
              ],
            ),
          ),
          CircleAvatar(
            minRadius: 25,
            maxRadius: 25,
            backgroundColor: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.time_to_leave_rounded,
                  color: Colors.white,
                ),
                Text(
                  'Infractions',
                  style: texticon(Colors.white),
                )
              ],
            ),
          ),
          CircleAvatar(
            minRadius: 25,
            maxRadius: 25,
            backgroundColor: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.money_outlined,
                  color: Colors.white,
                ),
                Text(
                  'Amendes',
                  style: texticon(Colors.white),
                )
              ],
            ),
          ),
          CircleAvatar(
            minRadius: 25,
            maxRadius: 25,
            backgroundColor: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.gamecontroller_alt_fill,
                  color: Colors.white,
                ),
                Text(
                  'Jouer',
                  style: texticon(Colors.white),
                )
              ],
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            useindex = false;
            categorie = [];
            amendes = [];
            infractions = [];
            curveindex = index;
          });
        },
      ),
    );
  }
}
