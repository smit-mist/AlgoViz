import 'package:dsa_simulation/src/Utilities/address_maninter.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';

class HeapMainPage extends StatefulWidget {
  @override
  _HeapMainPageState createState() => _HeapMainPageState();
}

class _HeapMainPageState extends State<HeapMainPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    path = ['Home', 'DS', 'Trees'];
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, '/LinearNonLinearPage', (route) => false);
        return true;
      },
      child: BaseTemplate(
        body: Scaffold(
          appBar: appBar(context),
          body: Container(
            height: height,
            width: width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Tiles(
                  onPress: () {
                    addElement('Intro');
                    Navigator.of(context).pushNamed('/TreeIntro');
                  },
                  title: 'Introduction',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Insertion');
                    Navigator.of(context).pushNamed('/HeapInsertion');
                  },
                  title: 'Insertion',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Tiles(
                  onPress: () {
                    addElement('Deletion');
                    Navigator.of(context).pushNamed('/HeapDeletion');
                  },
                  title: 'Deletion',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
