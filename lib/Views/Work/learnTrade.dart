import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Views/Work/workTemplate_page.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class LearnTrade extends StatefulWidget {

  @override
  _LearnTradeState createState() => _LearnTradeState();
}

class _LearnTradeState extends State<LearnTrade> {
  Map map1 = {
    route.BeadMaking: 0,
    route.CakeMaking: 1,
    route.HousePainting: 2,
    route.PlumbingWork: 3,
    route.GraphicDesign:4,
    route.MobileDeveloper:5,
    route.DataScientist:6,
    route.WebDeveloper:7,
    route.AutoMechanic:8,
    route.Tailor:9,
    route.Electrician:10,
    route.Carpenter:11,
    route.RefrigeratorRepair:12,
    route.FanRepair:13,
    route.TelevisionRepair:14,
    route.BagRepair:15
  };

  List updatedList=List.generate(16, (index) => 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    map1.forEach((i,j) async {
      await Firestore.instance.collection(i +route.tutors).document(
          'Tutors').get().then((value) {
        setState(() {
          value.data == null ? updatedList[j]=0:
          updatedList[j]=value.data[route.NoOfTrader];
          print(updatedList);
        });
      });

    });

    print(updatedList);
  }

  @override
  Widget build(BuildContext context) {
    List list2=List.generate(16, (index) => index++);



    return Scaffold(
        body: SafeArea(child: WorkTemplate('Learn a Trade', 'tutor',
            updatedList == null ? list2 : updatedList))
    ,
    );
  }
}
