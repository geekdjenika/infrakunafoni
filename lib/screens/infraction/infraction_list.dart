import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/infraction_model.dart';

import '../../widgets/list_card.dart';

class InfractionList extends StatefulWidget {
  const InfractionList({Key? key, required this.infractions}) : super(key: key);

  final List<Infraction> infractions;

  @override
  State<InfractionList> createState() => _InfractionListState();
}

class _InfractionListState extends State<InfractionList> {


  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              for(int i = 0; i < infractions.length; i++)
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
                      '${infractions[i].description}',
                      style: soustitregras(Colors.white),
                    ),
                    subtitle: Text(
                      '${infractions[i].reference}',
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
