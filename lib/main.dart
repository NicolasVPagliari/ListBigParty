import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Convidados Big Party'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _favoritado = false;
  int? _indexFavorito;

  void _marcarFavorito(int index) {
    setState(() {
      _favoritado = true;
      usuarios[index].favorito = true;
      _indexFavorito = index;
    });
  }

  void _retirarFavorito(int index) {
    setState(() {
      _favoritado = false;
      usuarios[index].favorito = false;
      _indexFavorito = null;
    });
  }

  List<Usuario> usuarios = [
    Usuario(
      id: '52',
      nome: 'Rafão',
      telefone: '993028467',
      email: 'rafaopinadeira@gmail.com',
    ),
    Usuario(
      id: '22',
      nome: 'Nicolão',
      telefone: '993010294',
      email: 'nicolao@gmail.com',
    ),
    Usuario(
      id: '18',
      nome: 'Guizão',
      telefone: '916210529',
      email: 'guizao13@gmail.com',
    ),
    Usuario(
      id: '17',
      nome: 'Jozsão',
      telefone: '927193046',
      email: 'jozsaogaules@gmail.com',
    ),
    Usuario(
      id: '5',
      nome: 'Luiz',
      telefone: '121212121',
      email: 'luiz12loreninha@gmail.com',
    ),
    Usuario(
      id: '6',
      nome: 'Ale',
      telefone: '928103942',
      email: 'aledelas@gmail.com',
    ),
    Usuario(
      id: '3',
      nome: 'Pacheco',
      telefone: '420420420',
      email: 'pachecaogoodvibes@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=${usuarios[index].id}',
                    ),
                  ),
                  title: Text(usuarios[index].nome),
                  subtitle: Text(usuarios[index].email),
                  trailing: IconButton(
                    onPressed:
                        () => {
                          if (usuarios[index].favorito == false &&
                              _favoritado == false)
                            {_marcarFavorito(index)}
                          else if (usuarios[index].favorito == true)
                            {_retirarFavorito(index)},
                        },
                    icon:
                        usuarios[index].favorito == false
                            ? Icon(Icons.favorite_border)
                            : Icon(Icons.favorite),
                  ),
                );
              },
            ),
          ),
          _indexFavorito != null
              ? ExibirFavorito(usuario: usuarios[_indexFavorito!])
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class Usuario {
  String id;
  String nome;
  String telefone;
  String email;
  bool favorito = false;

  Usuario({
    required this.id,
    required this.nome,
    required this.telefone,
    required this.email,
  });
}

class ExibirFavorito extends StatelessWidget {
  final Usuario usuario;

  ExibirFavorito({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=${usuario.id}',
            ),
          ),
          Text(usuario.nome, style: TextStyle(fontSize: 20),),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 5),
              Text(usuario.email),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_callback),
              SizedBox(width: 5),
              Text(usuario.telefone),
            ],
          ),
        ],
      ),
    );
  }
}
