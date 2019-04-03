import 'package:flutter_showcase_app/data/local/DatabaseHelper.dart';
import 'package:flutter_showcase_app/data/local/favourites/favourites_dao.dart';
import 'package:flutter_showcase_app/models/favourites/Favourites.dart';
import 'package:flutter_showcase_app/models/search/Hit.dart';

class FavouritesDatasource {

  static final FavouritesDatasource _favDatasource =
      FavouritesDatasource._internal();


  FavouritesDatasource._internal();


  factory FavouritesDatasource() => _favDatasource;

  final dbHelper = DatabaseHelper.instance;



  Future<int> addToFavourite(Favourites fav) async {

    Map<String, dynamic> row = FavouritesDAO.fromObject(fav).toMap();
    final id = await dbHelper.insertOrUpdate(row, dbHelper.table_favourites);
    print('Added User to favorites: $id');
    return id;
  }

  Future<List<Favourites>> getAllFavourites() async {
    List<Favourites> list = List();

    var result = await dbHelper.queryAllRows(dbHelper.table_favourites);

    result.forEach((row) => {list.add(FavouritesDAO.fromMap(row).toObject())});

    return list;
  }

  Future removeFromFavourite(Favourites fav) async {

    final rowsDeleted =
        await dbHelper.delete(fav.id, dbHelper.table_favourites);
    print('Removed $rowsDeleted row(s): row $fav.pk');
  }

  Future<bool> isAddedToFavourites(Hit user) async {
    var result =
    await dbHelper.queryAllRowsWhere(dbHelper.table_favourites, user.id);

    return result.length > 0;
  }
}
