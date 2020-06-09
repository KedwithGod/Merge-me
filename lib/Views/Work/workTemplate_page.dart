import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Views/Job/findJob.dart';
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
  final LocalStorageService storageService =locator<LocalStorageService>();

  WorkTemplate( this.pageTitle, this.tileTradeRegistry, this.number);

  //Material page route navigation to findTrade page
  navigation(context,specificTrade, tradePage){
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            FindTraderPage(
                specificTrade, tradePage)));
  }

  // onTap function for specific trade to navigate to findTrader page
  specificTradeTap(context,specificTrade)async {
    if (pageTitle == 'Search work') {
      await storageService.setUser(route.SelectedTrade, specificTrade);
      return Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              FindJobPage(specificTrade)));}

    else if (pageTitle == 'Learn a Trade')
      return navigation(
          context, specificTrade, route.LearnTrade);
    else if (pageTitle == 'Give out work')
      return navigation(
          context, specificTrade, route.GiveWork);
    return Container();
  }

  // Snippet Widget for local trade, with gesture detectors for all three pages

  localTrade(context){
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
                          (){specificTradeTap(context, route.BeadMaking);}, tileTradeRegistry, number[0]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/cake.jpg', 'Cake Making',
                          (){specificTradeTap(context, route.CakeMaking);}, tileTradeRegistry, number[1]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/house painting.jpg', 'House painting',
                          (){specificTradeTap(context,route.HousePainting);}, tileTradeRegistry, number[2]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/plumbing.jpg', 'plumbing',
                          (){specificTradeTap(context,route.PlumbingWork );}, tileTradeRegistry, number[3]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ])
    );

  }

// Snippet Widget for tech Jobs, with gesture detectors for all three pages

  techJobs(context){
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
                          (){specificTradeTap(context, route.GraphicDesign);}, tileTradeRegistry, number[4]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/mobile.jpg', 'Mobile developer',
                          (){specificTradeTap(context, route.MobileDeveloper);
                             }, tileTradeRegistry, number[5]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/Data science.jpg', 'Data Scientist',
                          (){specificTradeTap(context, route.DataScientist);}, tileTradeRegistry, number[6]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/web dev.jpg', 'Web developer',
                          (){specificTradeTap(context, route.WebDeveloper);}, tileTradeRegistry, number[7]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ])
    );

  }

  // Snippet Widget for artisans, with gesture detectors for all three pages
  artisans(context){
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
                          (){specificTradeTap(context, route.AutoMechanic);}, tileTradeRegistry, number[8]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/Tailor.jpg', 'Tailor/Seimstress',
                          (){specificTradeTap(context, route.Tailor);}, tileTradeRegistry, number[9]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/electrician.jpg', 'Electrician',
                          (){specificTradeTap(context, route.Electrician);}, tileTradeRegistry, number[10]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/capenter.jpg', 'Carpenter',
                          (){specificTradeTap(context, route.Carpenter);}, tileTradeRegistry, number[11]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ]));

  }

  // Snippet Widget for repairs, with gesture detectors for all three pages
  repairs(context){
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
                          (){specificTradeTap(context, route.RefrigeratorRepair);}, tileTradeRegistry, number[12]),

                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/fam repairer.jpg', 'Fan repairer',
                          (){specificTradeTap(context, route.FanRepair);}, tileTradeRegistry, number[13]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/te;evosopm repairer.jpg', 'Television repairer',
                          (){specificTradeTap(context, route.TelevisionRepair);}, tileTradeRegistry, number[14]),
                  AdaptiveSizedBox(
                    height: 10/667,
                  ),
                  tradeTile(
                      context, 'assets/bag repair.jpg', 'Bag repairer',
                          (){specificTradeTap(context, route.BagRepair);}, tileTradeRegistry, number[15]),
                  AdaptiveSizedBox(
                    height: 15/667,
                  ),

                ],
              )
            ]));

  }




  @override
  Widget build(BuildContext context) {
    // imported Responsive widget
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }


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
                  height:height(94),
                  width: width(375),
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
                        top: 15,
                        child: Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: GeneralIconDisplay(
                                Icons.menu, Colors.white, Key('drawerKey'),
                                22 / 667),
                          );

                        }),
                      ),

                      AdaptivePositioned(
                        left: 70,
                        top: 6,
                        child: Container(
                          width: width(210),
                          height: height(32),
                          alignment: Alignment.center,
                          child: GeneralTextDisplay(
                             pageTitle,
                              Colors.white,
                              1,
                              25,
                              FontWeight.bold,
                              '$tileTradeRegistry'),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 289,
                        top: 15,
                        child: GestureDetector(
                          onTap: (){},
                          child: GeneralIconDisplay(
                              Icons.notifications, Colors.white,
                              Key('notification on $tileTradeRegistry'), 22 / 667),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 303,
                        top: 15,
                        child: Container(
                          alignment: Alignment.center,
                          height:height(10),
                          width: width(10),
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
                        top: 15,
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
                            true, dynamicSize.height(28 / 667),
                            dynamicSize.width(142 / 375)),
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
                            true, dynamicSize.height(28 / 667),
                            dynamicSize.width(142 / 375)),
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
                        indicatorHeight: height(25),
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
                          localTrade(context),
                          techJobs(context),
                          artisans(context),
                          repairs(context)
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



