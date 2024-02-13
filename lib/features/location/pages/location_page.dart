import 'package:flutter/material.dart';
import 'package:weather_app/features/result/pages/result_page.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/widgets/logo.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.colorMatisse,
              Constants.colorOldLavender,
              Constants.colorTapestry
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              const Logo(),
              Text(
                'Wpisz miasto'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Miasto'),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(70, 50, 70, 50),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(top: 15, bottom: 15),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.colorOldLavender),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sprawdź',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
