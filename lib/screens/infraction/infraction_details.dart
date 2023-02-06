import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:infrakunafoni/models/categorie_model.dart';
import 'package:infrakunafoni/models/infraction_model.dart';
import 'package:infrakunafoni/widgets/details_card.dart';

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
              Icon(
                Icons.more_vert_sharp,
                color: background,
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
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '#${widget.numero}',
                                style: soustitre(Colors.pink),
                              ),
                              const Icon(
                                Icons.tips_and_updates_outlined,
                                color: Colors.pink,
                              )
                            ],
                          ),
                          Text(
                            '${widget.infraction.description}',
                            style: soustitregras(Colors.black),
                          ),
                          Text(
                            'Amendes',
                            style: titregras(Colors.pink),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '${amendes[0].montant!.montant} ${amendes[0].montant!.devise}',
                            style: soustitregras(Colors.black),
                          ),
                          const Divider(color: Colors.pink,),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: Icon(
                              CupertinoIcons.speaker_2_fill,
                              color: Colors.pink,
                              size: 20,
                            ),
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
