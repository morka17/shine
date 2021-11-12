import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  FocusNode _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        // Redraa
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        // Redraw so that the password label reflects the focus state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            // [Name]
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              decoration: const InputDecoration(
                // filled: true,
                labelText: 'Username',
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                // filled: true,
                labelText: 'Passsword',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Clear the text fields
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  child: const Text('CANCEL'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary,
                    ),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      )
                    )
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // SHOW THE NEXT PAGE
                    Navigator.pop(context);
                  },
                  child: const Text('NEXT'),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(8.0),
                    shape: MaterialStateProperty.all(
                      const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      )
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Add AccentColorOverride
