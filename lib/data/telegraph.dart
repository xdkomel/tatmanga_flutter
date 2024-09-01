import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class Telegraph {
  Future<Either<String, Iterable<String>>> getImagesUrls(
    String mangaName,
  ) async {
    final url = Uri.https(
      'api.telegra.ph',
      'getPage/$mangaName',
      {
        'return_content': 'true',
      },
    );
    final response = await get(url);
    return _parseImagesUrls(response.body);
  }

  Either<String, Iterable<String>> _parseImagesUrls(String responseBody) {
    return throwable(() {
      final data = jsonDecode(responseBody) as Map<String, dynamic>;
      final figures = data['result']['content'] as List;
      return figures.expand((obj) {
        final children = obj['children'] as List;
        return children
            .map(
              (ch) => ch['tag'] == 'img' ? ch['attrs']['src'] as String : null,
            )
            .nonNulls
            .map(
              (path) => 'https://telegra.ph$path',
            );
      });
    }).mapLeft((e) => '${e.$1}');
  }
}
