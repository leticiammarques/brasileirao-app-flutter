import 'package:flutter_aula1/repositories/times_repository.dart';

import '../models/time.dart';

class HomeController {
  TimesRepository? timesRepository;

  List<Time> get tabela => timesRepository?.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
