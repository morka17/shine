import 'package:flutter/material.dart';
import 'package:shine/backdrop.dart';
import 'package:shine/category_menu_page.dart';
import 'package:shine/colors.dart';
import 'package:shine/supplemental/cut_corners_border.dart';

import 'model/product.dart';

import 'home.dart';
import 'login.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(category: _currentCategory,),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // Theme
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}

// Shrine Theme
final ThemeData _kShrineTheme = _buildShrineTheme();

// Build a Shrine Text Theme
ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme:
        const TextSelectionThemeData(selectionColor: kShrineBrown900),
    // Decorate the inputs
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: CutCornersBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrineBrown900,
          ),
        ),
        border: CutCornersBorder()),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline5: base.headline5!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    headline6: base.headline6!.copyWith(fontSize: 18.0),
    caption:
        base.caption!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
    bodyText1: base.bodyText1!
        .copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        )
        .apply(
          color: kShrineBrown900,
         // backgroundColor: kShrineBrown900,
          fontFamily: 'Rubik',
        ),
  );
}
