
import 'package:flutter/material.dart';
import 'package:task/constant/globalvarbiles.dart';
import 'package:task/data/modal/product_modal/productModal.dart';
import 'package:task/data/services/search/search_services.dart';
import 'package:task/presentation/ui/product_detail/product_detail_page.dart';
import 'package:task/presentation/ui/home/widget/home_page_widget.dart';
import 'package:task/presentation/ui/search/widget/search_product.dart';
import 'package:task/presentation/widget/loader.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchPage({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchPage> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchPage.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : Column(
        children: [
         AddressBox(context),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailPage.routeName,
                      arguments: products![index],
                    );
                  },
                  child: SearchedProduct(
                    product: products![index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}