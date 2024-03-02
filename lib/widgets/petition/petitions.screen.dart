import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kind_words/widgets/petition/petition.view.screen.dart';

class PetitionsScreen extends StatefulWidget {
  const PetitionsScreen({super.key});

  @override
  State<PetitionsScreen> createState() => _PetitionsScreenState();
}

class _PetitionsScreenState extends State<PetitionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petitions'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: AppinioSwiper(
            cardCount: 50,
            cardBuilder: (context, index) => Card(
                  elevation: 0,
                  color: Colors.purple,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                PetitionViewScreen(index: index))),
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Petition #$index',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '- #$index',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
