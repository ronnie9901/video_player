
import 'dart:developer';
import 'package:get/get.dart';
import 'package:video_player/model/mdel.dart';

class ApiController extends GetxController {
  MusicModal? musicModal;

var ccl = false;
  void click (bool click)
  {
    ccl!=click;
  }
 var search ='';
  void searchImage(String value) {
    search = value;
  }
}
