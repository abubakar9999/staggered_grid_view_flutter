import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;

List<DataModel> mydata = [];
late DataModel dataModel;

gethttpData() async {
  var url =
      "https://picsum.photos/v2/list?fbclid=IwAR2qk2kE60PcFr1S3OdDKwH9v6bhfWzmIaByJTvViW2iVnLMtDC4Lg7IyeI";

  var respons = await http.get(Uri.parse(url));

  print(respons.body);

  if (respons.statusCode == 200) {
    var decodeData = jsonDecode(respons.body);

    for (var data in decodeData) {
      dataModel = DataModel.fromJson(data);

      mydata.add(dataModel);
      print("${mydata[0].author}");
    }
  } else {
    print("You APi Didn ritht");
  }

  return mydata;
}
