import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../data/repositories/mock/data_mock_chat_repository.dart';
import 'dm_controller.dart';

class DmPage extends CleanView {

  DmPage({Key? key}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();

}

class _DmPageState extends CleanViewState<DmPage,DmController> {
  _DmPageState() : super(DmController(DataMockChatRepository()));
  int currentPageIndex = 0;
  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: const Text('DM'), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange),
      body: Center(
        child: ControlledWidgetBuilder<DmController>(
            builder: (context,controller) {
              List<Widget> dmChats = controller.returnedMsg(context);
              return ListView(
                children: dmChats
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext buildContext){
                  return AlertDialog(
                      title: Text("Create a new DM"),
                    content: Form(
                      child: TextFormField(
                        decoration: InputDecoration(label: Text("contact id")),
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Cancel")),
                      TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text("Accept"))
                    ],
                  );
                }
            );
          }
      ),
    );
  }}