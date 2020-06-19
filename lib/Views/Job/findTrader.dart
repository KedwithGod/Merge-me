import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Model/constants/loading.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:mergeme/Views/Job/postJob.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:mergeme/Views/Uielements/work_utilites.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class FindTraderPage extends StatelessWidget {
  final String specificTrade;
  final String tradePage;


  const FindTraderPage(this.specificTrade, this.tradePage);
  getValue(document,index){
    return StreamBuilder(
        stream: Firestore.instance
            .collection('DataBase').document(document[route.UserID])
            .snapshots(),
        builder: (context, snapshot1) {
          if(!snapshot1.hasData) return Center(heightFactor: 0.7,
            child: GeneralTextDisplay(
                'Database not available', Colors.black54, 4, 14,
                FontWeight.w500,
                'no data for $tradePage on $specificTrade'),);
          if (snapshot1.connectionState==ConnectionState.waiting) {
            return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Loading(),
                    GeneralTextDisplay(
                        'Fetching User data',
                        Colors.black,
                        2,
                        15,
                        FontWeight.w600,
                        'awaiting User data from $tradePage and $specificTrade')
                  ],
                ));
          }

          if(snapshot1.hasData) return  populatePage(context,snapshot1.data,index);
          return ListView.builder(
            itemCount: 10,
// Important code
            itemBuilder: (context, index) =>
                Shimmer.fromColors(
                    baseColor: Color.fromRGBO(238, 83, 79, 1.0),
                    highlightColor: Colors.yellow,
                    child: ListItem(index: -1)),
          );
        });
  }




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
    onModelReady: (model)=>model.getNotificationFromDataBase(),
    disposeViewModel: false,
    builder: (context, model,_)=> Scaffold(
        drawer: CustomDrawer(),
        body: SafeArea(
            child: Stack(
              children: <Widget>[
              AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                  width: width(375),
                  height: height(120),
                  decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0)),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 14,
                        top: 20,
                        child: Builder(builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: GeneralIconDisplay(Icons.menu, Colors.white,
                                Key('drawer_icon on trade page'), 26 / 667),
                          );
                        }),
                      ),
                      AdaptivePositioned(
                        left: 60,
                        top: 12,
                        child: Container(
                          width: width(230),
                          height: height(35),
                          alignment: Alignment.center,
                          child: GeneralTextDisplay(specificTrade, Colors.white, 1, 20,
                              FontWeight.bold, 'trade page title'),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 294,
                        top: 19,
                        child: GeneralIconDisplay(Icons.notifications, Colors.white,
                            Key('notification'), 24 / 667),
                      ),
                      AdaptivePositioned(
                        left: 311,
                        top: 19,
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
                        top: 19,
                        child: GestureDetector(
                          onTap: () {},
                          child: GeneralIconDisplay(Icons.email, Colors.white,
                              Key('message icon in Job template'), 24 / 667),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 11,
                        top: 70,
                        child: Container(
                          width: width(355),
                          height: height(40),
                          decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius:
                              adaptiveBorderRadius(context, radius: 11)),
                          alignment: Alignment.center,
                          child: GeneralTextDisplay(tradePage==route.GiveWork?'Available traders':'Available tutors', Colors.black54,
                              1, 15, FontWeight.w600, 'Available trade'),
                        ),
                      )
                    ],
                  )),
            ),


                StreamBuilder<QuerySnapshot>(
                    stream: tradePage==route.SearchWork?Firestore.instance.collection(
                        tradePage + '' +
                            specificTrade + route.UserID).snapshots()
                        : Firestore.instance.collection(
                        specificTrade + route.tutors + route.UserID ).snapshots(),
                    builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                      print (snapshot.data);
                      if(snapshot.hasError) return Center(child:Text('${snapshot.error}'));
                      if(snapshot.connectionState==ConnectionState.waiting) {
                        return Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Loading(),
                            GeneralTextDisplay(
                                'Fetching data',
                                Colors.black,
                                2,
                                15,
                                FontWeight.w400,
                                'awaiting data from $tradePage and $specificTrade')
                          ],
                        ));
                      }

                      if (!snapshot.hasData) return Center(
                        child: GeneralTextDisplay( tradePage==route.GiveWork?
                            'No registered trader yet': 'No registered tutors yet' , Colors.black54, 4, 14,
                            FontWeight.w500,
                            'no data for $tradePage on $specificTrade'),);
                      if(snapshot.hasData){
                        var document1=snapshot.data.documents;
                        print(document1);
                      return Positioned(
                        left:6,
                        top: 155,
                        bottom: 0,
                        right: 5,
                        child: AdaptiveSizedBox(
                          height: height(450/667),
                          width:width(355/375) ,
                          child: snapshot.data.documents.length==0? Center(
                            child: GeneralTextDisplay(
                              // working option if there is no data in the list
                                tradePage==route.GiveWork?
                                'No registered trader yet': 'No registered tutors yet', Colors.black54, 4, 14,
                                FontWeight.w500,
                                'no data for $tradePage on $specificTrade'),):
                          ListView.separated(
                            separatorBuilder: (context, index)=>Container(
                              color: Colors.transparent,height: height(10),
                            ),
                              itemCount: snapshot.data.documents.length,
                              itemBuilder:(context, index){
                                return Padding(
                                    padding: EdgeInsets.all(height(20/667)),
                                child: getValue(snapshot.data.documents[index],index),);
                              })
                        ),
                      );}
                      return Center(
                      child: GeneralTextDisplay(
                      'No registered trader yet', Colors.black54, 4, 14,
    FontWeight.w500,
    'no data for $tradePage on $specificTrade'),);

                    }),
                tradePage==route.GiveWork?AdaptivePositioned(
                  left:120,
                  top: 552,
                  child: GeneralButton(
                  'Raised',
                  1,
                  'Post job at findTrader page',
                  'Post Job',
                  Color.fromRGBO(217, 0, 27, 1.0),
                  14,
                  FontWeight.bold,
                  40,
                  140,
                          (){Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  PostJobPage(specificTrade,false)));},
                  11,
                  11,
                  11,
                  11,
                  Colors.white,
                  Colors.red,
                  10.0),
            ):Container()
              ],
            ))));
  }
}



