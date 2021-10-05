import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Model/core/RolesModel.dart';
import 'package:flutter_project/Model/core/response_model.dart';
import 'package:flutter_project/Model/helper/api_helper.dart';
import 'package:flutter_project/Provider/ImageProvider.dart';
import 'package:rxdart/rxdart.dart';

class NewsProvider extends ChangeNotifier {
  final _apiHelper = ApiHelper();
  final _NewsController = BehaviorSubject<NewsModel>();
  final _NewsListController = BehaviorSubject<List<NewsModel>>();

  get NewsController => _NewsController.stream;
  get NewsListController => _NewsListController.stream;

  Future<NewsModel?> getNews(int id) async {
    var result = await _apiHelper.newsGet(id: id);
    if (result != null) {
      _NewsController.add(result);
      return result;
    }
  }

  Future<List<NewsModel>?> getAllNews() async {
    var result = await _apiHelper.newsGetAll();
    // List<NewsModel> result = [];
    // for (var i = 0; i < 10; i++) {
    //   var data = NewsModel(
    //     id: 5,
    //     heading: 'header Sample $i',
    //     message:
    //         'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
    //     userId: 0,
    //     usersModel: null,
    //     imagePath: getImage(),
    //   );
    //   result.add(data);
    // }
    if (result != null) {
      _NewsListController.add(result);
      return result;
    }
  }

  Future<ResponseModel> NewsHandler({
    required NewsModel modelData,
    bool shouldUpdate = false,
  }) async {
    var result = await _apiHelper.newsHandler(
      modelData: modelData,
      shouldUpdate: shouldUpdate,
    );
    return result;
  }
}
