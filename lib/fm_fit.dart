library fm_fit;

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

/*
 * Created by hanaogu on 2018/3/22.
 * email: hanaogu@gmail.com
 */
class FmFit {
  FmFit({this.width: 750}) {
    _devWidth = window.physicalSize.width;
  }

  /// 设计稿的屏幕宽
  final int width;
  // 缩放比例
  double get scale => _scale;
  set scale(v) {
    _scale = v;
  }

  // 实际设备屏幕宽
  double _devWidth = 0.0;

  // 缩放比例
  double _scale = 1.0;

  // 转换函数
  double t(double value) {
    return this._t(value) / window.devicePixelRatio;
  }

  EdgeInsets fromLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(t(left), t(top), t(right), t(bottom));
  }

  EdgeInsets all(double value) {
    return EdgeInsets.all(t(value));
  }

  EdgeInsets only(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return EdgeInsets.only(
      left: t(left),
      top: t(top),
      right: t(right),
      bottom: t(bottom),
    );
  }

  double _t(double value) {
    if (value > -1e-6 && value < 1e-6) {
      return value;
    }
    if (Platform.isIOS) {
      if (value < 1) {
        return 0.5 * _scale;
      }
      return value * 0.5 * _scale;
    }
    var s = _devWidth / this.width;

    var r = (value * s + 0.5).floor();
    return (r > 1 ? r : 1) * _scale;
  }
}
