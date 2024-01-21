import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/config/app_module.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:shopping_app/features/products/presentation/view/catalog_view.dart';

import '../utils/app_palette.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(serviceLocator()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Palette.brown,
        ),
        home: const CatalogView(),
      ),
    );
  }
}