class Memoria {
  static const operacoes = ['%', '÷', 'x', '-', '+', '='];
  String _valor = '0';
  String _valorResultado = '0';
  final _armazenar = [0.0, 0.0];
  int _armazenarIndice = 0;
  String? _operacao;
  bool _limparvalor = false;
  String? _ultimocomando;

  void aplicarComando(String comando) {
    if (_ehSubstituicaoComando(comando)) {
      _operacao = comando;
      return;
    }

    if (comando == 'C') {
      _limparTudo();
    } else if (operacoes.contains(comando)) {
      _definirOperacao(comando);
    } else if (comando == '<') {
      _removerDigito(comando);
    } else {
      _adicionarDigito(comando);
    }
    _ultimocomando = comando;
  }

  _ehSubstituicaoComando(String comando) {
    return operacoes.contains(_ultimocomando) &&
        operacoes.contains(comando) &&
        _ultimocomando != '=' &&
        comando != '=';
  }

  _definirOperacao(String novaOperacao) {
    bool EhIgualSinal = novaOperacao == '=';
    if (_armazenarIndice == 0) {
      if (!EhIgualSinal) {
        _operacao = novaOperacao;
        _armazenarIndice = 1;
        _limparvalor = true;
      }
    } else {
      _definirValorResultado();
      _armazenar[0] = _calcular();
      _armazenar[1] = 0.0;
      _valor = _armazenar[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = EhIgualSinal ? null : novaOperacao;
      _armazenarIndice = EhIgualSinal ? 0 : 1;
    }
    _limparvalor = true;
  }

  _definirValorResultado() {
    String operador = _operacao ?? '';
    var valor0 = _armazenar[0].toString().endsWith('.0')
        ? _armazenar[0].toString().split('.')[0]
        : _armazenar[0].toString();

    var valor1 = _armazenar[1].toString().endsWith('.0')
        ? _armazenar[1].toString().split('.')[0]
        : _armazenar[1].toString();
    if (valor0.isNotEmpty && valor1.isNotEmpty && operador.isNotEmpty) {
      _valorResultado = valor0 + ' ' + operador + ' ' + valor1;
    } else {
      _valorResultado = '';
    }
  }

  _adicionarDigito(String digito) {
    final ehPonto = digito == '.';
    final limparValor = (_valor == '0' && !ehPonto) || _limparvalor;

    if (ehPonto && _valor.contains('.') && !limparValor) {
      return;
    }

    final valorVazio = ehPonto ? '0' : '';
    final valorCorrente = limparValor ? valorVazio : _valor;
    _valor = valorCorrente + digito;
    _limparvalor = false;

    _armazenar[_armazenarIndice] = double.tryParse(_valor) ?? 0;
  }

  _removerDigito(String digito) {
    String novoValor = '';
    if (_valor.length > 1) {
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;
      int fim = _valor.length - 1;
      novoValor = _valor.substring(0, fim);
      _armazenar[_armazenarIndice] = double.tryParse(novoValor) ?? 0;
    } else {
      _armazenar[_armazenarIndice] = 0.0;
      novoValor = '0';
    }
    _valor = novoValor;
  }

  _limparTudo() {
    _valor = '0';
    _valorResultado = '0';
    _armazenar.setAll(0, [0.0, 0.0]);
    _operacao = null;
    _armazenarIndice = 0;
    _limparvalor = false;
  }

  _calcular() {
    switch (_operacao) {
      case '%':
        return (_armazenar[0] / 100) * _armazenar[1];
      case '÷':
        return _armazenar[0] / _armazenar[1];
      case 'x':
        return _armazenar[0] * _armazenar[1];
      case '-':
        return _armazenar[0] - _armazenar[1];
      case '+':
        return _armazenar[0] + _armazenar[1];
      default:
        return _armazenar[0];
    }
  }

  String get valor {
    return _valor;
  }

  String get valorResultado {
    if (_ultimocomando == '=') {
      return _valorResultado + ' = ' + _valor;
    } else {
      return '';
    }
  }
}
