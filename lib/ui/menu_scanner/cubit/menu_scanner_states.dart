abstract class MenuScannerStates {}

class ScanQrInitialState extends MenuScannerStates {}

class ScanQrLoadingState extends MenuScannerStates {
  final String loadingMessage;

  ScanQrLoadingState({required this.loadingMessage});
}

class ScanQrErrorState extends MenuScannerStates {
  final String errorMessage;

  ScanQrErrorState({required this.errorMessage});
}

class ScanQrSuccessState extends MenuScannerStates {
  ScanQrSuccessState();
}
