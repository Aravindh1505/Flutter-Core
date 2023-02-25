import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../base.dart';

class AdaptiveProgress extends StatelessWidget with Base {
  AdaptiveProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIOS
        ? const CupertinoActivityIndicator(radius: 30.0)
        : const CircularProgressIndicator(strokeWidth: 5.0);
  }
}
