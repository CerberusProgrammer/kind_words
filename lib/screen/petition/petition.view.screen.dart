import 'package:flutter/material.dart';

class PetitionViewScreen extends StatefulWidget {
  const PetitionViewScreen({super.key, required this.index});

  final int index;

  @override
  State<PetitionViewScreen> createState() => _PetitionViewScreenState();
}

class _PetitionViewScreenState extends State<PetitionViewScreen> {
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
