import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String routeType;

  const Details({Key key, this.routeType}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.routeType;
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade200,
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextField(
          controller: _textEditingController,
          onSubmitted: (String value) {
            Navigator.of(context).pop(value);
          },
        ),
      ),
    );
  }
}
