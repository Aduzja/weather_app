import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        FaIcon(
          FontAwesomeIcons.rainbow,
          size: 50,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
