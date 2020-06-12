import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/filePickerViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:random_string/random_string.dart';

class FilePicker extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = new TextEditingController();
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

    _attachmentButton(left,top,
          Function onTap,String text, yValue,
        textColor, buttonColor,fontSize

        ){
      return AdaptivePositioned(
        left:left ,
        top: top,
        child: GestureDetector(
          onTap:onTap,
          child:Container(
            height: height(40),
            width: width(162),
            decoration: BoxDecoration(color: buttonColor,
                borderRadius: adaptiveBorderRadius(context,radius: 11),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.35),
                      offset:Offset (5,yValue),
                      blurRadius: 5
                  )
                ]),
            alignment: Alignment.center,
            child: GeneralTextDisplay(text,
                textColor,
                1, fontSize, FontWeight.w400,
                'open file explorer'),
          ) ,
        ),
      );
    }
    return ViewModelProvider<FilePickerViewModel>.withConsumer(
        viewModelBuilder:()=>FilePickerViewModel(),
        disposeViewModel: false,
        onModelReady: (model){
          controller.addListener(() => model.extension =controller.text);
        },
        builder: (context,model, child)=>
            SafeArea(
              child: Scaffold(
                key: scaffoldKey,
                body: new Stack(
                  children: <Widget>[
                    AdaptivePositioned(
                      left:0,
                      top: 0,
                      child: Container(
                        height: height(72),
                        width: width(375),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(238, 83, 79, 1.0),
                        ),
                        child:Stack(
                          children: <Widget>[
                            AdaptivePositioned(
                              left: 65,
                              top: 23,
                              child: Transform.rotate(
                                angle: 270
                                    * pi / 360,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(pi),
                                  child: Icon(Icons.attach_file,color: Colors.white,
                                    size: height(20),),
                                ),
                              ),
                            ),
                            AdaptivePositioned(left: 100,
                                top: 17,
                                child: Container(
                                  height: height(38),
                                  width: width(250),
                                  child: GeneralTextDisplay(
                                'Add Attachment',
                                Colors.white,
                                1,
                                20,
                                FontWeight.w600,
                                'Add attachment'),
                          ))
                          ],
                        ) ,
                      ),
                    ),
                    AdaptivePositioned(
                      left:91,
                      top: 114,
                      child: new Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        height: height(34),
                        width: width(201),
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(height(11)),
                          bottomRight: Radius.circular(height(11))
                        )),
                        child: new DropdownButton(
                          elevation: 5,
                            style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: 13,color: Colors.black),
                            hint: new Text('LOAD PATH FROM'),
                            value: model.pickingType,
                            key: Key(randomString(19)),
                            items: <DropdownMenuItem>[
                              new DropdownMenuItem(
                                child: new Text('FROM AUDIO'),
                                value: FileType.audio,
                              ),
                              new DropdownMenuItem(
                                child: new Text('FROM IMAGE'),
                                value: FileType.image,
                              ),
                              new DropdownMenuItem(
                                child: new Text('FROM VIDEO'),
                                value: FileType.video,
                              ),
                              new DropdownMenuItem(
                                child: new Text('FROM MEDIA'),
                                value: FileType.media,
                              ),
                              new DropdownMenuItem(
                                child: new Text('FROM ANY'),
                                value: FileType.any,
                              ),
                              /*new DropdownMenuItem(
                                child: new Text('CUSTOM FORMAT'),
                                value: FileType.custom,
                              ),*/
                            ],
                            onChanged: (value) {
                              model.updatePickType(value);
                              if (model.pickingType != FileType.custom) {
                                model.updateController(controller.text, '');
                                model.updateExtension( '');
                              }
                            }),
                      ),
                    ),
                    /*new ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 100.0),
                      child: model.pickingType == FileType.custom
                          ? new TextFormField(
                        maxLength: 15,
                        autovalidate: true,
                        controller: controller,
                        decoration: InputDecoration(labelText: 'File extension'),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                      )
                          : new Container(),
                    ),*/
                    AdaptivePositioned(
                      left: 91,
                      top: 165,
                      child: new ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 200.0),
                        child: new SwitchListTile.adaptive(
                          activeColor: Colors.black,
                          title: GeneralTextDisplay(
                        'Pick multiples files',
                        Color.fromRGBO(85, 85, 85, 1.0),
                        2,
                        11,
                        FontWeight.w400,
                        'Pick multiples files'),
                    onChanged: (bool value) {
                            model.updateMultiPick( value);
                          },
                          value: model.multiPick,
                        ),
                      ),
                    ),

                    _attachmentButton(
                        19.0,
                        225.0,
                            () => model.openFileExplorer(),
                        'Open file explorer',
                        0.0,
                        Colors.black,
                        Colors.white,12.0),

                    _attachmentButton(
                        196.0,
                        225.0,
                            () => model.selectFolder(),
                        "Pick folder",
                        0.0,
                        Colors.black,
                        Colors.white,12.0),


                    _attachmentButton(
                        106.0,
                        295.0,
                        model.path == null  &&
                            model.paths == null
                            ? () {}
                            : () =>
                          Navigator.pop(context)
                        ,
                        'Add attachment',
                        5.0,
                        model.path != null && model.path.isNotEmpty ||
                            model.paths != null && model.paths.isNotEmpty
                            ? Colors.white
                            :
                        Color.fromRGBO(242, 242, 242, 1.0),
                        model.path != null && model.path.isNotEmpty ||
                            model.paths != null && model.paths.isNotEmpty
                            ? Color
                            .fromRGBO(238, 83, 79, 1.0):Color.fromRGBO(170, 170, 170, 1.0),
                        13.0),
                    AdaptivePositioned(
                      left: 19,
                      top: 381,
                      child: GeneralTextDisplay(
                          model.paths != null && model.paths.isNotEmpty
                              ?'List of files selected': 'File selected',
                    Color.fromRGBO(51, 51, 51, 1.0),
                    1,
                   15, FontWeight.w600, 'leading title'),
              ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      left: width(19),
                      top: height(423),
                      child: AdaptiveSizedBox(
                        width: width(339),
                        child: new Builder(
                          builder: (BuildContext context) => model.loadingPath
                              ? Padding(padding: const EdgeInsets.only(bottom: 10.0), child: const CircularProgressIndicator())
                              : model.path != null || model.paths != null
                              ? new Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: new Scrollbar(
                                child: new ListView.separated(
                                  itemCount: model.paths != null && model.paths.isNotEmpty ? model.paths.length : 1,
                                  itemBuilder: (BuildContext context, int index) {
                                    final bool isMultiPath = model.paths != null && model.paths.isNotEmpty;
                                    final String name = 'File $index: ' + (isMultiPath ? model.paths.keys.toList()[index] : model.fileName ?? '...');
                                    final path = isMultiPath ? model.paths.values.toList()[index].toString() : model.path;

                                    return new ListTile(
                                        leading: GeneralTextDisplay(
                                            model.paths != null &&
                                                model.paths.isNotEmpty ? '${index+1 }.' : '1.',
                                            Color.fromRGBO(85, 85, 85, 1.0), 1,
                                            12, FontWeight.w400,
                                            'list tile title in file picker'),
                                      title: GeneralTextDisplay(
                                          name,
                                          Color.fromRGBO(85, 85, 85, 1.0),
                                          2,
                                          12,
                                          FontWeight.w400,
                                          'list subtitle title in file picker' ),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) => new Divider(),
                                )),
                          )
                              : new Container(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

    );
  }
}
