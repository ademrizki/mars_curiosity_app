import 'package:flutter/material.dart';
import 'package:mars_curiosity_app/lib/interfaces/pagination_interface.dart';
import 'package:mars_curiosity_app/lib/models/curiosity_images.dart';
import 'package:mars_curiosity_app/lib/services/curiosity_services.dart';

class HomeProvider extends ChangeNotifier with PaginationInterface {
  HomeProvider() {
    fnFetchCuriosityImages();
  }

  final CuriosityServices _services = CuriosityServices();
  CuriosityImages curiosityImages;

  Future fnFetchCuriosityImages() async {
    curiosityImages = await _services.fetchCuriosityImages();

    notifyListeners();
  }

  @override
  Future fnShowNextPage() async {
    currentPage++;

    final newData = await _services.fetchCuriosityImages(
      page: currentPage.toString(),
    );

    curiosityImages.photos.addAll(newData.photos);
    notifyListeners();
  }
}
