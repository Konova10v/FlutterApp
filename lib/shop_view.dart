import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'model/collection_model.dart';
import 'model/carousel_model.dart';


class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundShop,
      body: Container(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavBarShop(),

              CollectionsView(),

              CarouselCollection(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarShop extends StatelessWidget {
  const NavBarShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 40, 16, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(onPressed: (){

          },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFebf0fc),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: Icon(Icons.menu_rounded, color: kButtonShopColor,)),

          Text('H&M',
            style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25,),
          ),

          ElevatedButton(onPressed: (){

          },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFebf0fc),
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
              child: Icon(Icons.search_outlined, color: kButtonShopColor,))
        ],
      ),
    );
  }
}

class CollectionsView extends StatelessWidget {
  List<Colleections> test = [
    Colleections('man.jpg', 'Man'),
    Colleections('woman.jpg', 'Woman'),
    Colleections('kid.jpg', 'Kids'),
    Colleections('baby.jpg', 'Babys'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Collections',
                style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25,),
              ),

              IconButton(onPressed: (){}, icon: Image.asset('assets/filter.png', color: kOrangeColor,)),
            ],
          ),

          SizedBox(height: 20,),

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 30, // set spacing here
                children: <Widget>[
                  for(var item in test) CollectionCell(image: item.image, name: item.name)
                ],
              )
          ),
        ],
      ),
    );
  }
}

class CollectionCell extends StatelessWidget {
  final String image;
  final String name;

  const CollectionCell({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { print("Container was tapped"); },
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/$image")
                  )
              )),

          Text(name,
            style: TextStyle(fontFamily: 'JosefinSansMedium', fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CarouselCollection extends StatefulWidget {
  @override
  State<CarouselCollection> createState() => _CarouselCollectionState();
}

class _CarouselCollectionState extends State<CarouselCollection> {
  List<CarouselModel> test = [
    CarouselModel('model.jpg', 'Hoodie Rose', '295'),
    CarouselModel('woman.jpg', 'Hoodie Rose', '305'),
    CarouselModel('kid.jpg', 'Hoodie Rose', '305'),
  ];

  late PageController _pageController;

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
              itemCount: test.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
                },
              itemBuilder: (context, pagePosition) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    image: DecorationImage(
                        image:  AssetImage('assets/${test[pagePosition].image}'),
                        fit: BoxFit.fill
                    ),
                  ),
                );
              }),
        ),

        SizedBox(height: 20,),
        Text('${test[activePage].name}',
          style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25,),
        ),

        SizedBox(height: 10,),
        Text('\$ ${test[activePage].price}',
          style: TextStyle(fontFamily: 'JosefinSansBold', fontSize: 25, color: kOrangeColor),
        ),
      ],
    );
  }
}
