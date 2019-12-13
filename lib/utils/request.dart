import 'package:dio/dio.dart';
import 'package:hello_cnode/models/home.dart';
import 'package:hello_cnode/models/detail.dart';
import 'package:hello_cnode/models/userCenter.dart';
import 'package:hello_cnode/models/userDetail.dart';
import 'package:hello_cnode/utils/utils.dart';

/// this is the base request class
const BASE_URL = 'https://cnodejs.org';
const CONNECT_TIME_OUT = 5000;
const RECEIVE_TIME_OUT = 5000;

BaseOptions options = new BaseOptions(
  baseUrl: BASE_URL,
  connectTimeout: CONNECT_TIME_OUT,
  receiveTimeout: RECEIVE_TIME_OUT,
);
Dio dio = new Dio(options);

class Request {

  static Home _returnAvatar(Home home) {
    home.author.avatarUrl = Utils.randomAvatar();
    return home;
  }
  // 首页数据
  static Future<List<Home>> getHomeData(String tab, [int page = 1]) async {
    List<Home> _homeData = [];
    if (tab == 'index') {
      tab = '';
    }
    try {
      Response response = await dio.get('/api/v1/topics',
          queryParameters: {"mdrender": false, "tab": tab, "page": page});
      if (response.data['success']) {
        _homeData = List<Home>.from(
            response.data['data'].map((item) => _returnAvatar(Home.fromJson(item))));
      } else {
        _homeData = [];
      }
    } catch (e) {
      print(e);
    }
    return _homeData;
  }

  // 详情页数据
  static Future<Detail> getDetailData(String id, String token) async {
    Detail _detailData;
    try {
      Response response = await dio.get('/api/v1/topic/$id', queryParameters: { 'mdrender': false, 'accesstoken': token });
      if (response.data['success']) {
        _detailData = Detail.fromJson(response.data['data']);
      }
    } catch (e) {
      print(e);
    }
    return _detailData;
  }

  // 个人中心数据
  static Future<UserCenter> getUserCenter(String loginName) async {
    UserCenter _userCenter;
    try {
      Response response =
          await dio.get('/api/v1/user/$loginName');
      if (response.data['success']) {
        _userCenter = UserCenter.fromJson(response.data['data']);
      }
    } catch (e) {
      print(e);
    }
    return _userCenter;
  }

  // 获取用户收藏
  static Future<List<UserDetail>> getUserCollect(String loginName) async {
    List<UserDetail> _collect;
    try {
      Response response = await dio.get('/api/v1/topic_collect/$loginName');
      if (response.data['success']) {
        _collect = List<UserDetail>.from(
          response.data['data'].map((item) => UserDetail.fromJson(item)));
      } else {
        _collect = [];
      }
    } catch (e) {
      print(e);
    }
    return _collect;
  }

  // 收藏内容
  static Future<bool> collectContent(String topicId, String accessToken) async {
    bool _isSuccess = false;
    try {
      Response response = await dio.post('/api/v1/topic_collect/collect', data: { 'topic_id': topicId, 'accesstoken': accessToken });
      if (response.data['success']) {
        _isSuccess = true;
      }
    } catch (e) {
      print(e);
    }
    return _isSuccess;
  }


}
