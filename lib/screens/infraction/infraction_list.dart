import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/infraction_model.dart';

import '../../widgets/list_card.dart';

class InfractionList extends StatefulWidget {
  const InfractionList({Key? key, required this.categorie}) : super(key: key);

  final String categorie;

  @override
  State<InfractionList> createState() => _InfractionListState();
}

class _InfractionListState extends State<InfractionList> {

  Future<List<Infraction>> readJson() async {
    final String response = widget.categorie == 'Gros porteurs'
        ? await rootBundle.loadString('assets/raw/Infractiongp.json')
        : widget.categorie == 'Véhicules légers'
        ? await rootBundle.loadString('assets/raw/Infractionvl.json')
        : widget.categorie == 'Générales'
        ? await rootBundle.loadString('assets/raw/Infractiongnrl.json')
        : await rootBundle.loadString('assets/raw/Infractionmto.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Infraction.fromJson(e)).toList(growable: true);
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, data) {
        if(data.hasError) {
          return Center(child: Text('${data.error}', style: titregras(Colors.black),),);
        } else if(data.hasData) {
          var liste = data.data as List<Infraction>;
          return Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset(
                  widget.categorie == 'Gros porteurs'
                      ? "assets/img/gp.png"
                      : widget.categorie == 'Véhicules légers'
                      ? "assets/img/vl.png"
                      : widget.categorie == 'Générales'
                      ? "assets/img/generale.png"
                      : "assets/img/motos.jpg",
                  height: MediaQuery.of(context).size.height / 5.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              for(int i = 0; i < liste.length; i++)
                ListCard(
                  listTile: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 20,
                      minRadius: 20,
                      backgroundColor: Colors.white,
                      child: Text(
                        '${i+1}',
                        style: soustitregras(background),
                      ),
                    ),
                    title: Text(
                      '${liste[i].description}',
                      style: soustitregras(Colors.white),
                    ),
                    subtitle: Text(
                      '${liste[i].reference}',
                      style: soustitre(Colors.white),
                    ),
                    trailing: const Icon(
                      CupertinoIcons.speaker_2_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.35,)
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
