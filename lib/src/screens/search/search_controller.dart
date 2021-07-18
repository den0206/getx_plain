import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_plain/src/data/sample_cars.dart';
import 'package:getx_plain/src/model/car.dart';
import 'package:getx_plain/src/model/dealer.dart';

class SearchController extends GetxController {
  List<Car> cars = [];
  List<Dealer> dealers = [];

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    cars = sampleCars;
    dealers = dealers;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
