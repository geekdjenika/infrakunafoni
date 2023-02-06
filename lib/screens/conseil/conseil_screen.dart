import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

import '../../widgets/my_card.dart';

class ConseilScreen extends StatefulWidget {
  const ConseilScreen({Key? key}) : super(key: key);

  @override
  State<ConseilScreen> createState() => _ConseilScreenState();
}

class _ConseilScreenState extends State<ConseilScreen> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      controller: _controller,
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
                    'To hide ki ffrvd jxnsjdsk jdsjksdskd,dl hudiiolx,l kdskdksjjzud idjic qgdghduzdudjcsbcscyy bhvhjsss csbdhdjd shsusujhide ki ffrvd jxnsjdsk jdsjksdskd,dl hudiiolx,l kdskdksjjzud idjic qgdghduzdudjcsbcscyy bhvhjsss csbdhdjd shsusujxskxksx',
                    style: soustitre(Colors.black),
                    maxLines: 4,
                  ),
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
              ),
            ),
          ),
        );
      },
    );
  }
}
