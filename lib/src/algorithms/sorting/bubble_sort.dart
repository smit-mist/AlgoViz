import 'package:dsa_simulation/src/algorithms/sorting/sort_main.dart';
import 'package:dsa_simulation/src/utilities/address_maninter.dart';
import 'package:dsa_simulation/src/utilities/base_template.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class BubbleSort extends StatefulWidget {
  @override
  _BubbleSortState createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {
  List<int> toSort = [10, 7, 6, 4, 8, 1, 3, 4, 9];
  int mx = 10;
  List<Widget> toBuild = [];
  List<Offset> position = [];
  @override
  Widget build(BuildContext context) {
    path = ['Home', 'ALGO', 'Sorting', 'Bubble'];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double widthOfContainer = max(20, (w * 0.8) / toSort.length);
    double padding =
        (w * 0.9 - widthOfContainer * toSort.length) / (toSort.length - 1);

    double dx = padding / 2;
    for (int i = 0; i < toSort.length; i++) {
      if (position.length == i) position.add(Offset(dx, h * 0.2));
      dx += widthOfContainer * 1.5;
      if (toBuild.length == i) {
        toBuild.add(Element(
          value: toSort[i],
          mx: mx,
          width: widthOfContainer,
          posx: position[i].dx,
          posy: position[i].dy,
        ));
      } else {
        toBuild[i] = Element(
          value: toSort[i],
          mx: mx,
          width: widthOfContainer,
          posx: position[i].dx,
          posy: position[i].dy,
        );
      }
    }

    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => SortMain()));
      },
      child: BaseTemplate(
        body: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                for (int i = 1; i < toSort.length; i++) {
                  if (toSort[i] < toSort[i - 1]) {
                    position[i] =
                        Offset(position[i].dx, position[i].dy - h * 0.1);
                    position[i - 1] = Offset(
                        position[i - 1].dx, position[i - 1].dy + h * 0.1);
                    double tem = position[i-1].dx;
                    position[i-1] = Offset(position[i].dx,position[i-1].dy);
                    position[i] = Offset(tem,position[i].dy);
                    int here = toSort[i];
                    toSort[i] = toSort[i-1];toSort[i-1] = here;
                    print('inside');
                    break;
                  }
                }
              });
            },
          ),
          appBar: AppBar(
            leading: ClipRect(
              child: MaterialButton(
                child: Icon(Icons.menu_rounded),
                onPressed: () {
                  toggle();
                },
                splashColor: Colors.black,
              ),
            ),
            backgroundColor: kThemeColor,
            iconTheme: IconThemeData(color: Colors.white),
            title: Center(
              child: Container(
                width: w * 0.9,
                height: 30,
                child: AddressBar(),
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            width: w,
            height: h * 0.9,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Container(
                    width: w,
                    height: h * 0.5,
                    child: Center(
                      child: Stack(
                        children: toBuild,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

double min(double i, double d) {
  if (i < d) return i;
  return d;
}

class Element extends StatefulWidget {
  int value;
  int mx;
  double posx;
  double width;
  double posy;
  Element({this.posx, this.posy, this.value, this.mx, this.width});
  @override
  _ElementState createState() => _ElementState();
}

class _ElementState extends State<Element> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      top: widget.posy,
      left: widget.posx,
      duration: Duration(milliseconds: 100),
      child: SizedBox(
        height: h * 0.2,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: widget.width,
            height: max(15, (widget.value / widget.mx) * 100),
            color:
                Colors.red.withOpacity(1.0 - (widget.value / widget.mx) * 0.75),
            child: Center(child: Text(widget.value.toInt().toString())),
          ),
        ),
      ),
    );
  }
}
