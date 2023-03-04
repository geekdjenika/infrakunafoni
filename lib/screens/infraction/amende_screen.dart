import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:infrakunafoni/screens/auth/auth.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:infrakunafoni/services/amende_service.dart';
import 'package:infrakunafoni/widgets/my_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

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

  AmendeService amendeService = AmendeService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: amendeService.getAllAmende(),
      builder: (context, data) {
        if(data.hasError) {
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
                        onTap: () {
                          AwesomeDialog(
                              context: context,
                              closeIcon: const Icon(
                                  Icons.cancel_sharp
                              ),
                              dialogType: DialogType.noHeader,
                              body: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    for(int i = liste[index].infractions!.length - 1; i >= 0; i--)
                                      ListCard(
                                        listTile: ListTile(
                                          title: Text(liste[index].infractions![i].description!, style: soustitregras(Colors.white),),
                                          subtitle: Text(liste[index].infractions![i].reference!, style: soustitre(Colors.white),),
                                        ),
                                      )
                                  ],
                                ),
                              )
                          ).show();
                        },
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
                          style: titreliste(Colors.white),
                        ),
                        subtitle: Text(
                          liste[index].infractions!.length > 1
                            ? 'Infractions concernées : ${liste[index].infractions?.length}'
                            : 'Infraction concernée : ${liste[index].infractions?.length}',
                          style: soustitreliste(Colors.white),
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
                return Center(child: Lottie.asset("assets/json/loading.json", width: 50, height: 50));
              }
            },
          );
        } else if(data.hasData) {
          if(data.data!.isEmpty) {
            return Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Lottie.asset("assets/json/expire.json"),
                  Text("Votre session est expirée !", style: titregras(background),),

                  TextButton(
                      onPressed: () {
                        setState(() {

                        });
                      },
                      child: Text("Cliquer ici pour recharger !", style: soustitre(background),)),
                  Text('OU', style: titre(background),),
                  const SizedBox(height: 5,),
                  MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth())), text: "Connectez-vous")
                ],
              ),
            );
          } else {
            var liste = data.data as List<Amende>;
            //var liste = data.data as List<Amende>;
            return ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return ListCard(
                  listTile: ListTile(
                    onTap: () {
                      AwesomeDialog(
                          context: context,
                          closeIcon: const Icon(
                              Icons.cancel_sharp
                          ),
                          dialogType: DialogType.noHeader,
                          body: Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for(int i = liste[index].infractions!.length - 1; i >= 0; i--)
                                  ListCard(
                                    listTile: ListTile(
                                      title: Text(liste[index].infractions![i].description!, style: soustitregras(Colors.white),),
                                      subtitle: Text(liste[index].infractions![i].reference!, style: soustitre(Colors.white),),
                                    ),
                                  )
                              ],
                            ),
                          )
                      ).show();
                    },
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
                      style: titreliste(Colors.white),
                    ),
                    subtitle: Text(
                      liste[index].infractions!.length > 1
                          ? 'Infractions concernées : ${liste[index].infractions?.length}'
                          : 'Infraction concernée : ${liste[index].infractions?.length}',
                      style: soustitreliste(Colors.white),
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
          }
        } else {
          return Center(child: Lottie.asset("assets/json/loading.json", width: 50, height: 50));
        }
      },
    );
  }
}
