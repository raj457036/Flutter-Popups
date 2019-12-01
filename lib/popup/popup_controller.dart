class PopupController {
  Function _toOpen, _toClose;
  bool _opened = false;

  PopupController();

  set setOpen(Function _) => _toOpen = _;
  set setClose(Function _) => _toClose = _;

  ///close connected popup
  closePopup() {
    _toClose();
    _opened = false;
  }

  /// open connected popup
  openPopup() {
    _toOpen();
    _opened = true;
  }

  /// getter to know the state of popup
  get opened => _opened;
}
