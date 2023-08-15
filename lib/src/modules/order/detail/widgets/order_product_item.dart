import 'package:flutter/material.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              'X-Tudão',
              style: context.textStyles.textRegular,
            ),
          ),
          Text(
            '1',
            style: context.textStyles.textRegular,
          ),
          Expanded(
            child: Text(
              100.0.currencyPTBR,
              style: context.textStyles.textRegular,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
