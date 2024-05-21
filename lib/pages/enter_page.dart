import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Text("ENTER"),
          onTap: () => context.go("/home"),
        ),
      ),
    );
  }
}
