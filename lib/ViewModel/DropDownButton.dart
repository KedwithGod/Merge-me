import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Views/Uielements/Generaldropdowndisplay.dart';

class MainBloc extends BloCSetting {

  int s=0;
  var tradeName;
  var tradeCategory;
  Function onTapHandler;
  bool toggleView=false;





  Widget tradeSelection(){
    if (tradeCategory=='Learn a trade' ){
      print(' tradeCategory is $tradeCategory');
      return
        GeneralDropDownDisplay(
            '',
            ['',
              'Local Trade',
              'Tech Jobs',
              'Artisans',
              'Repairs'
            ],
            route.tradeCategory,
            'Choose a Trade',
            'Trade Category');

    }
    if (tradeCategory=='Search for work'){
      return
        GeneralDropDownDisplay(
            '',
            ['',
              'Local Trade',
              'Tech Jobs',
              'Artisans',
              'Repairs'
            ],
            route.tradeCategory,
            'Choose a Trade',
            'Trade Category',);



    }



    if (tradeCategory=='' || tradeCategory == 'Give a work' ){
      return Container(

          child: Text('i am rebuilt $s'),
          color: Colors.blue,
          height: 40

      );
    }

      return Container(

      child: Text('tap on $s'),
      color: Colors.blue,
      height: 40

    );

  }




  Widget tradeValue () {
    print('tradeName is $tradeName');

    if (tradeName == route.localTrade  && tradeCategory != 'Give a work' ) {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Bead making',
            'House painting',
            'Cake making',
            'Plumbing work'
          ],
          route.localTrade,
          'Select a trade',
          'Local trade');


    }
    else if (tradeName == route.techJobs && tradeName!=''   && tradeCategory != 'Give a work' ) {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Graphic Design',
            'Mobile developer',
            'Data scientist',
            'Web developer'
          ],
          route.techJobs,
          'Select a trade',
          'Tech jobs');
    }
    else if (tradeName == route.artisans && tradeName!=''  && tradeCategory != 'Give a work') {
      return GeneralDropDownDisplay(
          '',
          ['',
            'AutoMechanic',
            'Tailor/Seamstress',
            'Electrician',
            'Carpenter'
          ],
          route.artisans,
          'Select a trade',
          'Artisans');
    }
    else if (tradeName == route.repairs && tradeName!=''  && tradeCategory != 'Give a work' ) {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Refrigerator repairs',
            'Fan repairs',
            'Television repairs',
            'Bag repairs'
          ],
          route.artisans,
          'Select a trade',
          'Repairs');
    }

    else {return  Container(

        child: Text('i am rebuilt $s'),
        color: Colors.blue,
        height: 40);}
  }

  Widget onTap(){
    return  Container(
        child: tradeName!=''?Text('Select $tradeName 1 times more'):Text('rebuild $s'),
        color: Colors.white,
        height: 80);
  }



  onChanged(String userKey,String userValue) async{

    onTapHandler=
        () async{
      if (tradeName!=null){
      toggleView=!toggleView;
      print(" ontap: $toggleView");
    }};

     if (userKey==route.trade){
      tradeCategory=userValue;
    }
    else if (userKey==route.tradeCategory){
      tradeName=userValue;

    }


    await rebuildWidgets(ids: ['dropdown','TradeSelection']);
  }

}

MainBloc mainBloc;