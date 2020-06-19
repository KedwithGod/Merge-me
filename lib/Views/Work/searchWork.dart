import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/ViewModel/DropDownButton.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/work_utilites.dart';
import 'package:mergeme/Views/Work/workTemplate_page.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:shimmer/shimmer.dart';

class SearchWorkPage extends StatelessWidget {

 final  Map map1 = {
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

  final List updatedList=List.generate(16, (index) => 0);



  listUpdate(){
    map1.forEach((i,j) async {
      await Firestore.instance.collection(
          route.GiveWork + '' +
              i).document(
          'User').get().then((value) {
        value.data == null ? updatedList[j]=0:
        updatedList[j]=value.data[route.NoOfTrader];
        print(updatedList);
        print (i);
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    List list2=List.generate(16, (index) => index++);
    return Scaffold(
      body: SafeArea(child: StatesBuilder(
        stateID: 'workTemplate',
        blocs: [mainBloc],
        initState: listUpdate(),
        builder: (_)=>
        FutureBuilder(
          future: Future.delayed(Duration(seconds:1)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 10,
                // Important code
                itemBuilder: (context, index) =>
                    Shimmer.fromColors(
                        baseColor: Color.fromRGBO(238, 83, 79, 1.0),
                        highlightColor: Colors.yellow,
                        child: ListItem(index: -1)),
              );
            }

            if (snapshot.connectionState == ConnectionState.done)
              return WorkTemplate(
                  'Search work', 'Clients',
                  updatedList == null ? list2 : updatedList);

            if (snapshot.hasError) return Center(
              child: GeneralTextDisplay(
                  snapshot.error, Color.fromRGBO(127, 127, 127, 1.0),
                  4, 15, FontWeight.w400,
                  '${snapshot.error}'),);
            return Container();
          }),
      )),
    );
  }
}
