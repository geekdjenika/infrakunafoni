import 'package:flutter/material.dart';
import 'package:infrakunafoni/screens/home.dart';

import '../../constants.dart';

class InfractionScreen extends StatefulWidget {
  const InfractionScreen({Key? key}) : super(key: key);

  @override
  State<InfractionScreen> createState() => _InfractionScreenState();
}

class _InfractionScreenState extends State<InfractionScreen> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 5,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/vl.png",
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: background,
                      child: Column(
                        children: [
                          Text(
                            'Véhicules légers',
                            style: soustitregras(Colors.white),
                          ),
                          Text(
                            '24 infractions',
                            style: soustitre(Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 7,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/motos.jpg",
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: background,
                      child: Column(
                        children: [
                          Text(
                            'Motos',
                            style: soustitregras(Colors.white),
                          ),
                          Text(
                            '27 infractions',
                            style: soustitre(Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 4,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/gp.png",
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: background,
                      child: Column(
                        children: [
                          Text(
                            'Gros porteurs',
                            style: soustitregras(Colors.white),
                          ),
                          Text(
                            '15 infractions',
                            style: soustitre(Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => {
              useindex = true,
              selectedPageIndex = 6,
              Navigator.pop(context),
              Navigator.push(context, MaterialPageRoute(builder: (context) => Accueil()))
            },
            child: Container(
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18)),
                    child: Image.asset(
                      "assets/img/generale.png",
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: background,
                      child: Column(
                        children: [
                          Text(
                            'Générales',
                            style: soustitregras(Colors.white),
                          ),
                          Text(
                            '8 infractions',
                            style: soustitre(Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.12,)
      ],
    );
  }
}
