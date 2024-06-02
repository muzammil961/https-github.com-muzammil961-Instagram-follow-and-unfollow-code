
import 'package:flutter/material.dart';


import 'model.dart';

class Follow_Screen extends StatefulWidget {
  const Follow_Screen({super.key});

  @override
  State<Follow_Screen> createState() => _Follow_ScreenState();
}

class _Follow_ScreenState extends State<Follow_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('    Following', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20 , left:  20),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount:  usersList.length,
            itemBuilder: (context , index) {
              User user = usersList[index];
              return playersList(user);
            }),
      ),
    );
  }
  playersList(User user) {
    return Padding(padding: EdgeInsets.only( right:4 , left:  4, bottom: 10),
      child: Container(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(user.imageUrl, fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text(user.name, style: TextStyle( fontSize: 18),),
                    ],
                  )
                ],
              ),
              Container(
                height: 40,

                child: MaterialButton(
                  color : user.isFollowed ? Colors.deepOrange : Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){
                    setState(() {
                      user.isFollowed = !user.isFollowed ;
                    });

                  },
                  child: Text(user.isFollowed? 'Unfollow' : 'Follow' ,style: TextStyle(color: Colors.white),),

                ),

              )
            ],
          ),
        ),
      ),

    );
  }
}
