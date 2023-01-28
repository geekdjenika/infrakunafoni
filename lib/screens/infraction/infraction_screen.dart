import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/screens/home.dart';

import '../../constants.dart';
import '../../models/infraction_model.dart';


class InfractionScreen extends StatefulWidget {
  const InfractionScreen({Key? key}) : super(key: key);

  @override
  State<InfractionScreen> createState() => _InfractionScreenState();
}

class _InfractionScreenState extends State<InfractionScreen> {

  List<Infraction> readJson(String categorie) async {
    final String response = categorie == 'Gros porteurs'
        ? await rootBundle.loadString('assets/raw/Infractiongp.json')
        : categorie == 'Véhicules légers'
        ? await rootBundle.loadString('assets/raw/Infractionvl.json')
        : categorie == 'Générales'
        ? await rootBundle.loadString('assets/raw/Infractiongnrl.json')
        : await rootBundle.loadString('assets/raw/Infractionmto.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Infraction.fromJson(e)).toList(growable: true);
  }
   List<Infraction> maliste = readJson('Véhicules légers') as List<Infraction>;



  @override
  Widget build(BuildContext context) {



      /*Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 5,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/vl.png",
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 7,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/motos.jpg",
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 4,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/gp.png",
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 6,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/generale.png",
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
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.12,)
      ],
    );*/
  }
  FutureBuilder lecture(BuildContext context, String cat){
    return FutureBuilder(
      future: readJson(cat),
      builder:(context, data) {
        if(data.hasError) {
          return Center(child: Text('${data.error}', style: titregras(Colors.black),),);
        } else if(data.hasData) {
          var liste = data.data as List<Infraction>;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => {
                useindex = true,
                selectedPageIndex = 5,
                Navigator.pop(context),
                Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
              },
              child: Container(
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      )
                    ]
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                      child: Image.asset(
                        cat == "Véhicules légers"
                            ? "assets/img/vl.png"
                            : cat == "Gros porteurs"
                            ? "assets/img/gp.png"
                            : cat == "Motos"
                            ? "assets/img/motos.jpg"
                            : "assets/img/generale.png",
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
                              '$cat',
                              style: soustitregras(Colors.white),
                            ),
                            Text(
                              cat.length < 1 ? '${cat.length} infraction' : '${cat.length} infractions',
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
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      }, );
  }

}

