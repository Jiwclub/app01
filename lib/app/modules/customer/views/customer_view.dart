import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_controller.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomerView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          // height: 54,
                          child: TextFormField(
                            controller: controller.customerNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.addCustomerName();
                        },
                        child: const Text("เพิ่ม"),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = controller.listCustomer[index];

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Text('${item['customer_name']}')),
                              IconButton(
                                  onPressed: () {
                                    controller.editCustomerNameController.text =
                                        item['customer_name'];
                                    _showDialogEdit(context, '${item['id']}');
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                onPressed: () {
                                  controller
                                      .deleteCustomerName('${item['id']}');
                                },
                                icon: const Icon(Icons.delete),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: controller.listCustomer.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogEdit(
    BuildContext context,
    dynamic id,
  ) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("titleName")),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: Get.width,
                  child: TextField(
                    controller: controller.editCustomerNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            9.0,
                          ),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(),
                      hintText: "",
                      contentPadding: EdgeInsets.only(left: 18, top: 8),
                    ),
                    textInputAction: TextInputAction.go,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('กลับ'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                controller.editCustomerName(id);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
