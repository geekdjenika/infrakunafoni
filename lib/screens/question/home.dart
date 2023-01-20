import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
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
                  child: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: background,
                  child: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            pinned: true,
            backgroundColor: background,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/appbar.png",
               // width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                              child: Image.asset(
                                "assets/images/vl.png",
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: MediaQuery.of(context).size.height * 0.22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: background,
                                child: Column(
                                  children: [
                                    Text(
                                      'Véhicules légers',
                                      style: soustitregras(Colors.white),
                                    ),
                                    Text(
                                      '24 infractions',
                                      style: soustitre(Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                              child: Image.asset(
                                "assets/images/motos.jpg",
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: MediaQuery.of(context).size.height * 0.22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: background,
                                child: Column(
                                  children: [
                                    Text(
                                      'Motos',
                                      style: soustitregras(Colors.white),
                                    ),
                                    Text(
                                      '27 infractions',
                                      style: soustitre(Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                              child: Image.asset(
                                "assets/images/gp.png",
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: MediaQuery.of(context).size.height * 0.22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: background,
                                child: Column(
                                  children: [
                                    Text(
                                      'Gros porteurs',
                                      style: soustitregras(Colors.white),
                                    ),
                                    Text(
                                      '15 infractions',
                                      style: soustitre(Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0, 3),
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                              child: Image.asset(
                                "assets/images/generale.png",
                                width: MediaQuery.of(context).size.width * 0.43,
                                height: MediaQuery.of(context).size.height * 0.22,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: background,
                                child: Column(
                                  children: [
                                    Text(
                                      'Générales',
                                      style: soustitregras(Colors.white),
                                    ),
                                    Text(
                                      '8 infractions',
                                      style: soustitre(Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.35,)
                  ],
                ),
              )
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 50,
        color: background,
        items: <Widget>[
          CircleAvatar(
            minRadius: 25,
            maxRadius: 25,
            backgroundColor: background,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
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
                Icon(
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
                Icon(
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
                Icon(
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
          //Handle button tap
        },
      ),
    );
  }
}
