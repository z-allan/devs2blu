class Retangulo {
  int largura;
  int altura;

  Retangulo({required this.largura, required this.altura});

  int getLargura() {
    return largura;
  }

  void setLargura(int largura) {
    this.largura = largura;
  }

  int getAltura() {
    return altura;
  }

  void setAltura(int altura) {
    this.altura = altura;
  }

  int getArea() {
    return largura * altura;
  }
}

class Quadrado extends Retangulo {

  Quadrado(int tamanho): super(altura: tamanho, largura: tamanho);

  @override
  void setLargura(int largura) {
    super.setLargura(largura);
    super.setAltura(largura);
  }

  @override
  void setAltura(int altura) {
    super.setAltura(altura);
    super.setLargura(altura);
  }
}

class Teste {
  void getAreaTeste(Retangulo r) {
    int largura = r.getLargura();
    r.setAltura(10);
    print("Área esperada de ${largura * 10}, obteve ${r.getArea()}");
  }
}

void main() {
  Teste teste = Teste();

  Retangulo rc = Retangulo(largura: 2, altura: 3);
  teste.getAreaTeste(rc);

  Retangulo sq = Quadrado(5);
  teste.getAreaTeste(sq);
}