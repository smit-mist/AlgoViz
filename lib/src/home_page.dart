import 'package:dsa_simulation/src/Utilities/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:dsa_simulation/route_generator.dart';
import 'package:slimy_card/slimy_card.dart';
import '../src/constants.dart';
import 'package:dsa_simulation/src/Utilities/widgets.dart';
import 'package:dsa_simulation/src/Utilities/address_maninter.dart';

double max(double a, double b) {
  if (a > b) return a;
  return b;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          color: Colors.black,
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              SlimyCard(
                color: kThemeColor,
                width: width * 0.85,
                topCardHeight: max(150, height * 0.1),
                bottomCardHeight: max(200,height*0.15),
                borderRadius: 20,
                topCardWidget: MainButton(
                  onPress: () {
                    addElement('DS');
                    Navigator.of(context).pushNamed('/LinearNonLinearPage');
                  },
                  title: 'DS',
                ),
                bottomCardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Array',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Linked List',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Queue',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'Stack',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.05,),
              SlimyCard(
                color: kThemeColor,
                width: width * 0.85,
                topCardHeight: max(150, height * 0.1),
                bottomCardHeight: max(200,height*0.15),
                borderRadius: 20,
                topCardWidget: MainButton(
                  onPress: () {
                    addElement('ALGO');
                    Navigator.of(context).pushNamed('/LinearNonLinearPage');
                  },
                  title: 'ALGO',
                ),

                bottomCardWidget: Container(
                  height: max(200,height*0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Searching',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Sorting',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        'Dynamic Programming',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.2,),
            ],
          ),
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String title;
  final Function onPress;
  const MainButton({this.title, this.onPress});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: w * 0.85,
        height: max(h * 0.1, 150),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        )),
      ),
    );
  }
}
