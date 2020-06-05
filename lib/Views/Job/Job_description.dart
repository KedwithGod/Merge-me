import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Model/constants/loading.dart';
import 'package:mergeme/ViewModel/postJobViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:provider_architecture/_viewmodel_provider.dart';
import 'package:random_string/random_string.dart';

class JobDescriptionPage extends StatelessWidget {
  final String specificTrade;
  final dynamic document;

  JobDescriptionPage(this.specificTrade, this.document) ;
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


    return
      Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
          child:
               ListView.builder(
                 key: Key(randomString(15)),
                 physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                  itemBuilder: (context,index)=>BodyContent(
                      document,height,width,route.specificTrade)),
            ),
    );
  }
}

class BodyContent extends StatelessWidget{
  final dynamic document;
  final Function height;
  final Function width;


  final String specificTrade;

  BodyContent(this.document, this.height, this.width,this.specificTrade);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return  ViewModelProvider<JobViewModel>.withConsumer(
        onModelReady: (model) async{ await model.getJobPosterData(document);
        model.waitingFunction();},

        viewModelBuilder: ()=>JobViewModel(route.GiveWork+specificTrade),
        disposeViewModel: false,
        builder: (context, model,_)=>model.loading==true && document!=null ? Center(
          child: Loading(
          ),
        ):
         Container(
          height: height(667),
          width: width(375),
          child: Stack(
            children: <Widget>[
              Container(
                height: height(332),
                width: width(284),
                decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(11),
                      bottomRight: Radius.circular(11)),),
                child: Stack(children: <Widget>[
                  AdaptivePositioned(
                    left: 11,
                    top: 17,
                    child: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: GeneralIconDisplay(
                            Icons.menu, Colors.white, Key('drawerKey $randomString(5)'),
                            22 / 667),
                      );

                    }),
                  ),
                  AdaptivePositioned(
                    left: 53,
                    top: 14,
                    child: GeneralTextDisplay(
                        'Job Description', Color.fromRGBO(242, 242, 242, 1.0),
                        1, 18, FontWeight.w600,
                        'job description'),
                  ),
                  AdaptivePositioned(
                    left: 53,
                    top: 43,
                    child: GeneralTextDisplay(
                        document.jobType, Color.fromRGBO(255, 255, 255, 1.0),
                        1, 14, FontWeight.bold,
                        'specificTrade'),
                  ),
                  AdaptivePositioned(
                    left: 53,
                    top: 63,
                    child: GeneralTextDisplay(
                        'Posted on\n ${document.date}',
                        Color.fromRGBO(215, 215, 215, 1.0),
                        2, 10, FontWeight.w600,
                        'date of job posting'),
                  )
                ],),

              ),

              AdaptivePositioned(
                left: 315,
                top: 14,
                child: GestureDetector(
                  onTap: (){},
                  child: GeneralIconDisplay(
                      Icons.notifications, Color.fromRGBO(215, 0, 27, 1.0),
                      Key('notification on '), 24 / 667),
                ),
              ),
              AdaptivePositioned(
                left: 331,
                top: 14,
                child: Container(
                  alignment: Alignment.center,
                  height:height(10),
                  width: width(10),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: GeneralTextDisplay('0', Colors.black, 1, 6,
                      FontWeight.w600, '0 tile in Post job'),
                ),

              ),
              AdaptivePositioned(
                left: 315,
                top: 53,
                child: GestureDetector(
                  onTap: (){},
                  child: GeneralIconDisplay(
                      Icons.email, Color.fromRGBO(215, 0, 27, 1.0),
                      Key('message icon Post job'), 24 / 667),
                ),
              ),



              AdaptivePositioned(
                left: 75,
                top: 124,
                child: Container(
                  height: height(168),
                  width: width(286),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(215, 0, 27, 1.0),
                    borderRadius: adaptiveBorderRadius(context,radius: 11),
                  ),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 17,
                        top: 23,
                        child: GeneralTextDisplay(
                                    model.jobPosterName, Colors.white, 1, 14,
                                    FontWeight.bold, 'job giver')


                      ),

                      AdaptivePositioned(
                        left: 17,
                        top: 42,
                        child: GeneralTextDisplay(
                            document.location, Color.fromRGBO(215, 215, 215, 1.0), 1, 12,
                            FontWeight.w400, 'location in job description'),
                      ), AdaptivePositioned(
                        left: 17,
                        top: 69,
                        child
                            : GeneralTextDisplay(
                            '''Lorem ipsum dolor sit amet,\nconsectetur adipiscing Lorem\nipsum dolor sit amet,fghjskdlw
                                ''', Color.fromRGBO(242, 242, 242, 1.0), 3, 12,
                            FontWeight.w400, 'description in job description'),
                      ),
                      AdaptivePositioned(
                        left:194 ,
                        top: 18,
                        child: Container(
                          width: height(50),
                          height: height(50),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/office.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 214,
                        top: 114,
                        child: GeneralIconButton(
                            Color.fromRGBO(242, 242, 242, 1.0), height(20),
                            Icon(Icons.chat,color:Color.fromRGBO(242, 242, 242, 1.0)),
                            Colors.white70, width(20),
                                (){}),),
                      AdaptivePositioned(
                        left: 205,
                        top: 141,
                        child: GeneralTextDisplay(
                            'Chat me', Color.fromRGBO(215, 215, 215, 1.0), 1, 12,
                            FontWeight.w400, 'location in job description'),

                      ),
                    ],
                  ),
                ),
              ),

              AdaptivePositioned(
                left: 34,
                top: 347,
                child: GeneralTextDisplay(
                    'Main task list', Colors.black, 1, 16,
                    FontWeight.bold, 'main task list'),

              ),
              AdaptivePositioned(
                left: 34,
                top: 380,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1.0)),
                  width: width(319),
                  height: height(102),
                  padding: EdgeInsets.all(height(5)),
                  child: Column(
                    children: <Widget>[
                      GeneralTextDisplay(
                  model.stringOperation(0, document), Color.fromRGBO(85, 85, 85, 1.0),
                          6, 11,
                          FontWeight.w600, 'task list'),





                    ],
                  ),
                ),

              ),

              AdaptivePositioned(
                left: 40,
                top: 496,
                child: GeneralTextDisplay(
                    'view attachment', Color.fromRGBO(238, 83, 79, 1.0),
                    1, 11,
                    FontWeight.w600, 'attachment'),

              ),
              AdaptivePositioned(
                left: 34,
                top: 533,
                child: GeneralTextDisplay(
                    'BUDGET', Color.fromRGBO(127, 127, 127, 1.0),
                    1, 10,
                    FontWeight.bold, 'budget'),

              ),
              AdaptivePositioned(
                left: 32,
                top: 555,
                child: GeneralTextDisplay(
                    '#${document.budget}', Color.fromRGBO(0, 0, 0, 1.0),
                    1, 20,
                    FontWeight.bold, 'Money'),

              ),
              AdaptivePositioned(
                left: 261,
                top: 533,
                child: GeneralTextDisplay(
                    'DURATION', Color.fromRGBO(127, 127, 127, 1.0),
                    1, 10,
                    FontWeight.bold, 'time'),

              ),
              AdaptivePositioned(
                left: 259,
                top: 555,
                child: GeneralTextDisplay(
                    document.duration, Color.fromRGBO(0, 0, 0, 1.0),
                    1, 18,
                    FontWeight.bold, 'Money'),

              ),

              AdaptivePositioned(
                left:111,
                top: 595,
                child: GeneralButton(
                    'Raised',
                    1,
                    'Raised',
                    'Bid',
                    Colors.white,
                    13,
                    FontWeight.w600,
                    40,
                    140,
                        (){},
                    11,
                    11,
                    11,
                    11,
                    Color.fromRGBO(238, 83, 79, 1.0),
                    Colors.grey,
                    3),
              )


            ],
          ),
        ),
      );
    }
  }
