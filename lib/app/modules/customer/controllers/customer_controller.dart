import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CustomerController extends GetxController {
  var uuid = const Uuid();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController editCustomerNameController = TextEditingController();
  var listCustomer = [].obs;

  void addCustomerName() {
    if (customerNameController.text.isEmpty) return;
    listCustomer.insert(0, {
      "id": uuid.v1(),
      "customer_name": customerNameController.text,
    });

    customerNameController.clear();
  }

  void editCustomerName(dynamic id) {
    for (var element in listCustomer) {
      if (element['id'] == id) {
        element['customer_name'] = editCustomerNameController.text;
        editCustomerNameController.clear();
      }
    }
    listCustomer.refresh();
  }

  void deleteCustomerName(dynamic id) {
    listCustomer.removeWhere((element) => element['id'] == id);
  }
}
