import 'package:get/get.dart';

class SliderOpacityController extends GetxController {
  RxDouble opacity = 0.2.obs;
  sliderOpacity(double value) {
    opacity.value = value;
  }
}
