import 'package:flutter/material.dart';

import '../screens/forms/create_a_group.dart';


class CreateAGroup extends StatelessWidget {
  const CreateAGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Material(
                   child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Theme.of(context).colorScheme.primary,
                     child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      overlayColor: MaterialStateProperty.all(Colors.brown),
                      //radius: 50,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAGroupForm(),));
                      },
                      child: Ink(//
                      width: 150,
                      height: 150,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.add,color: Colors.white,size: 40,)),
                         FittedBox(child: Text("Create a group",style: Theme.of(context).textTheme.bodyText1,))
                        ],
                      ),
                      ),
                     ),),
                   ),
    );
  }
}