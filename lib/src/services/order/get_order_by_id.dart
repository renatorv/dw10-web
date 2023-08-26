import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';

abstract class GetOrderById {
  // Conceito de DTO (data transfer object): um objeto que é trafegado entre as camadas.
  // Não é um modelo do projeto, mais sim uma adaptação de várias classes, para atender uma regra da aplicação.
  Future<OrderDto> call(OrderModel order);
}
