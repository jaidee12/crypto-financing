import 'package:get/get.dart';

class NavigationController extends GetxController{
  var currentindex= 0.obs;

  void changeIndex (int index){
    currentindex.value = index;

  }

}