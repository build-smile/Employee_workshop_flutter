class HttpStatusMsg {
  late bool success;
  String? errorMsg;
  Object? result;
  HttpStatusMsg({this.success = true, this.result, this.errorMsg});
}
