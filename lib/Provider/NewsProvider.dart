import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:rxdart/rxdart.dart';

class NewsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _NewsController = BehaviorSubject<NewsModel>();

  Stream<NewsModel> get getStream {
    return _NewsController.stream;
  }

  Future<NewsModel?> getNews(int id) async {
    var result = await _apiHelper.NewsGet(id: id);
    if (result != null) {
      _NewsController.add(result);
      return result;
    }
  }

  Future<List<NewsModel>?> getAllNews() async {
    var result = await _apiHelper.NewsGetAll();
    if (result != null) {
      for (var data in result) {
        _NewsController.add(data);
      }
      return result;
    }
  }

  Future<ResponseModel> NewsHandler({
    required NewsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.NewsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
