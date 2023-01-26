import 'package:get/get.dart';

ValidatInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not validate email";
    }
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not validate username";
    }
  }
  if (val.length < min) {

      return "canot be less $min";
   }
  if (val.length > max) {

      return "canot be larger $max";
   }
  if (val.isEmpty) {

      return "canot be empty";
   }
}
