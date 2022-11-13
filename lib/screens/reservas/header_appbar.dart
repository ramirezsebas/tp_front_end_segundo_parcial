
import 'package:flutter/material.dart';

import 'reserva_screen.dart';
import 'gradient_back.dart';

class HeaderAppBar extends StatelessWidget{
    @override
  Widget build(BuildContext context){
      return Stack(
        children: [
          GradientBack(height: null),
        ],
      );
    }
}