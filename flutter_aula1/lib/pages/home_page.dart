import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/pages/home_controller.dart';
import 'package:flutter_aula1/pages/time_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold: Componente que retorna itens que voce precisa numa página.
    //Ex: appBar, body, footButton, navigation, etc
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brasileirão"),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(
              tabela[index].brasao,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child; // Se a imagem foi carregada com sucesso, retorne a imagem
                } else {
                  return const CircularProgressIndicator(); // Exibe um indicador de progresso enquanto a imagem está sendo carregada
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return const Icon(Icons
                    .error); // Exibe um ícone de erro se a imagem não puder ser carregada
              },
            ),
            title: Text(tabela[index].nome),
            trailing: Text(tabela[index].pontos.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TimePage(
                      key: Key(tabela[index].nome), time: tabela[index]),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.tabela.length,
      ),
    );
  }
}
