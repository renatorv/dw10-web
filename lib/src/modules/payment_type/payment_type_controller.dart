import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
part 'payment_type_controller.g.dart';

// Status do estado que a página pode passar: {dia 3 parte 1 -19}
enum PaymentTypeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class PaymentTypeController = PaymentTypeControllerBase with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  PaymentTypeControllerBase(this._paymentTypeRepository);

  @readonly
  var _status = PaymentTypeStateStatus.initial;

  @readonly
  var _paymentTypes = <PaymentTypeModel>[];

  @readonly
  String? _errorMessage;

  // Esse método tem a capacidade de alterar o estado da página por isso ele é uma action
  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStateStatus.loading;
      _paymentTypes = await _paymentTypeRepository.findAll(null);
      _status = PaymentTypeStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar as formas de pagamento. ', error: e, stackTrace: s);
      _status = PaymentTypeStateStatus.error;
      _errorMessage = 'Erro ao carregar as formas de pagamento.';
    }
  }
}
