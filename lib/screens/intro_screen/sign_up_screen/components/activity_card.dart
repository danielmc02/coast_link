import 'package:coast_link/state_providers/intro_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExtrovertedActivites extends StatelessWidget {
  const ExtrovertedActivites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) =>  Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Card(
          color: algo.ExtrovertedActivitesCard ? Colors.blue : Colors.white,
          //Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            
            side: BorderSide(color: Colors.black,width: .5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              algo.choseExtroverted();
            },
            child: Ink(
              width: 300,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                   CircleAvatar(
                    child: Image.asset('assets/emoji_faces/smiling-face-with-sunglasses.png'),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                   // backgroundImage: AssetImage(
                      //  'assets/emoji_faces/smiling-face-with-sunglasses.png'),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(child: Text(
                            textAlign: TextAlign.center,
                            "I'm an extrovert ",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          Text(
                          
                          "Activities Include: Concerts,\nAmusement Parksas asdsdf sffasd fdfasdfasdfs  ",
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          ),
                     
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IntrovertedActivites extends StatelessWidget {
  const IntrovertedActivites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IntroState>(
      builder: (context, algo, child) => Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Card(
           color: algo.IntrovertedActivitesCard ? Colors.blue : Colors.white,

          //Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black,width: .5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              algo.choseIntroverted();
            },
            child: Ink(
              width: 300,
              height: 100,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                   CircleAvatar(
                    radius: 40,
                    child: Image.asset("assets/emoji_faces/smiling-face-with-halo.png"),
                    backgroundColor: Colors.transparent,
                    //backgroundImage: AssetImage(
                     //   'assets/emoji_faces/smiling-face-with-halo.png'),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(child: Text(
                            textAlign: TextAlign.center,
                            "I'm an introvert",
                            style: Theme.of(context).textTheme.headline5,
                          )),
                          Text(
                          
                          "Activities Include: Gaming,\nPhotography, Drawing, Blogging, Writing, Cooking, Gardening, DIY ",
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          ),
                     
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