populatePage(context,DocumentSnapshot document,index) {
  ResponsiveSize dynamicSize = ResponsiveSize(context);
  // custom width
  double width(value) {
    return dynamicSize.width(value / 375);
  }

  // custom height
  double height(value) {
    return dynamicSize.height(value / 667);
  }
  return  AdaptiveSizedBox(
    height: 87/667,
    width: 360/375,
    child: Material(
      borderRadius: adaptiveBorderRadius(context,radius: 11),
        elevation: index==0?12.0:0.0,
        shadowColor: Color.fromRGBO(170, 170, 170, 1.0),
        color: index==0?Colors.white:Colors.transparent,
        child: Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 5,
              top: 6,
              child: Container(
                width: height(70),
                height: height(70),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/office.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            AdaptivePositioned(
              left: 106,
              top: 15,
              child: GeneralTextDisplay(document == null
                  ? 'Default name'
                  : document['name'], Colors.black, 1,
                  15, FontWeight.w400, 'Trader name'),
            ),
            AdaptivePositioned(
              left: 106,
              top: 40,
              child: Container(
                width: width(69),
                height: height(2),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0)),
              ),
            ),
            AdaptivePositioned(
              left: 102,
              top: 50,
              child: Container(
                width: width(10),
                height: height(12),
                child: GeneralIconDisplay(
                    Icons.location_on,
                    Color.fromRGBO(127, 127, 127, 1.0),
                    Key('location'),
                    12 / 667),
              ),
            ),
            AdaptivePositioned(
              left: 120,
              top: 47,
              child: GeneralTextDisplay(
                  document[route.Location]==null?'Unspecified':document[route.Location],
                  Color.fromRGBO(51, 51, 51, 1.0),
                  1,
                  12,
                  FontWeight.w400,
                  'location name'),
            ),
            AdaptivePositioned(
              left: 253,
              top: index==0?38:47,
              child: Container(
                width: width(15),
                height: height(12),
                child: GeneralIconDisplay(
                    Icons.star,
                    Color.fromRGBO(238, 83, 79, 1.0),
                    Key('Star'),
                    12 / 667),
              ),
            ),
            AdaptivePositioned(
              left: 277,
              top: index==0?38:47,
              child: GeneralTextDisplay('4.3 Rating', Colors.black, 1, 10,
                  FontWeight.bold, 'Rating'),
            ),
            index==0?AdaptivePositioned(
              left: 268,
              top: 63,
              child: GeneralTextDisplay(
                  'Recommended',
                  Color.fromRGBO(163, 0, 20, 1.0),
                  1,
                  8,
                  FontWeight.w400,
                  'location name'),
            ):Container(),
          ],
        ),
      ),
  );
}
