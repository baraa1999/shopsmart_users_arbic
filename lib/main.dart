import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopsmart_users_arbic/consts/theme_data.dart';
import 'package:shopsmart_users_arbic/providers/product_provider.dart';
import 'package:shopsmart_users_arbic/providers/theme_provider.dart';
import 'package:shopsmart_users_arbic/screens/dashboard_screen.dart';
import 'package:shopsmart_users_arbic/screens/edit_upload_product_form.dart';
import 'package:shopsmart_users_arbic/screens/inner_screens/orders/orders_screen.dart';
import 'package:shopsmart_users_arbic/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop Smart ADMIN AR',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const DashboardScreen(),
          routes: {
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            EditOrUploadProductScreen.routeName: (context) =>
                const EditOrUploadProductScreen(),
          },
        );
      }),
    );
  }
}
