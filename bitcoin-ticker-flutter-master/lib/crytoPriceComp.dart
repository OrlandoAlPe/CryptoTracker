import 'package:flutter/material.dart';

class CryptoPriceComp extends StatelessWidget {
  const CryptoPriceComp({
    Key key,
    @required this.criptoType,
    @required this.criptoVal,
    @required this.selectedCurrency,
  }) : super(key: key);

  final String criptoType;
  final criptoVal;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.deepPurple,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $criptoType = $criptoVal $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
