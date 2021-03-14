import 'package:flutter/material.dart';

abstract class PaginationInterface {
  int currentPage = 1;

  // ignore: missing_return
  bool fnOnNotification(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      fnShowNextPage();
    }
  }

  Future fnShowNextPage();
}
