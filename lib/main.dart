import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data/provider/auto_route_provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'ui/route/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  // Hive.registerAdapter(UserStorageAdapter());
  await Hive.openBox('tokenbox');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;
  // void setLocale(String language) {
  //   setState(() => _locale = createLocale(language));
  // }

  // void setThemeMode(ThemeMode mode) => setState(() {
  //       _themeMode = mode;
  //       FlutterFlowTheme.saveThemeMode(mode);
  //     });
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final AppRouter _appRouter = ref.read(appRouterProvider);
    return MaterialApp.router(
      title: 'lovediary',
      // localizationsDelegates: const [
      //   FFLocalizationsDelegate(),
      // ],
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      // locale: _locale,
      // supportedLocales: const [Locale('vi', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
    );
  }
}
