import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_plain/src/data/samle_dealers.dart';
import 'package:getx_plain/src/data/sample_cars.dart';
import 'package:getx_plain/src/model/car.dart';
import 'package:getx_plain/src/model/dealer.dart';

class HomeController extends GetxController {
  List<Car> cars = [];
  List<Dealer> dealers = [];

  late Car selectedCar;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() {
    cars = sampleCars;
    dealers = sampleDealers;
    selectedCar = cars[3];
  }
}
