import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class DatabseHelper {
  static DatabseHelper? _databaseHelper;
  static Database? _database;

  factory DatabseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabseHelper._internal();
      return _databaseHelper!;
    } else {
      return _databaseHelper!;
    }
  }

  DatabseHelper._internal();

  Future<Database?> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database?> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "ogrenci.db");
    var exists = await databaseExists(path);
    if (!exists) {
      debugPrint("creating new copy from asset");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join("assets", "notlar.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      debugPrint("opening existing database");
    }
    return await openDatabase(path, readOnly: false);
  }

  Future<List<Map<String, dynamic>>> kategorileriGetir() async {
    var db = await _getDatabase();
    var sonuc = await db!.query("kategori");
    return sonuc;
  }

  Future<List> kategoriListesiniGetir() async {
    var kategorileriIcerenMapListesi = await kategorileriGetir();
    var kategoriListesi = List<Kategori>;
    for (Map map in kategorileriIcerenMapListesi) {
      kategoriListesi.add(Kategori.fromMap(map));
    }
    return kategoriListesi;
  }

  Future<int> kategoriEkle(Kategori kategori) async {
    var db = await _getDatabase();
    var sonuc = await db!.insert("kategori", kategori.toMap());
    return sonuc;
  }
}

class Kategori {
  static fromMap(Map map) {}
}
