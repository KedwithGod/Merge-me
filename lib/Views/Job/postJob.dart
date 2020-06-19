import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/ViewModel/postJobViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class PostJobPage extends StatelessWidget {

final String specificTrade;
final bool edit;

  const PostJobPage( this.specificTrade, this.edit);

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
      viewModelBuilder: ()=>JobViewModel(route.GiveWork+specificTrade),
      onModelReady: (model){model.getSelected();
      model.getValueFromJobDescription();
      model.getNotificationFromDataBase();},
      builder: (context, model,_)=>
      Scaffold(
        drawer: CustomDrawer(),
        body:SafeArea(
          child: Stack(children: <Widget>[
            AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                height: height(65),
                width: width(375),
                decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],),

                child:Stack(
                  children: <Widget>[


                    AdaptivePositioned(
                      left:14,
                      top: 21,
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: GeneralIconDisplay(
                              Icons.menu, Colors.white, Key('drawerKey'),
                              24 / 667),
                        );

                      }),
                    ),
                    AdaptivePositioned(
                      left: 289,
                      top: 19,
                      child: GestureDetector(
                        onTap: (){},
                        child: GeneralIconDisplay(
                            Icons.notifications, Colors.white,
                            Key('notification on '), 24 / 667),
                      ),
                    ),
                    AdaptivePositioned(
                      left: 305,
                      top: 19,
                      child: Container(
                        alignment: Alignment.center,
                        height:height(10),
                        width: width(10),
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
                                '0 tile in Post job'),
                          ),
                        ),
                    AdaptivePositioned(
                      left: 333,
                      top: 19,
                      child: GestureDetector(
                        onTap: (){},
                        child: GeneralIconDisplay(
                            Icons.email, Colors.white,
                            Key('message icon Post job'), 24 / 667),
                      ),
                    ),

                    AdaptivePositioned(
                      left: 40,
                      top: 0,
                      child: Container(
                        height: height(60),
                        width: width(258),
                        alignment: Alignment.center,
                        child: GeneralTextDisplay(
                            'Post a job',
                            Colors.white,
                            1,
                            22,
                            FontWeight.bold,
                            'Landing page title'),
                      ),
                    )
                  ],
                )
              ),
            ),
            AdaptivePositioned(
              left: 0,
              top: 66,
              child: Container(
                height: height(31),
                width: width(375),
                alignment: Alignment.center,
                child: GeneralTextDisplay(
                    'Please fill the details below correctly:',
                    Color.fromRGBO(51, 51, 51, 1.0), 3, 14, FontWeight.w400,
                    'Detail entry'),
              ),

            ),
            MainView(edit)


          ],),
        ) ,
      ),
    );
  }
}

class MainView extends ProviderWidget<JobViewModel>{
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool edit;

  MainView(this.edit);


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
    final TextEditingController typeOfJob = TextEditingController(
        text: edit==false?model.selectedTrade:model.tradeFromJobDescription);
    final TextEditingController location = TextEditingController(
        text:edit==false?model.locationValue:model.locationFromJobDescription);
    final TextEditingController budget= edit==true?TextEditingController():
    TextEditingController(text:model.budgetFromJobDescription);
    final TextEditingController duration=edit==false?TextEditingController():
    TextEditingController(text:model.durationFromJobDescription);
    final TextEditingController jobDescription=edit==false?TextEditingController():
    TextEditingController(text:model.descriptionFromJobDescription);

