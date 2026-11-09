import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:logging/logging.dart';
import 'package:quite_simple_chat/app/pages/discover/discover_presenter.dart';
import 'package:quite_simple_chat/data/repositories/mock/data_mock_space_repository.dart';
import 'package:quite_simple_chat/domain/entities/space.dart';

class DiscoverController extends Controller {
  List<Space> spaces =[];
  final Logger _logger;
  final DiscoverPresenter discoverPresenter;

  DiscoverController(DataMockSpaceRepository repository) :
      discoverPresenter = DiscoverPresenter(repository), _logger = Logger("DiscoverController");

  @override
  void onInitState(){
    discoverPresenter.getSpaces();
    refreshUI();
  }

  @override
  void initListeners() {
    discoverPresenter.getSpacesOnComplete = () {
      _logger.info("getSpaces completed");
    };
    discoverPresenter.getSpacesOnError=(e) {
      _logger.warning("getSpaces executed with errors");
    };
    discoverPresenter.getSpacesOnNext =(List<Space> response){
      spaces = response;
      refreshUI();
    };
  }
  List<Widget> returnedMsg(){
    List<Column> widgets = spaces.map(
        (e)=>Column(
          children: <Widget>[
            ListTile(title: Text(e.name!), trailing: TextButton(onPressed: (){},child: Text("Follow"),),),
            Divider()
          ],
        )
    ).toList();
    return widgets;
  }
}