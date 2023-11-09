import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Exercicio01());
}

class Exercicio01 extends StatelessWidget {
  const Exercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController animContWidth;
  late AnimationController animContHeight;
  late Animation<double> animWidth;
  late Animation<double> animHeight;
  late double widthScreen;
  late double heightScreen;
  late double contMaxWidth;
  late double contMaxHeight;
  late Color tempColor;
  final double paddingStack = 10;
  final double sizeIcon = 75;
  final double appBarHeight = 56;
  final double contMinHeight = 95;
  final int animationDuration = 2;
  Color iconColor = Colors.green;
  bool isTop = true;
  bool isRight = false;
  bool isBotton = false;
  bool isLeft = false;
  bool isPausado = false;
  double angle = 0 * pi / 180;
  int voltas = 0;

  @override
  void initState() {
    super.initState();
    animContWidth = AnimationController(
        vsync: this, duration: Duration(seconds: animationDuration));
    animContHeight = AnimationController(
        vsync: this, duration: Duration(seconds: animationDuration));

    animContWidth.addListener(() {
      setState(() {});
    });

    animContHeight.addListener(() {
      setState(() {});
    });

    animContWidth.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (isTop) {
          isTop = false;
          isRight = true;
          angle = 90 * pi / 180;
          iconColor = _gerarCor(iconColor);
          animContHeight.forward();
          return;
        }
      }

      if (status == AnimationStatus.dismissed) {
        if (isBotton) {
          isBotton = false;
          isLeft = true;
          angle = 270 * pi / 180;
          iconColor = _gerarCor(iconColor);
          animContHeight.reverse();
          return;
        }
      }
    });

    animContHeight.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (isRight) {
          isRight = false;
          isBotton = true;
          angle = 180 * pi / 180;
          iconColor = _gerarCor(iconColor);
          animContWidth.reverse();
          return;
        }
      }

      if (status == AnimationStatus.dismissed) {
        if (isLeft) {
          voltas++;
          isLeft = false;
          isTop = true;
          angle = 0 * pi / 180;
          iconColor = _gerarCor(iconColor);
          animContWidth.forward();
        }
      }
    });

    animContWidth.forward();
  }

  @override
  void dispose() {
    animContWidth.dispose();
    super.dispose();
  }

  Color _gerarCor(Color corAtual) {
    int tempColor = Random().nextInt(Colors.primaries.length);
    while (tempColor == corAtual.value) {
      tempColor = Random().nextInt(Colors.primaries.length);
    }
    return Colors.primaries[tempColor];
  }

  double _valorLeft() {
    if ((isTop) || (isBotton)) {
      return this.animWidth.value;
    }
    if (isRight) {
      return widthScreen;
    }
    return 0;
  }

  double _valorTop() {
    if ((isRight) || (isLeft)) {
      return this.animHeight.value;
    }
    if (isBotton) {
      return heightScreen;
    }
    return 0;
  }

  String _calculaPercentual() {
    int percent = (isTop || isBotton)
        ? (animContWidth.value * 100).round()
        : (animContHeight.value * 100).round();
    percent = (isLeft || isBotton) ? 100 - percent : percent;

    return '${percent.toString()}%';
  }

  void _pausar() {
    setState(() {
      isPausado = !isPausado;
    });
    if (isPausado) {
      tempColor = iconColor;
      iconColor = Colors.grey;
      animContWidth.stop();
      animContHeight.stop();
    } else {
      iconColor = tempColor;
      if (isTop) {
        animContWidth.forward();
      } else if (isRight) {
        animContHeight.forward();
      } else if (isBotton) {
        animContWidth.reverse();
      } else {
        animContHeight.reverse();
      }
    }
  }

  void _reiniciar() {
    animContWidth.reset();
    animContHeight.reset();
    isTop = true;
    isRight = false;
    isBotton = false;
    isRight = false;
    voltas = 0;
    angle = 0 * pi / 180;
    animContWidth.forward();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    widthScreen = (deviceInfo.size.width - sizeIcon - (paddingStack * 2));
    heightScreen =
        (deviceInfo.size.height - sizeIcon - (paddingStack * 2) - appBarHeight);
    contMaxWidth = widthScreen - 50;
    contMaxHeight = heightScreen - 50;

    animWidth =
        Tween<double>(begin: 0, end: widthScreen).animate(animContWidth);

    animHeight =
        Tween<double>(begin: 0, end: heightScreen).animate(animContHeight);

    //print('Top:$isTop | Right:$isRight | Botton:$isBotton | Left:$isLeft');
    //print('${iconColor.red}, ${iconColor.green}, ${iconColor.blue} - ${iconColor.value}');

    return Scaffold(
      appBar: AppBar(title: const Text('Exercício 1')),
      body: Padding(
        padding: EdgeInsets.all(paddingStack),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _pausar,
          onDoubleTap: _reiniciar,
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border(
                          top: isTop
                              ? BorderSide(color: iconColor, width: 2)
                              : BorderSide.none,
                          left: isLeft
                              ? BorderSide(color: iconColor, width: 2)
                              : BorderSide.none,
                          right: isRight
                              ? BorderSide(color: iconColor, width: 2)
                              : BorderSide.none,
                          bottom: isBotton
                              ? BorderSide(color: iconColor, width: 2)
                              : BorderSide.none)),
                  constraints: BoxConstraints(minHeight: contMinHeight),
                  height: contMaxHeight,
                  width: contMaxWidth,
                  //color: Colors.grey[300],
                  child: Center(
                    child: isPausado
                        ? const Icon(
                            Icons.pause_circle_outline,
                            size: 75,
                            color: Colors.grey,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_calculaPercentual(),
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.grey)),
                              Text('${voltas}x',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.grey)),
                            ],
                          ),
                  ),
                ),
              ),
              Positioned(
                  left: _valorLeft(),
                  top: _valorTop(),
                  child: Transform.rotate(
                    angle: angle,
                    child: Icon(
                      Icons.agriculture_outlined,
                      size: sizeIcon,
                      color: iconColor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
