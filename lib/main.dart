import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:contest_app/app/ui/pages/home_page.dart';
import 'package:contest_app/app/helper/init_dependency.dart';
import 'package:contest_app/app/ui/pages/content_detail_page.dart';
// import 'package:contest_app/app/helper/init_controller.dart' as di;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(const ContestApp());
}

class ContestApp extends StatelessWidget {
  const ContestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitDep(),
      title: 'Contest App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/content_detail",
          page: () => ContentDetailPage(),
        )
      ],
    );
  }
}
