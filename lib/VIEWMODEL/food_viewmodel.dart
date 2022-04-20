
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:truq_test/model/food_models.dart';

import '../API/api.dart';

enum Status { LOADING, READY, FAILED}

class FoodViewModel extends Model {
  Status? status;
  API _api = API();
  Food? _food;
  String? _errorMessage;


  Food? get FoodList  => _food;
  String? get Errormessage => _errorMessage;

  void getFood() async {
    status = Status.LOADING;
    notifyListeners();
    _api.getFoodList().then((res){
      log(res.body.toString());
      if(res.statusCode == 200 ){
        status = Status.READY;
        _food = Food.fromJson(json.decode(res.body));
        notifyListeners();
      }else {
        status = Status.FAILED;
        _errorMessage = "An Unknown error occured";
        notifyListeners();
      }
    });
  }

}