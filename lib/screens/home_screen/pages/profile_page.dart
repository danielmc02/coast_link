import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
     children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(child: Icon(Icons.person,size: 50,),radius: 50,),
            SizedBox(width: 20,),
            Text("Daniel McC...",style: TextStyle(fontSize: 60),)
          ],),
          
        ),
      ),
      Divider(color: Colors.black,thickness: 1,indent: 10,endIndent: 10,)
     ] 
    );
  }
}