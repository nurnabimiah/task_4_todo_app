
import 'package:flutter/material.dart';
import 'package:task_4_todo/screens/contact_list_screen.dart';

Drawer MyDrawer(BuildContext context) {
  return Drawer(

    elevation: 10,
    child: ListView(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              //color: Colors.grey.shade500
                color: Colors.green
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage:NetworkImage('https://scontent.fdac20-1.fna.fbcdn.net/v/t39.30808-6/274305020_3282927828660966_736604120330445794_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeHZM2eeikZaG864bVydoVHLkf5QVAqOnseR_lBUCo6ex-cE6n0dJjYsLLtJ_j2uECelH0m-ly2H_dfUQUURqxyo&_nc_ohc=OlklU_0omoQAX_VYNRo&tn=MRSRWRUv8VkwWK_y&_nc_ht=scontent.fdac20-1.fna&oh=00_AfAkwu1q2ei1CESpRAugDbtb7m7zdd1gSW2D0sahEqnmyw&oe=63E0E4E0'),
                  radius: 40.0,
                ),
                SizedBox(width:10,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Md.Nurnabi Miah',style: TextStyle( fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0),),
                      SizedBox(height: 5,),
                      Text('md.nurnabimiah5@gmail.com',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 13),)
                    ],
                  ),
                ),


              ],
            )
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home Page', style: TextStyle(fontSize: 18),),
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactListScreen()));
          },
        ),
        Divider(
          height: 3,
          thickness: 2,
          color: Colors.teal,
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings', style: TextStyle(fontSize: 18),),
          onTap: (){},
        ),

        ListTile(
          leading: Icon(Icons.feedback),
          title: Text('Rate Us', style: TextStyle(fontSize: 18),),
          onTap: (){},
        ),

        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share', style: TextStyle(fontSize: 18),),
          onTap: (){},
        ),

        ListTile(
          leading: Icon(Icons.close),
          title: Text('Close Drawer', style: TextStyle(fontSize: 18),),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),

      ],
    ),

  );
}