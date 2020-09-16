import 'package:flutter/material.dart';
import 'package:food_App_UI/ui/food_detail.dart';

class FoodItem extends StatelessWidget {
  final foodItem;
  FoodItem({this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0), 
      width: 170,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0)
      ), 
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => FoodDetail(foodItem: foodItem,))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              _title(),
              SizedBox(height: 5,),
              _subTitle(),
              SizedBox(height: 5,),
              _image(),
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.attach_money, size: 20, color: Colors.deepOrange,),
                  _price(),
                  Spacer(flex: 1,),
                  SizedBox(
                    width: 60,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.deepOrange[400],
                      textColor: Colors.white,
                      onPressed: (){}, 
                      child: Icon(Icons.add)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {

    return Text(
      foodItem == null ? 'FoodName' : foodItem['name'],
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _subTitle() {
    return Text(
      foodItem == null ? 'subName' :foodItem['subName'],
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 12
      ),
    );
  }

  Widget _image() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: foodItem == null ? AssetImage('assets/img/pizza.png') : NetworkImage(foodItem['imgUrl']),
          fit: BoxFit.cover
        )
      )
    );
  }

  Widget _price() {
    return Text(
      foodItem == null ? 'price' : foodItem['price'], 
      overflow: TextOverflow.ellipsis, 
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500
      ),
    );
  }




}
