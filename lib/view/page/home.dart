import 'package:ferisoft/constant/app_cons.dart';
import 'package:ferisoft/model/category_model.dart';
import 'package:ferisoft/model/product_model.dart';
import 'package:ferisoft/service/category_service.dart';
import 'package:ferisoft/service/product_service.dart';
import 'package:ferisoft/view/page/basket.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> _categories = [];
  List<ProductModel> _products = [];
  final CategoryService _categoryService = CategoryService();
  final ProductService _productService = ProductService();
  List<ProductModel> _productInsideTheBasket = [];
  String categoryId = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _categories = await _categoryService.getCategories();
    if (categoryId.isEmptyOrNull) {
      _products = await _productService.getProducts();
    } else {
      _products = await _productService.getProductsByCategoryId(categoryId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shadowColor: appColor,
        backgroundColor: appColor,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Transform(
          transform: Matrix4.translationValues(10.0, 0.0, 0.0),
          child: InkWell(
            child: Text(
              "LOGO",
              style: boldTextStyle(color: white, size: 30),
            ),
            onTap: () {
              categoryId = "";
              setState(() {});
            },
          ),
        ),
        actions: [
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Basket(
                            productInsideTheBasket: _productInsideTheBasket,
                          )));
                },
              ),
              _productInsideTheBasket.isEmpty
                  ? Container()
                  : Positioned(
                      child: Stack(
                      children: <Widget>[
                        const Icon(Icons.brightness_1,
                            size: 20.0, color: white),
                        Positioned(
                            top: 3.0,
                            right: 6.0,
                            child: Center(
                              child: Text(
                                _productInsideTheBasket.length.toString(),
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    )),
            ],
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: init(),
        builder: (context, snapshot) {
          if (_categories.isNotEmpty) {
            return Column(
              children: [
                Container(
                  color: appColor,
                  height: context.height() * 0.05,
                  width: context.width(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Text(
                            _categories[index].name!,
                            style: boldTextStyle(color: white, size: 14),
                          ),
                          onTap: () {
                            categoryId = _categories[index].id.toString();
                            setState(() {});
                          },
                        ),
                      );
                    },
                    itemCount: _categories.length,
                  ),
                ),
                categoryId.isEmptyOrNull
                    ? Container(
                        height: context.height(),
                        width: context.width(),
                        child: ListView(children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: appColor,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "ŞOK İNDİRİMLERİ KAÇIRMAYIN !",
                                  style: boldTextStyle(size: 25, color: black),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "ÇOK SATANLAR",
                            style: boldTextStyle(size: 20, color: black),
                          ),
                          20.height,
                          GridView.builder(
                            shrinkWrap:
                                true, // You won't see infinite size error
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 350,
                                    childAspectRatio: 2 / 2,
                                    mainAxisExtent: 200,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                            style: BorderStyle.solid),
                                      ),
                                      child: Image.network(
                                          fit: BoxFit.scaleDown,
                                          "${_products[index].image}"),
                                    ),
                                    5.height,
                                    Text(_products[index].name!,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center),
                                    Text("${_products[index].price!} TL")
                                  ],
                                ),
                              );
                            },
                            itemCount: _products.length,
                          )
                        ]),
                      ).expand()
                    : Column(
                        children: [
                          20.height,
                          GridView.builder(
                            shrinkWrap:
                                true, // You won't see infinite size error
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 350,
                                    childAspectRatio: 2 / 2,
                                    mainAxisExtent: 250,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.network(
                                          fit: BoxFit.scaleDown,
                                          "${_products[index].image}"),
                                    ),
                                    5.height,
                                    Text(_products[index].name!,
                                        maxLines: 1,
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center),
                                    Text("${_products[index].price!} TL"),
                                    ElevatedButton(
                                      onPressed: () {
                                        _productInsideTheBasket
                                            .add(_products[index]);
                                        setState(() {});
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                appColor),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        )),
                                        // backgroundColor: appColor,
                                      ),
                                      child: const Text("Sepete Ekle"),
                                    ).cornerRadiusWithClipRRect(280)
                                  ],
                                ),
                              );
                            },
                            itemCount: _products.length,
                          ).expand(),
                        ],
                      ).expand(),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("AwaitingResult"),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
