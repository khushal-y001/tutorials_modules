import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/counter_controller.dart';
class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterController controller = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: SafeArea(
            child: Obx(() {
                return Center(
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            onPressed: () async{
                             await controller.uploadFile();
                            },
                            child: const Text("Upload file")),
                        Row(
                          children: [
                            Expanded(child: IconButton(onPressed: (){
                              controller.increment();
                            },icon: const Icon(Icons.add_circle),)),
                             Text("${controller.count}",style:const TextStyle(
                              fontSize: 20,
                            ),),
                            Expanded(child: IconButton(onPressed: (){
                              controller.decrement();
                            },icon: const Icon(Icons.remove_circle),)),
                          ],
                        )
                      ],
                    )
                );
              }
            ),
          )
    );
  }
}
