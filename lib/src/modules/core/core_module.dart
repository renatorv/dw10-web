import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
import '../../repositories/payment_type/payment_type_repository_impl.dart';
import '../../repositories/products/product_repository.dart';
import '../../repositories/products/product_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<Storage>((i) => SessionStorage(), export: true),
        Bind.lazySingleton((i) => CustomDio(i()), export: true),
        // Como a busca por meios de pagamentos em vários lugares da aplicação 
        // ele foi injetado no core ficando disponível para qq para do app.
        Bind.lazySingleton<PaymentTypeRepository>((i) => PaymentTypeRepositoryImpl(i()), export: true),
        Bind.lazySingleton<ProductRepository>((i) => ProductRepositoryImpl(i()), export: true),
        // A busca por usuário pode ser utilizada em vários lugares da aplicação, assim deve-se colocar ela aqui.
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(i()), export: true),
      ];
}
