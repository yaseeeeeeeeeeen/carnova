import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:http/http.dart' as http;

Future<List<File>> convertingStringtoImage(List<String> imageUrls) async {
  List<File> imageFiles = [];
  for (String imageUrl in imageUrls) {
    try {
      Uri uri = Uri.parse('${HostUrl.baseUrl}/$imageUrl');
      // ignore: unnecessary_null_comparison
      if (uri.host == null || uri.host.isEmpty) {
        continue;
      }
      final response = await http.get(uri);
      final documentDirectory = await getApplicationDocumentsDirectory();
      final file = File(join(documentDirectory.path, uri.pathSegments.last));
      file.writeAsBytesSync(response.bodyBytes);

      imageFiles.add(file);
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  return imageFiles;
}
