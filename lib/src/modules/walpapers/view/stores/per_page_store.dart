import 'package:flutter/cupertino.dart';

class PerPageStore extends ValueNotifier<int> {
  PerPageStore() : super(20);

  void setPerPage(int parPage) => value = parPage;
}
