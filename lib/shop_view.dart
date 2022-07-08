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
      backgroundColor: Colors.white,
      body: Container(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NavBarShop(),

              CollectionsView(),

              MainScreenCollection()
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

class MainScreenCollection extends StatefulWidget {
  @override
  State<MainScreenCollection> createState() => _MainScreenCollectionState();
}

class _MainScreenCollectionState extends State<MainScreenCollection> {
  List<CarouselModel> test = [
    CarouselModel('', '', ''),
  ];

  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
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
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child:   PageView.builder(
          itemCount: images.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
            return Container(
              margin: EdgeInsets.all(10),
              child: Image.network(images[pagePosition],fit: BoxFit.cover,),
            );
          }),
    );
  }
}



