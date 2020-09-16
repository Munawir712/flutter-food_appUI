import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final foodItem;
  FoodDetail({this.foodItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54,),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.black54,), onPressed: (){})
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20, left: 40, right: 40  ),
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: FlatButton(
          textColor: Colors.white,
          onPressed: (){}, 
          child: Text('Buy Now')
        ),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  foodItem['name'],
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  foodItem['subName'],
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Container(
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(foodItem['imgUrl']),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money, color: Colors.deepOrange,),
                    Text(
                      foodItem == null ? 'price' : foodItem['price'],
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20
                      ), 
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[400],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: FlatButton(
                          textColor: Colors.white,
                          
                          onPressed: (){}, 
                          child: Icon(Icons.remove) 
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                     SizedBox(
                        width: 50,
                        child: FlatButton(
                          textColor: Colors.white,
                          onPressed: (){}, 
                          child: Icon(Icons.add) 
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/img/pizza.png')
                        )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/img/burger.png')
                        )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/img/salad.png')
                        )
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage('assets/img/burger.png')
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                
              ],
            ),
          ),
        ),
      )
    );
  }
}