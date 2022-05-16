import 'package:flutter/material.dart';

pushToStack(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

pushToStackAndReplacement(context, widget) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    return widget;
  }));
}

pop(context) {
  Navigator.of(context).pop();
}
