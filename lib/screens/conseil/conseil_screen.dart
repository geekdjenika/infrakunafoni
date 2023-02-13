import 'dart:convert';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/conseil_model.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/my_card.dart';

class ConseilScreen extends StatefulWidget {
  const ConseilScreen({Key? key}) : super(key: key);

  @override
  State<ConseilScreen> createState() => _ConseilScreenState();
}

class _ConseilScreenState extends State<ConseilScreen> {

  final ScrollController _controller = ScrollController();
  Future<List<Conseil>> readJson() async {
    final String response =await rootBundle.loadString('assets/raw/Conseil.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Conseil.fromJson(e)).toList(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readJson(),
      builder: (context, data) {
        if(data.hasError) {
          return Center(child: Text('${data.error}', style: titregras(Colors.black),),);
        } else if(data.hasData) {
          var liste = data.data as List<Conseil>;
          return ListView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: MyCard(
                  color: Colors.white,
                  widget: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${index+1}',
                              style: soustitre(Colors.pink),
                            ),
                            const Icon(
                              Icons.tips_and_updates_outlined,
                              color: Colors.pink,
                            )
                          ],
                        ),
                        ExpandableText(
                          expandText: 'plus',
                          collapseText: 'moins',
                          '${liste[index].conseil}',
                          style: soustitre(Colors.black),
                          maxLines: 4,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Divider(color: background,),
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
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Lottie.asset("assets/json/loading.json"));
        }
      },
    );
  }
}
