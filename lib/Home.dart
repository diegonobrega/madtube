import 'package:flutter/material.dart';
import 'package:madtube/CustomSearchDelegate.dart';
import 'package:madtube/telas/Biblioteca.dart';
import 'package:madtube/telas/EmAlta.dart';
import 'package:madtube/telas/Inicio.dart';
import 'package:madtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  void initState() {
    super.initState();
    print("chamado 1 - initState");
  }

  @override
  Widget build(BuildContext context) {
    print("chamado 3 - build");
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "imagens/youtube.png",
            width: 98,
            height: 22,
        ),
        actions: [
          /*
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {
              print("acao: videocam");
            },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("acao: conta");
            },
          ),
          */
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res?? _resultado;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Em alta",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              label: "Biclioteca",
              icon: Icon(Icons.folder)
          ),

        ],
      ),
    );
  }
}
