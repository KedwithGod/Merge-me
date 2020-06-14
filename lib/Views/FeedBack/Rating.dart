import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingPage extends StatelessWidget {
  void _showRatingDialog(context) {
    // We use the built in showDialog function to show our Rating Dialog
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: const FlutterLogo(
                size: 100,
                colors: Colors.red), // set your own image/icon widget
            title: "The Rating Dialog",
            description:
            "Tap a star to set your rating. Add more description here if you want.",
            submitButton: "SUBMIT",
            alternativeButton: "Contact us instead?", // optional
            positiveComment: "We are so happy to hear :)", // optional
            negativeComment: "We're sad to hear :(", // optional
            accentColor: Colors.red, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              // TODO: open the app's page on Google Play / Apple App Store
            },
            onAlternativePressed: () {
              print("onAlternativePressed: do something");
              // TODO: maybe you want the user to contact you instead of rating a bad review
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("Show Rating Dialog"),
          onPressed:() {_showRatingDialog(context);},
        ),
      ),
    );
  }
}
