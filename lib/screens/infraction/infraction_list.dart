import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:infrakunafoni/models/infraction_model.dart';
import 'package:infrakunafoni/screens/infraction/infraction_details.dart';
import 'package:just_audio/just_audio.dart';

import '../../widgets/list_card.dart';

class InfractionList extends StatefulWidget {
  const InfractionList({Key? key, required this.infractions, this.amendes}) : super(key: key);

  final List<Infraction> infractions;
  final List<Amende>? amendes;
  //final Categorie categorie;

  @override
  State<InfractionList> createState() => _InfractionListState();
}

class _InfractionListState extends State<InfractionList> {

  final _player = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: categorie.length == 0
            ? null
            : Image.asset(
              categorie[0].id == 1
              ? "assets/img/Gros porteurs.png"
                  : categorie[0].id == 2
              ? "assets/img/Véhicules légers.png"
                  : categorie[0].id == 3
              ? "assets/img/Motos.png"
                  : "assets/img/Générales.png",
                height: MediaQuery.of(context).size.height / 5.5,
                width: double.infinity,
                fit: BoxFit.cover,
                ),
              ),

        for(int i = 0; i < infractions.length; i++)
          ListCard(
            listTile: ListTile(
              onTap: () {
                //categorie.add(categorie[0]);*
                if(amendes != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsInfracion(amendes: amendes, infraction: infractions[i], categorie : categorie[0], numero: i+1,)));
                }

              },
              leading: CircleAvatar(
                maxRadius: 20,
                minRadius: 20,
                backgroundColor: Colors.white,
                child: Text(
                  '${i+1}',
                  style: soustitregras(background),
                ),
              ),
              title: ExpandableText(
                '${infractions[i].description}',
                expandText: 'plus',
                collapseText: 'moins',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                linkColor: Colors.white,
                style: titreliste(Colors.white),
              ),
              subtitle: ExpandableText(
                '${infractions[i].reference}',
                expandText: 'plus',
                collapseText: 'moins',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                maxLines: 2,
                linkColor: Colors.white,
                style: soustitreliste(Colors.white),
              ),
              trailing: InkWell(
                onTap: () async {
                  await _player.setAsset('assets/aud/${infractions[i].vocals?[0].vocal}');
                  _player.play();
                },
                child: const Icon(
                  CupertinoIcons.speaker_2_fill,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
