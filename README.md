# Simple Popup Flutter

A simple and tiny popup Widget to achive popup like **Bootstrap 4** or **popper.js** and more in flutter apps.

<img src="./assets/image.png" alt="Flutter Popup" width="350">

## Demo

<img src="./assets/demo.gif" alt="Flutter popups demo" height="720">

## How to use

```
import 'popup/popup.dart'

...

child: Popup(
    content: Container() // any widget,
    child: Icon(Icons.info) // child for trigger,
),

...
```

Thats it 😁

#### If You Liked add a Star 🌟🌟

## Advance Use

```
import 'popup/popup.dart'

...

PopupController _controller = PopupController();

...

child: Popup(
    controller: _controller,
    content: Container() // some widget,
    child: Icon(Icons.info) // some triggering child,
    size: Size(200.0, 300.0) // constraint width and height of popup,
    caretSize: 6.0 // size of caret on popup,
    rounded: true // add a border radius around popup (true by default),
)
...

openPopup() {
    _controller.openPopup();
}

closePopup() {
    _controller.closePopup();
}

isPopupOpened() {
    return _controller.opened;
}
```

Thats it for now...

## Thank you

#### Add a Star ⭐✨ if You liked the Widget
