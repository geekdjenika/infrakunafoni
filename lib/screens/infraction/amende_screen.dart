import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/models/amende_model.dart';

import '../../widgets/list_card.dart';
import 'package:infrakunafoni/constants.dart';

class AmendeScreen extends StatefulWidget {
  const AmendeScreen({Key? key}) : super(key: key);

  @override
  State<AmendeScreen> createState() => _AmendeScreenState();
}

class _AmendeScreenState extends State<AmendeScreen> {

  Future<List<Amende>> readJson() async {
    final String response =await rootBundle.loadString('assets/raw/Amende.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Amende.fromJson(e)).toList(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, data) {
        if(data.hasError) {
          return Center(child: Text('${data.error}', style: titregras(Colors.black),),);
        } else if(data.hasData) {
          var liste = data.data as List<Amende>;
          return ListView.builder(
            itemCount: liste == null ? 0 : liste.length,
            itemBuilder: (context, index) {
              return ListCard(
                listTile: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${index+1}',
                      style: soustitregras(background),
                    ),
                  ),
                  title: Text(
                    '${liste[index].montant?.montant} ${liste[index].montant?.devise}',
                    style: soustitregras(Colors.white),
                  ),
                  subtitle: Text(
                    '${liste[index].categorie?.categorie}',
                    style: soustitre(Colors.white),
                  ),
                  trailing: const Icon(
                    CupertinoIcons.speaker_2_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
      /*Column(
      children: [
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '1',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '2',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '3',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '4',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '5',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '6',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '7',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '8',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
              style: soustitre(Colors.white),
            ),
            trailing: const Icon(
              CupertinoIcons.speaker_2_fill,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        ListCard(
          listTile: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              minRadius: 20,
              backgroundColor: Colors.white,
              child: Text(
                '9',
                style: soustitregras(background),
              ),
            ),
            title: Text(
              "300 F",
              style: soustitregras(Colors.white),
            ),
            subtitle: Text(
              'réference : Article 76',
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
    );*/
  }
}
