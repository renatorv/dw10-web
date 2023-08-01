import 'package:flutter/material.dart';

import 'widget/order_header.dart';
import 'widget/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              const OrderHeader(),
              const SizedBox(
                 height: 50,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 11,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisExtent: 91,
                  ),
                  itemBuilder: (context, index) {
                    return const OrderItem();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
