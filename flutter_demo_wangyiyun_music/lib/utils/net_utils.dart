import 'dart:core';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wangyiyun_music/model/recommend.dart';
import 'package:flutter_demo_wangyiyun_music/model/user.dart';
import 'package:flutter_demo_wangyiyun_music/pages/loading.dart';
import 'package:flutter_demo_wangyiyun_music/route/routes.dart';
import 'package:flutter_demo_wangyiyun_music/utils/utils.dart';
import 'package:flutter_demo_wangyiyun_music/model/banner.dart' as mBanner;
import 'package:path_provider/path_provider.dart';

import '../application.dart';
import 'custom_log_interceptor.dart';
import 'navigator_service.dart';

class NetUtils {
  static Dio _dio;
  static final String baseUrl = '192.168.1.101';

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar jar = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: '$baseUrl:1020', followRedirects: true))
      ..interceptors.add(CookieManager(jar))
      ..interceptors
          .add(CustomLogInterceptor(requestBody: true, responseBody: true));
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> param,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      return _dio.get(url, queryParameters: param);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      Application.getIt<NavigatorService>().popAndPushNamed(Routes.login);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  static Future<User> login(
      BuildContext context, String phone, String password) async {
    var response = await _get(context, '/login/cellphone',
        param: {'phone': phone, 'password': password});
    return User.fromJson(response.data);
  }
  
  static Future<mBanner.Banner> getBannerData(BuildContext context) async{
    var response = await _get(context, '/recommend/resource');
    return mBanner.Banner.fromJson(response.data);
  }
}
