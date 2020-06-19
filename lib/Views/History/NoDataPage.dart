import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/JobPageViewModel.dart';
import 'package:mergeme/ViewModel/NoDataViewModel.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';


class NoPageData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }
    return ViewModelProvider<NoDataViewModel>.withConsumer(
      viewModelBuilder: ()=>NoDataViewModel(),
      builder: (context, model, child)=> SafeArea(
          child: Container(
            height:height(524) ,
            width: width(346),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/green.png'),fit: BoxFit.cover)
            ),
            child: GeneralTextDisplay(model.noPageText,
               Colors.black, 2,
            26, FontWeight.bold, 'Empty active project'),
      )),
    );
  }
}
