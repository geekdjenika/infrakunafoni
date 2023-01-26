import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/list_card.dart';
import 'package:infrakunafoni/constants.dart';

class AmendeScreen extends StatefulWidget {
  const AmendeScreen({Key? key}) : super(key: key);

  @override
  State<AmendeScreen> createState() => _AmendeScreenState();
}

class _AmendeScreenState extends State<AmendeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
