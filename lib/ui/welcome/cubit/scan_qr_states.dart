abstract class ScanQrStates {}

class ScanQrInitialState extends ScanQrStates {}

class ScanQrLoadingState extends ScanQrStates {
  final String loadingMessage;

  ScanQrLoadingState({required this.loadingMessage});
}

class ScanQrErrorState extends ScanQrStates {
  final String errorMessage;

  ScanQrErrorState({required this.errorMessage});
}

class ScanQrSuccessState extends ScanQrStates {
  ScanQrSuccessState();
}
