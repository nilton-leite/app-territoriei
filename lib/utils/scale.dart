import 'dart:ui';

final _screenWidth = window.physicalSize.width / window.devicePixelRatio;
final _screenHeight = window.physicalSize.height / window.devicePixelRatio;

///Guideline base height
const baseHeight = 640;

///Guideline base width
const baseWidth = 360;

///Round [size] to nearest pixel
double roundToNearestPixel(double size) {
  final ratio = window.devicePixelRatio;
  return (size * ratio).round() / ratio;
}

///Scale the [size] from the dimensions of the cell phone
double scale(double size) {
  if (_screenWidth < baseWidth || _screenHeight < baseHeight) {
    return roundToNearestPixel(
      (_screenWidth / baseWidth) * (_screenHeight / baseHeight) * size,
    );
  }
  return roundToNearestPixel(size);
}
