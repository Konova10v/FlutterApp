import 'dart:ffi';

import 'package:design/colors.dart';
import 'package:flutter/material.dart';

class ItemDetailView extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ItemDetailView({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundShop,
      body: new Stack(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage(image), fit: BoxFit.cover,),
            ),
          ),
          NavBarShop(),

          DescriptionItem(name: name, price: price,),
        ],
      )
    );
  }
}

class NavBarShop extends StatefulWidget {

  const NavBarShop({Key? key}) : super(key: key);

  @override
  State<NavBarShop> createState() => _NavBarShopState();
}

class _NavBarShopState extends State<NavBarShop> {
  bool fullButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 60, 16, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFebf0fc),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: Icon(Icons.arrow_back, color: kOrangeColor,)),

          if (fullButton) ...[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
              color: kStackButtonColor,
              borderRadius: new BorderRadius.all(Radius.circular(40.0))
          ),
              child: Wrap(
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      fullButton = false;
                    });
                  },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFebf0fc),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Icon(Icons.menu, color: kButtonShopColor,)),

                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        primary: kStackButtonColor,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Icon(Icons.compare_arrows, color: Colors.white,)),

                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        primary: kStackButtonColor,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Icon(Icons.heart_broken, color: Colors.white,)),

                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        primary: kStackButtonColor,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Icon(Icons.comment_rounded, color: Colors.white,)),

                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        primary: kStackButtonColor,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                      child: Icon(Icons.ios_share, color: Colors.white,)),
                ],
              ),
            ),
          ] else ...[
            ElevatedButton(onPressed: () {
              setState(() {
                fullButton = true;
              });
            },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFebf0fc),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                ),
                child: Icon(Icons.menu, color: kButtonShopColor,)),
          ],
        ],
      ),
    );
  }
}

class DescriptionItem extends StatefulWidget {
  final String name;
  final String price;

  DescriptionItem({required this.name, required this.price});

  @override
  State<DescriptionItem> createState() => _DescriptionItemState();
}

class _DescriptionItemState extends State<DescriptionItem> {
  late String selectColor = "b74093";
  late String selectSize = 'XL';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 60, 16, 40),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 1.6,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,
                style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25),
              ),

              Text('\$ ${widget.price}',
                style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25, color: kOrangeColor),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Color', style: TextStyle(
                  fontFamily: 'JosefinSansMedium',
                  fontSize: 25,
                  color: Colors.grey),
              ),

              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor(selectColor)),
              ),

              DropdownButton<String>(
                items: <String>[
                  'eca965',
                  '267e7f',
                  '5778e3',
                  'f76732'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor(value)),
                    ),
                  );
                }).toList(),
                onChanged: (color) {
                  setState(() {
                    selectColor = color!;
                  });
                },
              ),

              Text('Size', style: TextStyle(
                  fontFamily: 'JosefinSansMedium',
                  fontSize: 25,
                  color: Colors.grey),
              ),

              Text(selectSize, style: TextStyle(
                  fontFamily: 'JosefinSansBold',
                  fontSize: 25,
                  color: kButtonShopColor),
              ),

              DropdownButton<String>(
                items: <String>[
                  'S',
                  'M',
                  'L',
                  'XL'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(
                        fontFamily: 'JosefinSansBold',
                        fontSize: 25,
                        color: kButtonShopColor),
                    ),
                  );
                }).toList(),
                onChanged: (size) {
                  setState(() {
                    selectSize = size!;
                  });
                },
              )
            ],
          ),

          Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
            style: TextStyle(fontFamily: 'JosefinSansMedium', fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


