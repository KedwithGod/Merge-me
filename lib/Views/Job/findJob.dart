import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/firestore_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/ViewModel/postJobViewModel.dart';
import 'package:mergeme/Views/Job/Job_description.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

class FindJobPage extends StatelessWidget {
  final LocalStorageService storageService =locator<LocalStorageService>();
  final FireStoreService _fireStore =locator<FireStoreService>();
  final String specificTrade;

  FindJobPage( this.specificTrade);
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





    return ViewModelProvider<JobViewModel>.withoutConsumer(
      onModelReady: (model) {model.listenToPosts();
      model.hideLabelController=ScrollController();
      model.hideControllerFunction();
      model.getNotificationFromDataBase();
      },
      disposeViewModel: false,
      viewModelBuilder: ()=>JobViewModel(route.GiveWork+specificTrade),
        builder: (context,model,_)=>model.netStat==false?
        SafeArea(
          child:  Scaffold(
            body: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/network.gif'),
                  AdaptiveSizedBox(
                    height: 20/667,
                  ),
                  GeneralTextDisplay('Kindly switch on your data', Colors.black87, 2,
                      14, FontWeight.w600, 'data connection')
                ],
              ),
            ),
          ),

        ):
      Scaffold(
        drawer: CustomDrawer(),
      body: SafeArea(
          child:Stack(
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
                              child: GeneralTextDisplay(specificTrade , Colors.white, 1, 20,
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
                              child: GeneralTextDisplay(
                                    model.notificationValue == null
                                        ? '0'
                                        : '${model.notificationValue}',
                                    Colors.white,
                                    1,
                                    7,
                                    FontWeight.w600,
                                    '0 tile in job template'),
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
                              child: GeneralTextDisplay('Available Jobs', Colors.black54,
                                  1, 15, FontWeight.w600, 'Available Jobs'),
                            ),
                          ),

                        ],
                      )),
                ),
                StreamBuilder(
                    stream: _fireStore.dataFromFireStore,
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return
                          Positioned(
                          left:6,
                          top: 145,
                          bottom: 0,
                          right: 5,
                          child: AdaptiveSizedBox(
                              height: height(450/667),
                              width:width(355/375) ,
                              child: model.jobDetails.length==0? Center(
                                child: GeneralTextDisplay(
                                    'No available Jobs', Colors.black54, 4, 14,
                                    FontWeight.w500,
                                    'no data for on ${model.selectedTrade}'),):
                              ListView.builder(
                                physics: BouncingScrollPhysics(),
                                controller: model.hideLabelController,
                                  itemCount: model.jobDetails.length,
                                  itemBuilder:(context, index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: JobTile(model.jobDetails[index],specificTrade),
                                    );
                                  })
                          ));

                    return  Center(
                        child: GeneralTextDisplay(
                            'No available Jobs', Colors.black54, 4, 14,
                            FontWeight.w500,
                            'no data for  ${model.selectedTrade}'),);}),



              ],
      )
      )),
    );
  }
}

class JobTile extends ProviderWidget<JobViewModel>{
  final dynamic documents;

  final String specificTrade;
  JobTile(this.documents,this.specificTrade);


  @override
  Widget build(BuildContext context, JobViewModel model) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }


      return GestureDetector(
        onTap: (){Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                JobDescriptionPage(specificTrade,documents)));},
        child: Container(
          height: height(93),
          width: width(341),
          decoration: (BoxDecoration(color: Colors.white,
              borderRadius: adaptiveBorderRadius(
                  context, radius: 11),
              boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.35),offset: Offset(5.0,5.0),
                  blurRadius: 5.0)])),
          child: Stack(children: <Widget>[
            AdaptivePositioned(
              left: 20,
              top: 5,
              child: GeneralTextDisplay(
                  documents.date,
                  Color.fromRGBO(127, 127, 127, 1.0), 1, 12,
                  FontWeight.bold, 'Date time'),
            ),
            AdaptivePositioned(
              left: 255,
              top: 5,
              child: GeneralTextDisplay(
                  documents.time,
                  Color.fromRGBO(127, 127, 127, 1.0), 1, 12,
                  FontWeight.bold, 'time date'),
            ),
            AdaptivePositioned(
              left:20 ,
              top: 36,
              child: Container(
                height: height(46),
                width: width(60),
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('assets/office.jpg'),fit:BoxFit.cover ,
                ),borderRadius: adaptiveBorderRadius(context,radius: 11)),
              ),
            ),

            AdaptivePositioned(
              left: 90,
              top: 39,
              child: StreamBuilder(
                    stream: Firestore.instance.collection('DataBase')
                    .document(documents.jobPosterId).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData)
                  return GeneralTextDisplay(
                      snapshot.data==null? 'NO name':snapshot.data[route.Name], Colors.black, 2, 14, FontWeight.bold, 'job giver');
                  return Container();
                }
              ),
            ),
            AdaptivePositioned(
              left: 90,
              top: 62,
              child: GeneralTextDisplay(
                  documents.location, Color.fromRGBO(127, 127, 127, 1.0), 1, 12, FontWeight.w400, 'Job giver location'),
            ),
            AdaptivePositioned(
              left: 254,
              top: 39,
              child: GeneralTextDisplay(
                 ' #${documents.budget}', Colors.black, 1, 14, FontWeight.bold, 'job giver price'),
            ),
          ],),


        ),
      );

    }
  }

