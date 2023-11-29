import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../models/my_models.dart';

class FileStorageService {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    debugPrint(filePath.path);
    return filePath.path;
  }

  FileStorageService() {
    _createFile();
  }

  Future<File> _createFile() async {
    var file = File(await _getFilePath() + '/info.txt');
    return file;
  }

  void verileriKaydet(UserInfo userInfo) async {
    var file = await _createFile();
    await file.writeAsString(jsonEncode(userInfo));
  }

  Future<UserInfo> verileriOku() async {
    try {
      var file = await _createFile();
      var dosyaStringIcerik = await file.readAsString();
      var json = jsonDecode(dosyaStringIcerik);
      return UserInfo.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
    }
    return UserInfo('', Cinsiyet.DIGER, [], false);
  }
}
