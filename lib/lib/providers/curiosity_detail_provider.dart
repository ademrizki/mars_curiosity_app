import 'dart:io';
import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class CuriosityDetailProvider extends ChangeNotifier {
  final ScreenshotController screenshotController = ScreenshotController();

  Future fnGetScreenShoot(BuildContext context) async {
    final _pr = ArsProgressDialog(context);

    _pr.show();
    final _image = await screenshotController.capture(
      delay: Duration(milliseconds: 10),
      pixelRatio: 2.0,
    );

    if (_image != null) {
      final _dateNow = DateTime.now().toIso8601String();
      final _directory = (await getApplicationDocumentsDirectory()).path;

      final File _imageFile = File('$_directory/$_dateNow.png');

      await _imageFile.writeAsBytes(_image);

      notifyListeners();
      await Share.shareFiles(['$_directory/$_dateNow.png']);
    }

    notifyListeners();
    _pr.dismiss();
  }
}
