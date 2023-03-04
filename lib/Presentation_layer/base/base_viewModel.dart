abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutPuts {
  // Abs.. Fun Will be overrided on Each ViewModel..
}

abstract class BaseViewModelInputs {
  // Start BaseViewModel..
  void start();

  //Dispose To End BaseViewModel..
  void dispose();
}

abstract class BaseViewModelOutPuts {
  // Implementation ..
}
