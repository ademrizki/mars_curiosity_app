import 'package:dio/dio.dart';
import 'package:mars_curiosity_app/lib/models/curiosity_images.dart';
import 'package:mars_curiosity_app/lib/resources/urls.dart';

class CuriosityServices {
  final Dio _dio = Dio();

  Future<CuriosityImages> fetchCuriosityImages({String page = '1'}) async {
    final String _url = URL.BASE_URL + 'sol=50&page=$page&api_key=g1hZJSvPQug04vlF2sFgaAl1ktc5S9ftTKBivxuc';

    final Response _response = await _dio.get(
      _url,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => status < 500,
      ),
    );

    return CuriosityImages.fromJson(_response.data);
  }
}
