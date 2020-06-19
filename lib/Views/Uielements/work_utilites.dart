import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';

Widget tradeTile(context, assetName, tradeName,onButtonPress,tradeRegistry,number) {
  ResponsiveSize dynamicSize = ResponsiveSize(context);
  return AdaptiveSizedBox(
    width: 339/375,
    height: 125/667,
    child: Card(
      shape:RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(dynamicSize.width(11/375)),
      ),
      elevation: 6.0,
      color: Colors.white,
      child: Stack(
        children: <Widget>[


          AdaptivePositioned(
            left: 10,
            top: 17,
            child: Container(
              height: dynamicSize.height(85 / 667),
              width:dynamicSize.height(85 / 667),
              decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(assetName), fit: BoxFit.cover)),
            ),
          ),
          AdaptivePositioned(
            left: 131,
            top: 33,
            child: GeneralTextDisplay(tradeName, Colors.black, 1, 14,
                FontWeight.bold, '$assetName subtitle'),
          ),
          AdaptivePositioned(
            left: 131,
            top: 12,
            child: GeneralTextDisplay('Trade', Color.fromRGBO(112, 182, 3, 1.0),
                1, 12, FontWeight.w300, '$assetName title'),
          ),
          AdaptivePositioned(
            left: 150,
            top: 100,
            child: GeneralTextDisplay('No of registered $tradeRegistry', Color.fromRGBO(170, 170, 170, 1.0),
                1, 11, FontWeight.w300, '$assetName registry'),
          ),

          AdaptivePositioned(
            left: 310,
            top: 100,
            child: GeneralTextDisplay('$number', Colors.black,
                1, 11, FontWeight.bold, '$assetName registry'),
          ),
          AdaptivePositioned(
            left: 131,
            top: 60,
            child: GeneralButton(
                'Raised',
                1,
                '$assetName button',
                'Select',
                Color.fromRGBO(255 , 255, 255, 1.0),
                12,
                FontWeight.w400,
                26,
                80,
                onButtonPress,
                9,
                9,
                9,
                9,
                Color.fromRGBO(238, 83, 79, 1.0),
                Colors.white,
                3.0),
          )
        ],
      ),
    ),
  );
}


class ListItem extends StatelessWidget {
  final int index;
  const ListItem({Key key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.only(right: 15.0),
            color: Colors.blue,
          ),
          index != -1
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'This is title $index',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('This is more details'),
              Text('One more detail'),
            ],
          )
              : Expanded(
            child: Container(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}