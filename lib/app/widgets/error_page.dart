import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMsg;
  final VoidCallback onTapReload;

  const ErrorView({Key key, this.errorMsg, this.onTapReload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(errorMsg),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: RaisedButton(
              child: Text(
                'Retry',
                style: TextStyle(
                    fontFamily: "Gilroy-Light",
                    fontSize: 22,
                    color: Colors.black),
              ),
              onPressed: () async {
                onTapReload();
              },
            ),
          ),
        ],
      )),
    );
  }
}
