import 'package:flutter/material.dart';
import 'package:tamwink/product_detail.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Directionality( textDirection: TextDirection.rtl,
    child:
      Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child:
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('دقيق', '8 جنية', 'assets/pic1.jpg',
                    false, false, context),
                _buildCard('مكرونة', '6 جنية ', 'assets/pic4.jpg',
                    true, false, context),
                _buildCard('سكر', '11 جنية ',
                    'assets/pic2.jpg', false, true, context),
                _buildCard('أرز', '10 جنية ', 'assets/pic3.jpg',
                    false, false, context)
              ],
            ),
          ),
          SizedBox(height: 15.0)
        ],
      ),
    ),
      );
  }
  Widget _buildCard (String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(
                assetPath: imgPath,
                productprice:price,
                productname: name

            )
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        isFavorite
                            ? Icon(Icons.favorite, color: Colors.orange[900])
                            : Icon(Icons.favorite_border,
                            color: Colors.orange[900])
                      ])),
              Hero(
                  tag: imgPath,
                  child: Container(
                      height: 75.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain)))),
              SizedBox(height: 7.0,),
              Text(price,
                  style: TextStyle(
                      color: Colors.orange[900],
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Color(0xFFEBEBEB), height: 1.0)),

            ],
          ),
        ),
      ),
    );
  }
}