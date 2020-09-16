import 'package:flutter/material.dart';
import 'package:food_App_UI/ui/food_item.dart';

class HomeScreen extends StatelessWidget {

  List foodList = [
    {
      'pizza': [
        {
          'name': 'Chicken Pizza', 
          'subName': 'Pizza with cheese', 
          'price' : '9.5', 
          'imgUrl':'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnR8yzhL-H4V_OflmlNZIpEjST4gjIgyVkSg&usqp=CAU'
        },
        {
          'name': 'Pizza', 
          'subName': 'pizza bisa', 
          'price' : '8.0', 
          'imgUrl':'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnR8yzhL-H4V_OflmlNZIpEjST4gjIgyVkSg&usqp=CAU'
        },
      ]
    },
    {
      'hamburger' : [
        {
          'name': 'Big Burger', 
          'subName': 'Burger jumbo', 
          'price' : '8.0',
          'imgUrl':'https://wallpapercave.com/wp/wp4062001.jpg'
        },
        {
          'name': 'Odading', 
          'subName': 'Rasanya anjing banget',
          'price' : '4.5', 
          'imgUrl':'https://www.resepkuerenyah.com/wp-content/uploads/2015/10/resep-cara-membuat-kue-odading.jpg'
        },
      ]
    },
    {
      'salad': [
        {
          'name': 'Italian Salad', 
          'subName': 'how tasty',
          'price' : '5.0', 
          'imgUrl':'https://www.acouplecooks.com/wp-content/uploads/2019/05/Chopped-Salad-001_1-225x225.jpg'
        },
        {
          'name': 'Green Salad', 
          'subName': 'Classic greek greed salad', 
          'price' : '4.5',
          'imgUrl':'https://www.olivetomato.com/wp-content/uploads/2019/12/Green-salad-with-feta.jpeg'
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black54,
            ),
            onPressed: () {}),
        actions: [
          IconButton(icon: Icon(Icons.card_travel, color: Colors.black54,), onPressed: (){})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's eat",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Healthy Food",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30,),
              _searchItem(),
              SizedBox(height: 30,),
              _tabBarFood(),
              SizedBox(height: 30,),
              Text(
                "Popular Food",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30,),
              _popularFoodList(),

              SizedBox(height: 20,),
              Text(
                "News Food",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _searchItem() {
    return Builder(
      builder: (context) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(6)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Icon(Icons.search, size: 20, ),
                SizedBox(width: 5,),
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search food',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tabBarFood() {
    return TabBar(
      labelPadding: EdgeInsets.all(3.0),
      isScrollable: true,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.deepOrange[400]
      ),
      tabs: [
        _tabFood(text: 'Pizza', icon: Image.asset('assets/img/pizza.png')),
        _tabFood(text: 'Hamburger', icon: Image.asset('assets/img/burger.png')),
        _tabFood(text: 'Salad', icon: Image.asset('assets/img/salad.png'))
      ]
    );
  }

  Tab _tabFood({String text, Widget icon}){
    return Tab(
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.deepOrange[400], width: 1)
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 8,),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Widget _popularFoodList() {
    return Builder(
      builder:(context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: foodList[0]['pizza'].length,
                itemBuilder: (context, index) {
                  var x = foodList[0]['pizza'][index];
                  return FoodItem(foodItem: x,);
                }
              ),
              //page2
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList[1]['hamburger'].length,
                  itemBuilder: (context, index) {
                    var x = foodList[1]['hamburger'][index];
                    return FoodItem(foodItem: x,);
                  }
                )
              ),
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList[2]['salad'].length,
                  itemBuilder: (context, index) {
                    var x = foodList[2]['salad'][index];
                    return FoodItem(foodItem: x,);
                  }
                )
              ),
            ],
          ),
        );
      }
    );
  }



}
