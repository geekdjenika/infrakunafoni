import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:just_audio/just_audio.dart';

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

  final ScrollController _controller = ScrollController();

  //final AudioCache _player = AudioCache(prefix: 'assets/aud');
  final _player = AudioPlayer();

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
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: liste.length,
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
                    'Nombre d\'infraction : ${liste[index].infractions?.length}',
                    style: soustitre(Colors.white),
                  ),
                  trailing: InkWell(
                    onTap: () async {
                      await _player.setAsset('assets/aud/${liste[index].vocals?[0].vocal}');
                      _player.play();
                    },
                    child: const Icon(
                      CupertinoIcons.speaker_2_fill,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
