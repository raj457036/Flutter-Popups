import 'package:flutter/material.dart';

import 'popup_controller.dart';

enum CaretSide {
  TOP,
  LEFT,
  BOTTOM,
  RIGHT,
}

/// clipper for popup shape
class PopupRRClipper extends CustomClipper<Path> {
  final double offset;
  final double caretSize;
  final double gap = 18.0;
  final CaretSide side;
  double radius;
  final bool roundedCorner;

  PopupRRClipper({
    this.offset = 12.0,
    this.caretSize = 5.0,
    this.side,
    this.roundedCorner = false,
  }) {
    roundedCorner ? radius = 3.0 : radius = 0.0;
  }

  double _getOffset(double dimen) {
    if (offset > dimen) return dimen - 2 * gap;
    return offset;
  }

  Path _getTopCaret(Size size) {
    Path path = Path();

    path.moveTo(caretSize, caretSize);

    // caret start
    path.lineTo(gap + _getOffset(size.width) - caretSize, caretSize);
    path.lineTo(gap + _getOffset(size.width), 0.0);
    path.lineTo(gap + _getOffset(size.width) + caretSize, caretSize);
    // caret end

    path.lineTo(size.width - caretSize - radius, caretSize);
    path.arcToPoint(Offset(size.width - caretSize, radius + caretSize),
        radius: Radius.circular(radius));

    path.lineTo(size.width - caretSize, size.height - caretSize - radius);
    path.arcToPoint(
        Offset(size.width - caretSize - radius, size.height - caretSize),
        radius: Radius.circular(radius));

    path.lineTo(caretSize + radius, size.height - caretSize);
    path.arcToPoint(Offset(caretSize, size.height - caretSize - radius),
        radius: Radius.circular(radius));

    path.lineTo(caretSize, caretSize + radius);
    path.arcToPoint(Offset(caretSize + radius, caretSize),
        radius: Radius.circular(radius));
    path.close();

    return path;
  }

  Path _getRightCaret(Size size) {
    Path path = Path();
    path.moveTo(caretSize, caretSize);

    path.lineTo(size.width - caretSize - radius, caretSize);
    path.arcToPoint(Offset(size.width - caretSize, radius + caretSize),
        radius: Radius.circular(radius));

    // caret start
    path.lineTo(
        size.width - caretSize, gap + _getOffset(size.height) - caretSize);
    path.lineTo(size.width, gap + _getOffset(size.height));
    path.lineTo(
        size.width - caretSize, gap + _getOffset(size.height) + caretSize);
    // caret end

    path.lineTo(size.width - caretSize, size.height - caretSize - radius);
    path.arcToPoint(
        Offset(size.width - caretSize - radius, size.height - caretSize),
        radius: Radius.circular(radius));

    path.lineTo(caretSize + radius, size.height - caretSize);
    path.arcToPoint(Offset(caretSize, size.height - caretSize - radius),
        radius: Radius.circular(radius));

    path.lineTo(caretSize, caretSize + radius);
    path.arcToPoint(Offset(caretSize + radius, caretSize),
        radius: Radius.circular(radius));
    path.close();

    return path;
  }

  Path _getBottomCaret(Size size) {
    Path path = Path();

    path.moveTo(caretSize, caretSize);

    path.lineTo(size.width - caretSize - radius, caretSize);
    path.arcToPoint(Offset(size.width - caretSize, radius + caretSize),
        radius: Radius.circular(radius));

    path.lineTo(size.width - caretSize, size.height - caretSize - radius);
    path.arcToPoint(
        Offset(size.width - caretSize - radius, size.height - caretSize),
        radius: Radius.circular(radius));

    // caret start
    path.lineTo(
        gap + _getOffset(size.width) - caretSize, size.height - caretSize);
    path.lineTo(gap + _getOffset(size.width), size.height);
    path.lineTo(
        gap + _getOffset(size.width) + caretSize, size.height - caretSize);
    // caret start

    path.lineTo(caretSize + radius, size.height - caretSize);
    path.arcToPoint(Offset(caretSize, size.height - caretSize - radius),
        radius: Radius.circular(radius));

    path.lineTo(caretSize, caretSize + radius);
    path.arcToPoint(Offset(caretSize + radius, caretSize),
        radius: Radius.circular(radius));
    path.close();

    return path;
  }

