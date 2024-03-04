import 'package:flutter/material.dart';

class ConnectionViewScreen extends StatefulWidget {
  const ConnectionViewScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<ConnectionViewScreen> createState() => _ConnectionViewScreenState();
}

class _ConnectionViewScreenState extends State<ConnectionViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petition #${widget.index}'),
      ),
      body: Card(
        elevation: 0,
        color: Colors.purple,
        child: Center(
          child: Text(
            'Petition #${widget.index}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
        ),
      ),
    );
  }
}