    return  Stack(
      children: <Widget>[
        AdaptivePositioned(
            left: 7,
            top: 102,
            child: Container(
              height: height(558),
              width: width(360),
              decoration: BoxDecoration(
                  borderRadius: adaptiveBorderRadius(context, radius: 11),
                  border: Border.all(
                      color: Color.fromRGBO(242, 242, 242, 1.0), width: 1.0)),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key:_formKey,
                  child: Column(

                    children: <Widget>[
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextField(
                          '',
                          TextInputType.text,
                          typeOfJob,
                          'Type of job',
                          'Type in job type',
                          route.Name,
                          1,
                          null,
                          false,
                          height(35),
                          width(340)),
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextField(
                          '',
                          TextInputType.text,
                          location,
                          'Location',
                          'Type in Location',
                          route.Name,
                          1,
                          null,
                          false,
                          height(35),
                          width(340)),
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextField(
                          '',
                          TextInputType.text,
                          duration,
                          'Duration of Project',
                          'How many weeks/month',
                          route.Name,
                          1,
                          null,
                          false,
                          height(35),
                          width(340)),
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextField(
                          '',
                          TextInputType.text,
                          budget,
                          'Budget(Intended payment)',
                          'How much will you pay for the project',
                          route.Name,
                          1,
                          null,
                          false,
                          height(35),
                          width(340)),
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextField(
                          '',
                          TextInputType.text,
                          jobDescription,
                          'Job description ',
                          'Type in job description(vital details included),'
                              '\nuse numbering to seperate points',
                          route.Name,
                          10,
                          null,
                          false,
                          height(160),
                          width(340)),
                      AdaptiveSizedBox(height: 22/667,),
                      GeneralTextDisplay(
                          'Add attachment', Colors.black, 1, 10,
                          FontWeight.bold, 'Add attachment'),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Tooltip(
                            message: 'Attach media files',
                            height:height(60/667) ,
                            decoration: BoxDecoration(color:Colors.white),
                            textStyle: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.w400,),
                            child: GeneralIconButton(
                                Colors.black45, 30, Icon(Icons.attach_file),
                                Colors.transparent, 30,
                                    (){model.filePicker();}),
                          ),
                          Tooltip(
                            message: 'Attach documents',
                            height:height(60/667) ,
                            decoration: BoxDecoration(color:Colors.white),
                            textStyle: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.w400,),
                            child: GeneralIconButton(
                                Colors.black45, 30, Icon(Icons.picture_as_pdf),
                                Colors.transparent, 30,
                                    (){model.filePicker();}),
                          ),
                          Tooltip(
                            message: 'Attach pictures',
                            height:height(60/667) ,
                            decoration: BoxDecoration(color:Colors.white),
                            textStyle: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.w400,),
                            child: GeneralIconButton(
                                Colors.black45, 30, Icon(Icons.picture_in_picture),
                                Colors.transparent, 30,
                                    (){model.filePicker();}),
                          ),
                        ],
                      ),
                      AdaptiveSizedBox(height: 17/667,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          AdaptiveSizedBox(width: 5/667,),
                          Container(
                            height: height(44),
                            width: width(237),
                            child: Stack(
                              children: <Widget>[
                                AdaptivePositioned(
                                  left:0,
                                  top: 0,
                                  child: GeneralTextDisplay(
                                      '* if the money in your wallet is not equal\n or greater than the above budget,click\n                        before you proceed',
                                      Color.fromRGBO(255, 0, 0, 0.5), 3, 9,
                                      FontWeight.w400, 'fund wallet'),
                                ),
                                AdaptivePositioned(
                                  left:5,
                                  top: 25,
                                  child: GeneralTextDisplay(
                                      'Fund Wallet',
                                      Colors.black, 1, 9,
                                      FontWeight.w600, 'fund wallet'),
                                )

                              ],
                            ),
                          ),
                          GeneralButton(
                              'Raised',
                              1,
                              'FundWallet',
                              'Fund Wallet',
                              Colors.white70,
                              13,
                              FontWeight.bold,
                              height(28),
                              width(120),
                                  (){},
                              5,
                              5,
                              5,
                              0,
                              Color.fromRGBO(255, 0, 0, 0.53),
                              Colors.white,
                              5.0)

                        ],
                      ),

                      AdaptiveSizedBox(height: 24/667,),
                      GeneralButton(
                          'Raised',
                          1,
                          'post job',
                          'Post Job',
                          Colors.white,
                          17,
                          FontWeight.w600,
                          height(40),
                          width(313),
                              () {
                            model.validateForm(
                                _formKey,
                                typeOfJob.text,
                                location.text,
                                duration.text,
                                budget.text,
                                jobDescription.text,
                                typeOfJob.text,
                                context);
                          },
                          11,
                          11,
                          11,
                          11,
                          Color.fromRGBO(255, 0, 0, 1.0),
                          Colors.white,
                          10.0),
                      AdaptiveSizedBox(height: 50/667,),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );

  }
}