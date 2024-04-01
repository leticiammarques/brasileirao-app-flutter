import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/models/titulo.dart';

class TimesRepository {
  final List<Time> _times = [];
  get times => _times;

  TimesRepository() {
    _times.addAll([
      Time(
        brasao:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbr.pinterest.com%2Fpin%2F483433341240947883%2F&psig=AOvVaw3_L6a5Pn0OjUM_T7cv_elA&ust=1712071520903000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJDursipoYUDFQAAAAAdAAAAABAE",
        nome: "São Paulo",
        pontos: 12,
        cor: Colors.red.shade900,
      ),
      Time(
        brasao:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FFicheiro%3ACorinthians_simbolo.png&psig=AOvVaw3Zka4fmsMjLIO6hgYKH5k4&ust=1712072237919000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJjoo56soYUDFQAAAAAdAAAAABAE",
        nome: "Corinthians",
        pontos: 13,
        cor: Colors.red.shade300,
      ),
      Time(
        brasao:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpt.m.wikipedia.org%2Fwiki%2FFicheiro%3ASantos_Logo.png&psig=AOvVaw2kJwfp3_Z8KQnnpBL63lZr&ust=1712072260227000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLjV6aisoYUDFQAAAAAdAAAAABAE",
        nome: "Santos",
        pontos: 14,
        cor: Colors.black,
      ),
      Time(
        brasao:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fimagepng.org%2Fescudo-da-sociedade-esportiva-palmeiras%2F&psig=AOvVaw0hqOQMEMq6CYLW73AxdTik&ust=1712072282777000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPiNy7OsoYUDFQAAAAAdAAAAABAE",
        nome: "Palmeiras",
        pontos: 15,
        cor: Colors.green.shade800,
      ),
      Time(
        brasao:
            "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbr.pinterest.com%2Fpin%2Fescudo-flamengo-vetor-resultados-da-busca-de-imagens--853221092023137838%2F&psig=AOvVaw2lKNEPsDuYsvFOUmrwFOB0&ust=1712072204802000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCYvI6soYUDFQAAAAAdAAAAABAP",
        nome: "Flamengo",
        pontos: 16,
        cor: Colors.red.shade800,
      ),
    ]);
  }

  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);
  }
}
