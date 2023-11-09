import 'package:flutter/material.dart';
import 'dart:math';

class CarPainter extends CustomPainter {
  late double animation;

  CarPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    var middle = size / 2;

    Offset posicao = Offset(middle.width - 200, middle.height + 50);
    Offset tamanho = Offset(middle.width + 200, middle.height - 50);
    _carroceria(canvas, posicao, tamanho);

    posicao = Offset(middle.width - 100, middle.height - 150);
    tamanho = Offset(middle.width + 100, middle.height);
    _carroceria(canvas, posicao, tamanho);

    posicao = Offset(middle.width - 92, middle.height - 142);
    tamanho = Offset(middle.width + 92, middle.height - 50);
    _vidro(canvas, posicao, tamanho);

    posicao = Offset(middle.width - 100, middle.height + 100);
    _roda(canvas, posicao, 100, 'frente');

    posicao = Offset(middle.width + 100, middle.height + 100);
    _roda(canvas, posicao, 100, 'tras');

    posicao = Offset(0, middle.height + 150);
    tamanho = Offset(size.width, middle.height + 150);
    _chao(canvas, posicao, tamanho);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _carroceria(Canvas prCanvas, Offset posicao, Offset tamanho) {
    Paint vrPaint = Paint();
    vrPaint.style = PaintingStyle.fill;
    vrPaint.color = Colors.red;
    prCanvas.drawRect(
        Rect.fromLTRB(posicao.dx, posicao.dy, tamanho.dx, tamanho.dy), vrPaint);
  }

  void _vidro(Canvas prCanvas, Offset posicao, Offset tamanho) {
    Paint vrPaint = Paint();
    vrPaint.style = PaintingStyle.fill;
    vrPaint.color = Colors.blue;
    prCanvas.drawRect(
        Rect.fromLTRB(posicao.dx, posicao.dy, tamanho.dx, tamanho.dy), vrPaint);
  }

  void _roda(Canvas prCanvas, Offset posicao, double prSize, String local) {
    late Color firstColor;
    late Color secondColor;
    firstColor = local == 'frente'
        ? Colors.grey
        : const Color.fromARGB(255, 146, 146, 146);
    secondColor = local == 'tras'
        ? Colors.grey
        : const Color.fromARGB(255, 146, 146, 146);

    Paint vrPaint = Paint();

    vrPaint.style = PaintingStyle.fill;
    vrPaint.color = firstColor;
    prCanvas.drawArc(
      Rect.fromCenter(center: posicao, width: prSize, height: prSize),
      animation,
      2 * pi,
      false,
      vrPaint,
    );

    vrPaint.style = PaintingStyle.fill;
    vrPaint.color = secondColor;
    prCanvas.drawArc(
      Rect.fromCenter(center: posicao, width: prSize, height: prSize),
      animation,
      pi,
      false,
      vrPaint,
    );
  }

  void _chao(Canvas prCanvas, Offset posicao, Offset tamanho) {
    Paint vrPaint = Paint();
    vrPaint.style = PaintingStyle.stroke;
    var green = (animation * 7).round() > 125 ? (animation * 7).round() : 125;
    vrPaint.color = Color.fromARGB(255, 44, green, 47);
    vrPaint.strokeWidth = 5;
    prCanvas.drawLine(posicao, tamanho, vrPaint);
  }
}
