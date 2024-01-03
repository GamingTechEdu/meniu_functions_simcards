import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';
import 'package:flutter/material.dart';
import '../common/global_config.dart';
import '../kdl_controller.dart';

class DataValidation {
  Future<List<String>> loadIccidFromApi() async {
    // final String apiUrl = 'http://localhost:8080/simcards';
    final String apiUrl = 'http://187.122.102.36:60060/simcards';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<String> names = [];

      for (var item in jsonData) {
        if (item['iccid'] != null) {
          names.add(item['iccid']);
        }
      }

      return names;
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }

  Future<List<String>> loadSimconFromApi() async {
    // final String apiUrl = 'http://localhost:8080/simcards';
    final String apiUrl =
        'http://187.122.102.36:60060/simcards'; // Substitua pela URL da sua API

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<String> names = [];

      for (var item in jsonData) {
        if (item['simcon'] != null) {
          names.add(item['simcon']);
        }
      }

      return names;
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }

  Future<List<String>> loadMsisdnFromApi() async {
    final String apiUrl = 'http://187.122.102.36:60060/simcards';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<String> names = [];

      for (var item in jsonData) {
        if (item['numerolinha'] != null) {
          names.add(item['numerolinha']);
        }
      }

      return names;
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }
}

class DataRecordSimcard {
  static Future<void> recordSimcard(
      BuildContext context, TaskModel task) async {
    final jsonBody = jsonEncode(task.toJson());

    print("ID do Cliente: ${task.idCostumer}");
    print("ID do Simcard: ${task.idSimcard}");
    print("ID do Simcon: ${task.idSimcon}");
    print("NF do Simcon: ${task.nfSimcon}");
    print("ID da Linha: ${task.idLine}");
    print("ID do IP: ${task.idIP}");
    print("ID do Fornecedor: ${task.idSupplier}");
    print("ID do Slot: ${task.idSlot}");
    print("ID das Observações: ${task.idObservations}");
    print("Tipo de Fornecedor: ${task.supplierType}");
    print("ID do Plano: ${task.idPlan}");
    print("Data de Ativação: ${task.idDateActi}");
    print("Data de Instalação: ${task.idDateinsta}");
    print("ID da APN: ${task.idApn}");

    final apiUrl = Uri.parse("http://187.122.102.36:60060/recordSimcard");
    print(jsonBody);
    try {
      final response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        GlobalConfig.showPopupSucess(context);
      } else {
        print('Erro ao enviar os dados. Status Code: ${response.statusCode}');
        print('Corpo da resposta: ${response.body}');
        GlobalConfig.showPopupErrorStatus(context, response);
      }
    } catch (e) {
      print('Erro ao fazer a solicitação HTTP: $e');
      GlobalConfig.showPopupErrors(context, e);
    }
  }
}
