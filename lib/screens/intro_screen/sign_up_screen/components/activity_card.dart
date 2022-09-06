import 'package:flutter/material.dart';

class ExtrovertedActivites extends StatelessWidget {
  const ExtrovertedActivites({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.black,
        //Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Ink(
             width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundImage: AssetImage('assets/emoji_faces/smiling-face-with-sunglasses.png'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Extroverted\nActivites",
                  style: Theme.of(context).textTheme.headline6,
                ), Spacer(),
                Text("Concerts, Amusement Parks, Parties, Socializing, ...",style: Theme.of(context).textTheme.subtitle1,)
              ]),
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
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.black,
        //Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Ink(
             width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundImage: AssetImage('assets/emoji_faces/face-in-clouds.png'),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Introverted\nActivites",
                  style: Theme.of(context).textTheme.headline6,
                ), Spacer(),
                Text(maxLines: 2,overflow:TextOverflow.fade,"Gaming, Photography Parks, Parties, Socializing, SocializinddSocializinddSocializinddSocializinddSocializindd",style: Theme.of(context).textTheme.subtitle1,)
              ]),
            ),
           ),
        ),
      ),
    );
  }
}