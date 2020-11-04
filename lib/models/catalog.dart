import 'package:gutenberg_flutter/services/networking.dart';

const bookAPIUrl = 'http://gutendex.com/books/?mime_type=image%2Fjpeg';

class CatalogModel {
  Future<dynamic> getBooks(String category) async {
    var url = '$bookAPIUrl&topic=$category';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var catalogData = await networkHelper.getData();
    return catalogData;
  }

  Future<dynamic> searchBooks(String category, String searchQuery) async {
    var url = '$bookAPIUrl?topic=$category';
    NetworkHelper networkHelper = NetworkHelper(url);
    var catalogData = await networkHelper.getData();
    return catalogData;
  }
}
