import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/filePickerViewModel.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:random_string/random_string.dart';

class FilePicker extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                appBar: new AppBar(
                  backgroundColor: Color.fromRGBO(238, 83, 39, 1.0),
                  title: GeneralTextDisplay('Select Attachment', Colors.white, 1,
                16, FontWeight.w600, 'Appbar in job attachment'),
          ),
                body: new Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new SingleChildScrollView(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: new DropdownButton(
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
                                new DropdownMenuItem(
                                  child: new Text('CUSTOM FORMAT'),
                                  value: FileType.custom,
                                ),
                              ],
                              onChanged: (value) {
                                model.updatePickType(value);
                                if (model.pickingType != FileType.custom) {
                                  model.updateController(controller.text, '');
                                  model.updateExtension( '');
                                }
                              }),
                        ),
                        new ConstrainedBox(
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
                        ),
                        new ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 200.0),
                          child: new SwitchListTile.adaptive(
                            activeColor: Colors.black,
                            title: new Text('Pick multiple files', textAlign: TextAlign.right),
                            onChanged: (bool value) {
                              model.updateMultiPick( value);
                            },
                            value: model.multiPick,
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                          child: Column(
                            children: <Widget>[
                              new RaisedButton(
                                onPressed: () => model.openFileExplorer(),
                                child: new Text("Open file picker"),
                              ),
                              new RaisedButton(
                                onPressed: () => model.selectFolder(),
                                child: new Text("Pick folder"),
                              ),
                              new RaisedButton(
                                onPressed: () => model.clearCachedFiles(scaffoldKey),
                                child: new Text("Clear temporary files"),
                              ),
                            ],
                          ),
                        ),
                        new Builder(
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
                                      title: new Text(
                                        name,
                                      ),
                                      subtitle: new Text(path),
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) => new Divider(),
                                )),
                          )
                              : new Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

    );
  }
}
