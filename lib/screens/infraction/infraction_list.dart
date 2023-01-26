import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/infraction_model.dart';

import '../../widgets/list_card.dart';

class InfractionList extends StatefulWidget {
  const InfractionList({Key? key, required this.infractions, required this.categorie}) : super(key: key);
  final List<Infraction> infractions;
  final String categorie;

  @override
  State<InfractionList> createState() => _InfractionListState();
}

class _InfractionListState extends State<InfractionList> {


  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Image.asset(
              widget.categorie == 'Gros porteurs'
                  ? "assets/images/gp.png"
                  : widget.categorie == 'Véhicules légers'
                  ? "assets/images/vl.png"
                  : widget.categorie == 'Générales'
                  ? "assets/images/generale.png"
                  : "assets/images/motos.jpg",
            height: MediaQuery.of(context).size.height / 5.5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        for(int i = 0; i < widget.infractions.length; i++)
          for(int j = 0; j < widget.infractions[i].amendes!.length; j++)
            if(widget.infractions[i].amendes![i].categorie?.categorie == widget.categorie)
              ListCard(
                listTile: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      '$j',
                      style: soustitregras(background),
                    ),
                  ),
                  title: Text(
                    '${widget.infractions[j].description}',
                    style: soustitregras(Colors.white),
                  ),
                  subtitle: Text(
                    '${widget.infractions[j].reference}',
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
  }
}
