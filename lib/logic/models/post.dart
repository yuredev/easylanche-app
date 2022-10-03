class Post{
  String? _id;
  String? _title;
  String? _descricao;
  double? _value;
  bool? _tipo;

  Post({String? id, String? title, String? descricao, double? value, bool? tipo}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (descricao != null) {
      this._descricao = descricao;
    }
    if (value != null) {
      this._value = value;
    }
    if (tipo != null) {
      this._tipo = tipo;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;

  String? get title => _title;
  set title(String? title) => _title = title;

  String? get descricao => _descricao;
  set descricao(String? descricao) => _descricao = descricao;

  double? get value => _value;
  set value(double? value) => _value = value;

  bool? get tipo => _tipo;
  set tipo(bool? tipo) => _tipo = tipo;


  Post.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _descricao = json['descricao'];
    _value = json['value'];
    _tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['descricao'] = this._descricao;
    data['value'] = this._value;
    data['tipo'] = this._tipo;
    return data;
  }
}