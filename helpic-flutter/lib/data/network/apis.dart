import 'package:flutter_showcase_app/constants/strings_const.dart';
import 'package:flutter_showcase_app/data/network/rest_client.dart';
import 'package:flutter_showcase_app/models/search/Hit.dart';
import 'package:flutter_showcase_app/models/search/SearchResults.dart';

class Apis {

  static final Apis _api = Apis._internal();


  Apis._internal();


  factory Apis() => _api;


  final _restClient = RestClient();

  Future<List<Hit>> searchImages(String keyword) async {
    String url = Strings.SEARCH_URL + keyword;

    var results = await _restClient
        .getHttps(url)
        .then((res) => SearchResults.fromJson(res).hits.toList())
        .catchError((error) => throw error);

    return results;
  }

  Future<List<Hit>> searchVideos(String keyword) async {
    String url = Strings.SEARCH_VIDEOS_URL + keyword;

    var results = await _restClient
        .getHttps(url)
        .then((res) => SearchResults.fromJson(res).hits.toList())
        .catchError((error) => throw error);

    return results;
  }
}
