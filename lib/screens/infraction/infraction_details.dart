import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:infrakunafoni/models/categorie_model.dart';
import 'package:infrakunafoni/models/infraction_model.dart';
import 'package:infrakunafoni/widgets/details_card.dart';
import 'package:just_audio/just_audio.dart';

import '../../constants.dart';

class DetailsInfracion extends StatefulWidget {
  const DetailsInfracion({Key? key, required this.amendes, required this.infraction, required this.categorie, required this.numero}) : super(key: key);
  final List<Amende> amendes;
  final Infraction infraction;
  final int numero;
  final Categorie categorie;

  @override
  State<DetailsInfracion> createState() => _DetailsInfracionState();
}

class _DetailsInfracionState extends State<DetailsInfracion> {

  final _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                CupertinoIcons.back,
                color: background,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.more_vert_sharp,
                  color: background,
                ),
              )
            ],
            //pinned: true,
            backgroundColor: Colors.white,
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
                  child: DetailsCard(
                    color: Colors.white,
                    widget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#${widget.numero}',
                                style: soustitregras(Colors.pink),
                              ),
                              const Icon(
                                Icons.warning_amber,
                                color: Colors.pink,
                              )
                            ],
                          ),

                          Text(
                            '${categorie[0].categorie}',
                            style: titregras(background),
                          ),

                          Text(
                            '${widget.infraction.description}',
                            style: titre(Colors.black),
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Réference : ",
                                style: soustitregras(Colors.black),
                              ),
                              ExpandableText(
                                '${widget.infraction.reference}',
                                maxLines: 2,
                                expandText: 'plus',
                                collapseText: 'moins',
                                style: soustitre(Colors.black),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                              Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: background,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                    //borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Montant',
                                        style: soustitregras(background),
                                      ),
                                      Text(
                                        '${amendes[0].montant!.montant} ${amendes[0].montant!.devise}',
                                        style: titre(Colors.pink),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:  [
                              const Divider(color: Colors.pink),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onTap: () async {
                                    await _player.setAsset('assets/aud/${widget.infraction.vocals![0].vocal}');
                                    _player.play();
                                  },
                                  child: Container(
                                    width: 110,
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: background,
                                          width: 0.5,
                                          style: BorderStyle.solid
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          CupertinoIcons.speaker_2_fill,
                                          color: Colors.pink,
                                          size: 20,
                                        ),
                                        Text(
                                          'Écouter',
                                          style: titreliste(background),
                                        ),

                                      ],
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              )
          )
        ],
      ),
    );
  }
}
