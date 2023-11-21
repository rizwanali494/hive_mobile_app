
mixin BaseRequestHandler {
  Future<void> performApiRequest(
      {required Future Function() request, Function()? onError}) async {
    try {
      await request.call();
    } catch (error) {
      if (onError != null) {
        onError.call();
      }
    }
  }
}
