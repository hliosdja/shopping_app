import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_bloc.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_state.dart';
import 'package:shopping_app/features/products/presentation/widgets/catalog_gridview.dart';
import 'package:shopping_app/features/products/presentation/widgets/catalog_loading.dart';

class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: 'Search product',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18))),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsGetLoading) {
            return CatalogLoading();
          } else if (state is ProductsGetSuccess) {
            return CatalogGridView(productList: state.productsList);
          } else if (state is ProductsGetFailed) {
            return Center(child: Text(state.message!));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}