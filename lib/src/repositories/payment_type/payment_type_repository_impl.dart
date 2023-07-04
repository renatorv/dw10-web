import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/payment_type_model.dart';
import './payment_type_repository.dart';

class PaymentTypeRepositoryImpl extends PaymentTypeRepository {
  final CustomDio _dio;

  PaymentTypeRepositoryImpl(this._dio);

  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) async {
    try {
      final paymentResult = await _dio.auth().get(
        '/payment-type',
        queryParameters: {
          if (enabled != null) 'enabled': enabled,
        },
      );
      return paymentResult.data.map((p) => PaymentTypeModel.fromMap(p)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar formas de pagamento.', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento.');
    }
  }

  @override
  Future<PaymentTypeModel> getById(int id) async {
    try {
      final paymentResult = await _dio.auth().get(
            '/payment-type/$id',
          );
      return PaymentTypeModel.fromMap(paymentResult.data);
    } on DioException catch (e, s) {
      log('Erro ao buscar forma de pagamento $id.', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar forma de pagamento $id.');
    }
  }

  @override
  Future<void> save(PaymentTypeModel model) async {
    try {
      final client = _dio.auth();

      if (model.id != null) {
        // Alteração
        await client.put(
              '/payment-type/${model.id}',
              data: model.toMap(),
            );
      } else {
        // Inserção
        await client.post(
              '/payment-type/',
              data: model.toMap(),
            );
      }
    } on DioException catch (e, s) {
      log('Erro ao salvar forma de pagamento.', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao salvar forma de pagamento.');
    }
  }
}