import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class SharedHeader extends StatelessWidget {
  final String _pageTitle;

  const SharedHeader( this._pageTitle);


  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }
    return ViewModelProvider<BaseModel>.withConsumer(
      viewModelBuilder: ()=>BaseModel(),
      disposeViewModel: false,
      builder: (context, model,_)=> Stack(
        children: <Widget>[

          AdaptivePositioned(
          left: 0,
          top: 0,
          child: Container(
              height: height(117),
              width: width(375),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 83, 79, 1.0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(height(30)),
                      bottomRight: Radius.circular(
                        height(30),
                      ))),
              child: Stack(children: [

                AdaptivePositioned(
                  left: 21,
                  top: 15,
                  child: Builder(builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: GeneralIconDisplay(Icons.menu, Colors.white,
                          Key('drawer_icon on trade page'), 22 / 667),
                    );
                  }),
                ),
                AdaptivePositioned(
                  left: 40,
                  top: 9,
                  child: Container(
                    width: width(258),
                    height: height(35),
                    alignment: Alignment.center,
                    child: GeneralTextDisplay(_pageTitle , Colors.white, 1, 26,
                        FontWeight.bold, 'trade page title'),
                  ),
                ),
                AdaptivePositioned(
                  left: 294,
                  top: 17,
                  child: GeneralIconDisplay(Icons.notifications, Colors.white,
                      Key('notification'), 24 / 667),
                ),
                AdaptivePositioned(
                  left: 311,
                  top: 17,
                  child: Container(
                    alignment: Alignment.center,
                    height: height(10),
                    width: height(10),
                    decoration: new BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: GeneralTextDisplay(model.notificationValue == null
                        ? '0'
                        : '${model.notificationValue}', Colors.white, 1, 7,
                        FontWeight.w600, '0 tile in job template'),
                  ),
                ),
                AdaptivePositioned(
                  left: 333,
                  top: 17,
                  child: GestureDetector(
                    onTap: () {},
                    child: GeneralIconDisplay(Icons.email, Colors.white,
                        Key('message icon in Job template'), 24 / 667),
                  ),
                ),



              ])))


        ],
      ),
    );
  }
}
