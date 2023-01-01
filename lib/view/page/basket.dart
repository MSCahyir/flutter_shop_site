import 'package:ferisoft/constant/app_cons.dart';
import 'package:ferisoft/model/product_model.dart';
import 'package:ferisoft/view/page/home.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Basket extends StatefulWidget {
  final List<ProductModel> productInsideTheBasket;
  const Basket({super.key, required this.productInsideTheBasket});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const Home()));
            },
          ),
        ),
        actions: [
          Stack(
            children: <Widget>[
              const IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: black,
                  size: 35,
                ),
                onPressed: null,
              ),
              widget.productInsideTheBasket.isEmpty
                  ? Container()
                  : Positioned(
                      top: 3.0,
                      right: 6.0,
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1, size: 20.0, color: white),
                          Positioned(
                              top: 3.0,
                              right: 4.0,
                              child: Center(
                                child: Text(
                                  widget.productInsideTheBasket.length
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
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
      body: widget.productInsideTheBasket.isEmpty
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
                        "SEPETINIZDE ÜRÜN BULUNMAMAKTADIR",
                        style: boldTextStyle(size: 25, color: black),
                      ),
                    ),
                  ),
                ).expand(),
                20.height,
              ]),
            ).expand()
          : Container(
              height: context.height(),
              width: context.width(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    20.height,
                    Text(
                      "Sepetim",
                      style: boldTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                    fit: BoxFit.scaleDown,
                                    "${widget.productInsideTheBasket[index].image}"),
                              ),
                              Container(
                                width: context.width() * 0.55,
                                child: Column(
                                  children: [
                                    Text(
                                      widget
                                          .productInsideTheBasket[index].name!,
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: boldTextStyle(),
                                    ),
                                    5.height,
                                    Text(
                                      "En geç 22 Eylül Perşembe Günü Teslim",
                                      softWrap: true,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: secondaryTextStyle(size: 12),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: const [
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.add_circle)),
                                  Text("1"),
                                  IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.remove_circle))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: widget.productInsideTheBasket.length,
                    ),
                    Container(
                      height: 70,
                      width: context.width(),
                      color: Colors.grey[100],
                      child: Center(
                        child: Text(
                          "Rayban Güneş Gözlüklerinde \n Sepette %15 İndirim",
                          style: boldTextStyle(
                            color: greenColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Seçilen Ürünler(${widget.productInsideTheBasket.length})",
                              style: boldTextStyle(color: appColor),
                            ),
                            Text(
                              "${widget.productInsideTheBasket.sumByDouble((p0) => double.parse(p0.price!)).toStringAsFixed(3)} TL",
                              style: boldTextStyle(),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(appColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                          child: Text(
                            "Alışverisi Tamamla",
                            style: boldTextStyle(color: white),
                          ),
                        ).cornerRadiusWithClipRRect(280),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
