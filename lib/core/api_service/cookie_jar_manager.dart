import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

class CookieJarManager {
  PersistCookieJar? _cookieJar;

// 使用 PersistCookieJar，在文檔中有介紹，PersistCookieJar將cookie保留在文件中，因此，如果應用程序退出，則cookie始終存在，除非顯式調用delete  static PersistCookieJar _cookieJar;
  Future<PersistCookieJar> get cookieJar async {
    if (_cookieJar == null) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      _cookieJar = PersistCookieJar(
        ignoreExpires: true,
        storage: FileStorage(appDocPath),
      );
    }
    return _cookieJar ?? PersistCookieJar();
  }
}
