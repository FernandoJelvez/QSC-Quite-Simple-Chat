import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/app/pages/spaces/spaces_controller.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_chat_repository.dart';

class SpacesPage extends CleanView {
  SpacesPage({Key? key}) : super(key: key);

  @override
  _SpacesPageState createState() => _SpacesPageState();

}

class _SpacesPageState extends CleanViewState<SpacesPage, SpacesController> {
  _SpacesPageState() : super(SpacesController(DataMockChatRepository()));

  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: const Text('Spaces'), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange, actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.add))
      ],),
      body: Center(
        child: ControlledWidgetBuilder<SpacesController>(
            builder: (context,controller) {
              List<Widget> groupChats = controller.returnedMsg();
              return ListView(
                  children: groupChats
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.explore)
      ),
    );
  }

}