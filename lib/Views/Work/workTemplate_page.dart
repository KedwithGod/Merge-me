
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Views/Job/findTrader.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:mergeme/Views/Uielements/work_utilites.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:random_string/random_string.dart';

class WorkTemplate extends StatelessWidget {
  final searchEntry =TextEditingController();
  final locationEntry= TextEditingController();
  final String pageTitle;
  final String tileTradeRegistry;
  final List number;
  final GlobalKey _scaffoldKey = new GlobalKey();

  WorkTemplate( this.pageTitle, this.tileTradeRegistry, this.number);

  localTrade(context,dynamicSize){
    return AdaptiveSizedBox(
        height:501/667 ,
        child: ListView(
            key: Key(randomString(7)),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[

                  tradeTile(
                      context, 'assets/beads.jpg', 'Bead Making',
                          (){
                          }, tileTradeRegistry, number[0]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/cake.jpg', 'Cake Making',
                          (){
                            if (pageTitle == 'Give out work') {
                              return Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      FindTrader(
                                          route.BeadMaking, route.GiveWork)));
                            }
                            else if (pageTitle=='Learn a Trade') return FindTrader(route.BeadMaking, route.LearnTrade);
                            else if (pageTitle=='Search work')  return Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    FindTrader(
                                        route.CakeMaking, route.SearchWork)));
                            return Container();

                          }, tileTradeRegistry, number[1]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/house painting.jpg', 'House painting',
                          (){}, tileTradeRegistry, number[2]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/plumbing.jpg', 'plumbing',
                          (){}, tileTradeRegistry, number[3]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ])
    );

  }


  techJobs(context,dynamicSize){
    return  AdaptiveSizedBox(
        height:501/667 ,
        child: ListView(
            key: Key(randomString(9)),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[

                  tradeTile(
                      context, 'assets/graphics.jpg', 'Graphic Design',
                          (){
                            if (pageTitle=='Search work')  return Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  FindTrader(
                                      route.DataScientist, route.SearchWork),
                            ));
                            return Container();
                          }, tileTradeRegistry, number[4]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/mobile.jpg', 'Mobile developer',
                          (){
                             }, tileTradeRegistry, number[5]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/Data science.jpg', 'Data Scientist',
                          (){

                          }, tileTradeRegistry, number[6]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/web dev.jpg', 'Web developer',
                          (){}, tileTradeRegistry, number[7]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ])
    );

  }

  artisans(context,dynamicSize){
    return AdaptiveSizedBox(
        height:501/667 ,
        child: ListView(
            key: Key(randomString(11)),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[

                  tradeTile(
                      context, 'assets/mechanic.jpg', 'AutoMechanic',
                          (){}, tileTradeRegistry, number[8]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/Tailor.jpg', 'Tailor/Seimstress',
                          (){}, tileTradeRegistry, number[9]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/electrician.jpg', 'Electrician',
                          (){}, tileTradeRegistry, number[10]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/capenter.jpg', 'Carpenter',
                          (){}, tileTradeRegistry, number[11]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ]));

  }


  repairs(context,dynamicSize){
    return  AdaptiveSizedBox(
        height:501/667 ,
        child: ListView(
            key: Key(randomString(6)),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: <Widget>[
              Column(
                children: <Widget>[

                  tradeTile(
                      context, 'assets/refrigerator.jpg', 'Refrigerator repairer',
                          (){}, tileTradeRegistry, number[12]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/fam repairer.jpg', 'Fan repairer',
                          (){}, tileTradeRegistry, number[13]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/te;evosopm repairer.jpg', 'Television repairer',
                          (){}, tileTradeRegistry, number[14]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/bag repair.jpg', 'Bag repairer',
                          (){}, tileTradeRegistry, number[15]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ]));

  }




  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    return DefaultTabController(length: 4,
        child:Scaffold(
        drawer: CustomDrawer(),
        body:SafeArea(
          child: Stack(
            children: <Widget>[
              AdaptivePositioned(
                left: 0,
                top: 0,
                child: Container(
                  height:dynamicSize.height(94/667),
                  width: dynamicSize.width(375/375),
                  decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],),

                  child: Stack(
                    children: <Widget>[

                      AdaptivePositioned(
                        left: 21,
                        top: 13,
                        child: Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: GeneralIconDisplay(
                                Icons.menu, Colors.white, Key('drawerKey'),
                                26 / 667),
                          );

                        }),
                      ),

                      AdaptivePositioned(
                        left: 75,
                        top: 3,
                        child: GeneralTextDisplay(
                           pageTitle,
                            Colors.white,
                            1,
                            25,
                            FontWeight.bold,
                            '$tileTradeRegistry'),
                      ),
                      AdaptivePositioned(
                        left: 289,
                        top: 10,
                        child: GestureDetector(
                          onTap: (){},
                          child: GeneralIconDisplay(
                              Icons.notifications, Colors.white,
                              Key('notification on $tileTradeRegistry'), 22 / 667),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 303,
                        top: 10,
                        child: Container(
                          alignment: Alignment.center,
                          height:dynamicSize.height(10 / 667),
                          width: dynamicSize.width(10 / 375),
                          decoration: new BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: GeneralTextDisplay('0', Colors.white, 1, 7,
                              FontWeight.w600, '0 tile in $tileTradeRegistry'),
                        ),

                      ),
                      AdaptivePositioned(
                        left: 326,
                        top: 10,
                        child: GestureDetector(
                          onTap: (){},
                          child: GeneralIconDisplay(
                              Icons.email, Colors.white,
                              Key('message icon $tileTradeRegistry'), 22 / 667),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 21,
                        top: 53,
                        child: GeneralTextField(
                            'tradePage',
                            TextInputType.text,
                            searchEntry,
                            'Search trade',
                            'trade search',
                            '',
                            1,
                            Icons.search,
                            true),
                      ),
                      AdaptivePositioned(
                        left: 211,
                        top: 53,
                        child: GeneralTextField(
                            'tradePage',
                            TextInputType.text,
                            locationEntry,
                            'Location',
                            'location',
                            '',
                            1,
                            Icons.location_on,
                            true),
                      ),

                    ],
                  ),
                ),
              ),

              Positioned(
                left: 1,
                top: 120,
                bottom: 0,
                right: 0,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicator: new BubbleTabIndicator(
                        indicatorHeight: 25.0,
                        indicatorColor: Color.fromRGBO(238, 83, 79, 1.0),
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                      tabs: [
                        Container(

                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Tab(text: 'Local Trade',)),
                          width: dynamicSize.width(90/360),
                        ),
                        Container(

                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Tab(text: 'Tech Jobs',)),
                          width: dynamicSize.width(90/360),
                        ),
                        Container(

                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Tab(text: 'Artisans',)),
                          width: dynamicSize.width(90/360),
                        ),
                        Container(

                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Tab(text: 'Repairs',)),
                          width: dynamicSize.width(90/360),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: TabBarView(
                        children: [
                          localTrade(context, dynamicSize),
                          techJobs(context, dynamicSize),
                          artisans(context, dynamicSize),
                          repairs(context, dynamicSize)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    ));
  }
}



