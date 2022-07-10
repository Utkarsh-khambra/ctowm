import 'package:flutter/material.dart';

Route<Object?> loginPageBuilder(BuildContext context, Object? arguments) {
  return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return Material(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Email Id",
                    border: OutlineInputBorder())),
            const Divider(height: 20),
            TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Pasword",
                    border: OutlineInputBorder())),
            Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.pink,
                ),
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Login",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))))
          ],
        ));
      });
}
