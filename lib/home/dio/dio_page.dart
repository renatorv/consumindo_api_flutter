import 'package:consumindo_api_flutter/home/dio/dio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class DioPage extends GetView<DioController> {
  const DioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DioPage'),
      ),
      body: controller.obx(
        (state) {

          return state.length > 0
              ? ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (_, index) {
                    final UserModel item = state[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('Quantidade de types: ${item.userTypes.length}'),
                    );
                  },
                )
              : const SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Nenhum item encontrado!'),
                    ],
                  ),
              );
        },
        onError: (error) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(error ?? 'Erro')],
            ),
          );
        },
      ),
    );
  }
}
