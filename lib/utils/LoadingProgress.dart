import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingProgress {
  static inProgress(Function function) async {
    await EasyLoading.show(status: 'Loading..');
    await function();
    // await Future.delayed(const Duration(seconds: 1));
    await EasyLoading.dismiss();
  }
}
