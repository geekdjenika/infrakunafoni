import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/extensions/diacritics.dart';
import 'package:infrakunafoni/models/categorie_model.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:infrakunafoni/services/categorie_service.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';


class InfractionScreen extends StatefulWidget {
  const InfractionScreen({Key? key}) : super(key: key);

  @override
  State<InfractionScreen> createState() => _InfractionScreenState();
}

class _InfractionScreenState extends State<InfractionScreen> {

  Future<List<Categorie>> readJson() async {
    final String response = await rootBundle.loadString('assets/raw/Categorie.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Categorie.fromJson(e)).toList(growable: true);
  }

  CategorieService categorieService = CategorieService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categorieService.getAllCategorie(),
      builder: (context, data) {
        if(data.hasError) {
          return FutureBuilder(
              future: readJson(),
              builder: (context, data) {
                if(data.hasError) {
                  return Center(child: Text('${data.error}', style: titregras(Colors.black),),);
                } else if(data.hasData) {
                  var liste = data.data as List<Categorie>;
                  return Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.spaceAround,
                      children: [
                        for(int i = 0; i < liste.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => {
                                useindex = true,
                                for(int j = 0; j < liste[i].amendes!.length; j++) {
                                  infractions.addAll(liste[i].amendes![j].infractions!),
                                  amendes.add(liste[i].amendes![j])
                                },
                                categorie.add(liste[i]),
                                print(categorie[0].categorie!.withoutDiacritics),
                                print("-------------------------obj-----------------------"),
                                print(liste[i].categorie!.withoutDiacritics),
                                selectedPageIndex = 4,
                                Navigator.pop(context),
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Accueil()))
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
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                      child: Image.asset(
                                        "assets/img/${liste[i].categorie!.withoutDiacritics}.png",
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
                                              '${liste[i].categorie!.withoutDiacritics}',
                                              style: soustitregras(Colors.white),
                                            ),
                                            Text(
                                              liste[i].amendes!.length > 1
                                                  ? '${liste[i].amendes![0].infractions!.length + liste[i].amendes![1].infractions!.length} infractions'
                                                  : '${liste[i].amendes![0].infractions!.length} infractions',
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
                      ]
                  );
                } else {
                  return Center(child: Lottie.asset("assets/json/loading.json", width: 50, height: 50));
                }
              }
          );
        } else if(data.hasData) {
          if(data.data!.isEmpty) {
            return Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Lottie.asset("assets/json/empty.json"),
                  Text("Pas d'infraction !", style: titregras(background),),

                  TextButton(
                      onPressed: () {
                        setState(() {

                        });
                      },
                      child: Text("Cliquer ici pour recharger !", style: soustitre(background),)),
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
                ],
              ),
            );
          } else {
            var liste = data.data as List<Categorie>;
            //var liste = data.data as List<Categorie>;
            return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceAround,
                children: [
                  for(int i = 0; i < liste.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => {
                          useindex = true,
                          for(int j = 0; j < liste[i].amendes!.length; j++) {
                            infractions.addAll(liste[i].amendes![j].infractions!),
                            amendes.add(liste[i].amendes![j])
                          },
                          categorie.add(liste[i]),
                          print(categorie[0].categorie!.withoutDiacritics),
                          print("-------------------------obj-----------------------"),
                          print(liste[i].categorie!.withoutDiacritics),
                          selectedPageIndex = 4,
                          Navigator.pop(context),
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Accueil()))
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
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                                child: Image.asset(
                                  liste[i].id == 1
                                  ? "assets/img/Gros porteurs.png"
                                  : liste[i].id == 2
                                      ? "assets/img/Véhicules légers.png"
                                  : liste[i].id == 3
                                    ? "assets/img/Motos.png"
                                  : "assets/img/Générales.png",
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
                                        '${liste[i].categorie!.withoutDiacritics}',
                                        style: soustitregras(Colors.white),
                                      ),
                                      Text(
                                        liste[i].amendes!.length > 1
                                            ? '${liste[i].amendes![0].infractions!.length + liste[i].amendes![1].infractions!.length} infractions'
                                            : '${liste[i].amendes![0].infractions!.length} infractions',
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
                ]
            );
          }
        } else {
          return Center(child: Lottie.asset("assets/json/loading.json", width: 50, height: 50));
        }
      },
    );
  }

}
