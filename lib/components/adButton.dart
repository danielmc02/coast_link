import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class CreateAdWidget extends StatefulWidget {
  const CreateAdWidget({super.key});

  @override
  State<CreateAdWidget> createState() => _CreateAdWidgetState();
}

class _CreateAdWidgetState extends State<CreateAdWidget> {
  @override
  void initState() {
    // COMPLETE: Load a Rewarded Ad
    _loadRewardedAd();
  }

  RewardedAd? _rewardedAd;

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                _rewardedAd = null;
              });
              _loadRewardedAd();
            },
          );

          setState(() {
            _rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_rewardedAd != null) {
      return FloatingActionButton.extended(
        
        onPressed: () {
          _rewardedAd?.show(
            onUserEarnedReward: (_, reward) {
              print("REWARDD BITCH");
            },
          );
        },
        label: Text('Show Ad'),
        icon: Icon(Icons.card_giftcard),
      );
    } else {
      return Text("Not ready");
    }
  }

  @override
  void dispose() {
    // TODO: Dispose a RewardedAd object
    _rewardedAd?.dispose();

    super.dispose();
  }
}

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }
}
