import 'package:flutter/material.dart';

import '../enums/casino_item_enum.dart';

class CasinoItem extends StatefulWidget {
  const CasinoItem({super.key, required this.value});
  final int value;
  @override
  State<StatefulWidget> createState() => _CasinoItemState();
}

class _CasinoItemState extends State<CasinoItem> {
  CasinoItemEnum? _valueEnumerated;

  @override
  Widget build(BuildContext context) {
    _valueEnumerated = CasinoItemEnum.getByValue(widget.value);
    return Center(
      child: Image.asset(
        _valueEnumerated!.path,
        height: 100,
        width: 100,
      ),
    );
  }
}
