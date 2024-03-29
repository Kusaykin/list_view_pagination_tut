import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:list_view_pagination_tut/data/model/list_item.dart';

class ListDataSource {
  static const int ITEM_PER_PAFE = 20;
  static const int PAGE_COUNT = 9;
  static final _randomGenerator = Random();
  int _showPagesCount = 0;

  Future<BuiltList<ListItem>> getNextListPage() async {
    if(_showPagesCount >= PAGE_COUNT){
      throw NoNextPageException();
    }
    _showPagesCount++;
    
    await Future.delayed(Duration(microseconds: 750));

    return BuiltList.of(
      List.generate(ITEM_PER_PAFE, _generateListItem),
    );
  }

  ListItem _generateListItem(int index) {
    return ListItem((b) => b
      ..title = '$index Lore ipsum'
      ..colorInt = _randomGenerator.nextInt(0xFFFFFFFF));
  }
}

class NoNextPageException implements Exception {}
