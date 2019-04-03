import 'package:flutter_showcase_app/data/local/DatabaseHelper.dart';
import 'package:flutter_showcase_app/models/downloads/Downloaded.dart';
import 'package:flutter_showcase_app/models/search/Hit.dart';

class DownloadsDatasource {

  static final DownloadsDatasource _downloadsDatasource =
      DownloadsDatasource._internal();


  DownloadsDatasource._internal();


  factory DownloadsDatasource() => _downloadsDatasource;

  final dbHelper = DatabaseHelper.instance;



  void saveDownloaded(Downloaded info) async {

    Map<String, dynamic> row = {
      DatabaseHelper.columnId: info.hashCode,
      DatabaseHelper.downloads_columnCaption: "",
      DatabaseHelper.downloads_columnIsVideo: "",
      DatabaseHelper.downloads_columnURL: info.video_url
    };
    final id = await dbHelper.insert(row, dbHelper.table_downloads);
    print('Added Info to downloads: $id');
  }

  Future<List<Downloaded>> getAllDownloaded() async {
    List<Downloaded> list = List();

    List<Map> result = await dbHelper.queryAllRows(dbHelper.table_downloads);
    result.forEach((row) => {
          //list.add(Downloaded(row[''],))
          print(row)
        });

    return list;
  }

  void removeDownloadInfo(Hit info) async {

    final rowsDeleted =
        await dbHelper.delete(info.hashCode, dbHelper.table_downloads);
    print('Removed $rowsDeleted row(s): row ${info.hashCode}');
  }
}
