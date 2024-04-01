import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/models/titulo.dart';
import 'package:flutter_aula1/pages/add_titulo_page.dart';

// ignore: must_be_immutable
class TimePage extends StatefulWidget {
  Time time;
  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AddTituloPage(time: widget.time, onSave: addTitulo),
      ),
    );
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Salvo com sucesso!")));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: tituloPage, icon: const Icon(Icons.add))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.stacked_line_chart,
                  color: Colors.white,
                ),
                child: Text(
                  "Estatísticas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                ),
                child: Text(
                  "Titulos",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(
                    widget.time.brasao.replaceAll("40x40", "150x150"),
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Se a imagem foi carregada com sucesso, retorne a imagem
                      } else {
                        return const CircularProgressIndicator(); // Exibe um indicador de progresso enquanto a imagem está sendo carregada
                      }
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Icon(Icons
                          .error); // Exibe um ícone de erro se a imagem não puder ser carregada
                    },
                  ),
                ),
                Text(
                  "Pontos: ${widget.time.pontos}",
                  style: const TextStyle(fontSize: 22),
                )
              ],
            ),
            titulos(),
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final quantidade = widget.time.titulos.length;
    return quantidade == 0
        ? const Center(
            child: Text(
              "Nenhum título ainda!",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(
                  widget.time.titulos[index].campeonato,
                ),
                trailing: Text(
                  widget.time.titulos[index].ano,
                ),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,
          );
  }
}