  Path _getLeftCaret(Size size) {
    Path path = Path();

    path.moveTo(caretSize, caretSize);

    path.lineTo(size.width - caretSize - radius, caretSize);
    path.arcToPoint(Offset(size.width - caretSize, radius + caretSize),
        radius: Radius.circular(radius));

    path.lineTo(size.width - caretSize, size.height - caretSize - radius);
    path.arcToPoint(
        Offset(size.width - caretSize - radius, size.height - caretSize),
        radius: Radius.circular(radius));

    path.lineTo(caretSize + radius, size.height - caretSize);
    path.arcToPoint(Offset(caretSize, size.height - caretSize - radius),
        radius: Radius.circular(radius));

    // carret start
    path.lineTo(caretSize, gap + _getOffset(size.height) - caretSize);
    path.lineTo(0.0, gap + _getOffset(size.height));
    path.lineTo(caretSize, gap + _getOffset(size.height) + caretSize);
    // caret end
    path.lineTo(caretSize, caretSize + radius);
    path.arcToPoint(Offset(caretSize + radius, caretSize),
        radius: Radius.circular(radius));
    path.close();

    return path;
  }

  @override
  getClip(Size size) {
    if (side == CaretSide.TOP)
      return _getTopCaret(size);
    else if (side == CaretSide.LEFT)
      return _getLeftCaret(size);
    else if (side == CaretSide.RIGHT)
      return _getRightCaret(size);
    else
      return _getBottomCaret(size);
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class Popup extends StatefulWidget {
  final PopupController controller;

  /// CaretSize is the size for the caret arrow in popup
  final double caretSize;

  /// Weather you want the popup bubble have rounded corners
  final bool rounded;

  /// [content] for the popup
  final Widget content;

  /// [child] that trigger popup on click event
  final Widget child;

  /// [size] of popup bubble
  /// give a fix [width] to fit your need
  /// give enough [height] for the content to render correctly though you can also put
  /// your content in a single scrollable widget
  final Size size;

  Popup({
    this.controller,
    this.caretSize = 6.0,
    this.rounded = true,
    this.content,
    this.size = const Size(300.0, null),
    @required this.child,
  });

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  OverlayEntry entry;
  final GlobalKey _key = GlobalKey();
  double offset = 0.0;
  bool opened = false;
  CaretSide side = CaretSide.TOP;

  @override
  void initState() {
    super.initState();
    widget.controller?.setOpen = _openPopup;
    widget.controller?.setClose = _closePopup;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      child: widget.child,
      onTap: opened ? _closePopup : _openPopup,
    );
  }

  _closePopup() {
    entry?.remove();
    setState(() {
      opened = false;
    });
  }

  Widget _getPopup() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: ClipPath(
        clipper: PopupRRClipper(
          side: side,
          offset: offset,
          caretSize: widget.caretSize,
          roundedCorner: widget.rounded,
        ),
        child: Container(
          padding: EdgeInsets.all(widget.caretSize + 5.0),
          child: SingleChildScrollView(
            child: Material(child: widget.content),
          ),
          color: Colors.white,
        ),
      ),
    );
  }

  _openPopup() {
    final RenderBox box = _key.currentContext.findRenderObject();
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;
    final height = MediaQuery.of(context).size.height;

    final state = Overlay.of(context);

    setState(() {
      opened = true;
      offset = position.dx - widget.caretSize;

      side = height - position.dy < 100 ? CaretSide.BOTTOM : CaretSide.TOP;

      entry = OverlayEntry(builder: (context) {
        return Positioned(
          child: _getPopup(),
          width: widget.size.width,
          height: widget.size.height,
          top: height - position.dy > 100 ? position.dy + size.height : null,
          bottom: height - position.dy < 100
              ? size.height + widget.caretSize + 5.0
              : null,
          right: position.dx > widget.size.width ? 0 : null,
        );
      });

      state.insert(entry);
    });
  }
}
