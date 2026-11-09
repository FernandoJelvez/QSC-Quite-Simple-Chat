import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_space_repository.dart';
import 'discover_controller.dart';

class DiscoverPage extends CleanView {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends CleanViewState<DiscoverPage, DiscoverController> {
  _DiscoverState() : super(DiscoverController(DataMockSpaceRepository()));
  @override
  Widget get view {
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(title: const Text('Discover'), foregroundColor: Colors.white, backgroundColor: Colors.deepOrange),
      body: ControlledWidgetBuilder<DiscoverController>(
        builder: (context,controller){
          List<Widget> spaces = controller.returnedMsg();
          return ListView(
            children: spaces,
          );
        },
      )
    );
  }

}