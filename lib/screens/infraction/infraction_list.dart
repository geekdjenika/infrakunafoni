
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
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
                maxLines: 1,
                linkColor: Colors.white,
                style: soustitreliste(Colors.white),
              ),
              trailing: const Icon(
                CupertinoIcons.speaker_2_fill,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
      ],
    );
  }
}
