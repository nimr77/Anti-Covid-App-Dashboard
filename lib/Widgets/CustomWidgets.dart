import 'dart:html';
import 'dart:html' as html;

import 'package:animations/animations.dart' as newAnimation;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Dialogs/InputSingleDialog.dart';
import '../Dialogs/MessageDialogs.dart';
import '../Functions/MyConverters.dart';
import '../Functions/MyValidators.dart';
import '../Style/MyTextStyle.dart';
import '../Util/GeneralUtil.dart';
import '../Widgets/MyButtons.dart';
import '../generated/l10n.dart';
import '../html/HtmlFunctions.dart';

///This is a Widget for the menu button
class ChooseMenu extends StatefulWidget {
  double hight;
  double width;
  String title;
  List<String> source;
  int selectedIndex = 100;
  bool isSelected = false;
  double elevation = 0;
  double redu;
  Function(int index) whenChange;
  ChooseMenu(this.hight, this.width, this.title, this.source, this.whenChange,
      {this.selectedIndex = 100, this.elevation = 0, this.redu = 5});
  @override
  _ChooseMenuState createState() => _ChooseMenuState();
}

class _ChooseMenuState extends State<ChooseMenu> {
  bool _showMenu = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.hight,
      child: Scrollbar(
        child: ListView.builder(
            itemCount: widget.source.length,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FlatButton(
                    color: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        _showMenu = false;
                        widget.selectedIndex = index;
                        widget.isSelected = true;
                      });
                      widget.whenChange(index);
                    },
                    child: Text(
                      widget.source[index],
                      style: TextStyle(
                          color: index != widget.selectedIndex
                              ? Colors.black
                              : Colors.blue[700]),
                    ),
                  ),
                )),
      ),
    );
  }
}

///This will create Image loader for the html page
///will load the image from web or a [List<int>]
///and each of its function has a button
///so when you add it, expect something to change
///TODO fix how it handle the removing from the web
class MyHtmlImageUploader extends StatefulWidget {
  html.File myImage;
  String imgUrl;
  List<String> secImgsUrl = List<String>();
  double height;
  double width;

  ///When upload the main picture
  Function(html.File myImage) whenUpload;

  ///When add more than one picture
  Function(List<html.File> myImages) whenAddMoreThanOne;

  ///On remove an image File
  Function(html.File myImage) onRemove;
  // on remove a url
  Function(String) onRemovingNetworkImage;

  ///The bin image
  List<int> image64;
  int maxNumber;
  Function() onMaxNumber;
  MyHtmlImageUploader(this.height, this.width, this.whenUpload,
      {this.myImage,
      this.imgUrl,
      this.whenAddMoreThanOne,
      this.secImgsUrl,
      this.image64,
      this.onRemove,
      this.onRemovingNetworkImage,
      this.maxNumber = 5,
      this.onMaxNumber});
  @override
  _MyHtmlImageUploaderState createState() => _MyHtmlImageUploaderState();
}

class _MyHtmlImageUploaderState extends State<MyHtmlImageUploader> {
  bool loading = false;
  double _opacity = 0;
  bool _showSecIm = false;
  NetworkImage imProvider;
  List<html.File> myRes = List<html.File>();
  List<MyHtmlImageUploader> listOfUploader = List<MyHtmlImageUploader>();
  @override
  void initState() {
    super.initState();
    if (widget.imgUrl != null) {
      imProvider = NetworkImage(widget.imgUrl);
      setState(() {
        loading = true;
      });
      imProvider
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((_, __) {
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      }));
    }
    if (widget.myImage != null) {
      setState(() {
        loading = true;
      });
      MyConverter.getHtmlBloobAs64Biyte(widget.myImage).then((value) {
        loading = false;
        setState(() => widget.image64 = value);
      });
    }
    if (widget.secImgsUrl != null) {
      setState(() {
        for (var item in widget.secImgsUrl) {
          this.listOfUploader.add(MyHtmlImageUploader(
                widget.height * 0.4,
                widget.width * 0.4,
                (myNewImage) {
                  if (this
                          .listOfUploader
                          .indexWhere((element) => element.imgUrl == item) !=
                      -1) {
                    this
                        .listOfUploader
                        .removeWhere((element) => item == element.imgUrl);
                  }
                  if (!myRes.contains(myNewImage)) myRes.add(myNewImage);
                  widget.whenAddMoreThanOne(myRes);
                },
                imgUrl: item,
                onRemove: (myImage) {
                  setState(() {
                    if (myImage != null) myRes.remove(myImage);

                    if (myImage != null)
                      this.listOfUploader.removeWhere(
                          (element) => element.myImage.name == myImage.name);
                    else
                      this
                          .listOfUploader
                          .removeWhere((element) => item == element.imgUrl);
                    widget.secImgsUrl.removeWhere((element) => element == item);
                    this.widget.whenAddMoreThanOne(myRes);
                    this.widget.onRemovingNetworkImage(item);
                  });
                },
              ));
        }
      });
    }
  }

  _onMouseEnter() {
    setState(() {
      this._showSecIm = true;
    });
  }

  _onMouseLeave() {
    Future.delayed(Duration(seconds: 3), () {
      try {
        setState(() {
          this._showSecIm = false;
        });
      } catch (e) {}
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    if (_showSecIm) {
      _opacity = 1;
    } else {
      _opacity = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: InkWell(
              onTap: () async {
                widget.myImage = await MyFunctionsHtml.getImage();
                setState(() {
                  loading = true;
                });

                widget.image64 =
                    await MyConverter.getHtmlBloobAs64Biyte(widget.myImage);
                setState(() {
                  loading = false;
                });
                widget.whenUpload(widget.myImage);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    image: widget.image64 != null
                        ? DecorationImage(
                            image: MemoryImage(widget.image64),
                            fit: BoxFit.cover)
                        : widget.imgUrl != null
                            ? DecorationImage(
                                image: imProvider, fit: BoxFit.cover)
                            : null,
                    border: Border.all(
                        color: Colors.black.withOpacity(0.4), width: 1)),
                height: widget.height,
                width: widget.width,
                child: widget.image64 == null && widget.imgUrl == null
                    ? Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      )
                    : loading
                        ? Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 15,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(),
              ),
            ),
          ),
          listOfUploader.length != 0
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: MouseRegion(
                    onHover: (event) => _onMouseEnter(),
                    onExit: (event) => _onMouseLeave(),
                    child: AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      opacity: _opacity,
                      child: Container(
                        width: widget.width,
                        height: widget.height * 0.4,
                        child: Scrollbar(
                          child: ListView.builder(
                              itemCount: listOfUploader.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: listOfUploader[index],
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          widget.whenAddMoreThanOne != null
              ? Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 20,
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          if (widget.maxNumber > listOfUploader.length) {
                            setState(() {
                              loading = true;
                            });
                            var myImage = await MyFunctionsHtml.getImage();
                            myRes.add(myImage);

                            List<int> image64 =
                                await MyConverter.getHtmlBloobAs64Biyte(
                                    myImage);
                            this.listOfUploader.add(MyHtmlImageUploader(
                                  widget.height * 0.4,
                                  widget.width * 0.4,
                                  (myNewImage) {
                                    myRes.remove(myImage);
                                    myRes.add(myNewImage);
                                    widget.whenAddMoreThanOne(myRes);
                                  },
                                  image64: image64,
                                  myImage: myImage,
                                  onRemove: (mage) {
                                    setState(() {
                                      myRes.remove(mage);
                                      this
                                          .listOfUploader
                                          .removeWhere((element) {
                                        return element.myImage.name ==
                                            mage.name;
                                      });
                                    });
                                  },
                                ));
                            widget.whenAddMoreThanOne(myRes);
                            setState(() {
                              loading = false;
                              _showSecIm = true;
                            });
                          } else {
                            if (widget.onMaxNumber != null)
                              widget.onMaxNumber();
                          }

                          _onMouseLeave();
                        }),
                  ),
                )
              : Container(),
          widget.onRemove != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => widget.onRemove(widget.myImage),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

class MyCRUDScaf extends StatefulWidget {
  String title;
  List<String> keys;
  List<Map> rows = List<Map>();
  double height;
  double width;

  ///When we create a new element
  ///it wont allow for multi adding
  Future Function() onCreate;

  Future Function(int) onDelete;
  Future Function(int) onUpdate;

  ///won't allow until we finish loading
  Function() onShowMore;
  Color background;
  Color textColor;
  Color titleColor;
  bool createLoading = false;
  bool allowLoading = false;
  List<Future> loaders = List<Future>();
  List<String> titles;
  MyCRUDScaf(this.keys, this.rows, this.title, this.titles,
      {@required this.height,
      @required this.width,
      this.onUpdate,
      this.onDelete,
      this.onCreate,
      this.onShowMore,
      this.background = Colors.blue,
      this.textColor = Colors.white,
      this.titleColor = Colors.white,
      this.createLoading = false,
      this.allowLoading = false});
  @override
  _MyCRUDScafState createState() => _MyCRUDScafState();
}

class _MyCRUDScafState extends State<MyCRUDScaf> {
  List<Widget> titles = List<Widget>();
  @override
  void initState() {
    super.initState();
    widget.titles.forEach((element) {
      titles.add(Expanded(
          child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Text(
          element,
          textAlign: TextAlign.start,
          style: MyTextStyle.simpleButtonTextStyle(),
        ),
      )));
    });
    if (widget.onDelete != null)
      titles.add(Expanded(
          child: SizedBox(
        width: 6,
      )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.background, borderRadius: BorderRadius.circular(5)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: FlatButton(
            onPressed: () {
              widget.onShowMore();
            },
            child: Text(
              widget.title,
              style:
                  MyTextStyle.simpleTitleTextStyle(myColor: widget.titleColor),
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              child: Column(
                children: [
                  Row(
                    children: titles,
                  ),
                  Container(
                    height: 1,
                    color: widget.titleColor,
                  ),
                ],
              ),
              preferredSize: Size(widget.width, 10)),
        ),
        floatingActionButton: widget.onCreate != null
            ? FloatingActionButton(
                heroTag: widget.title,
                onPressed: () async {
                  if (!widget.createLoading) {
                    if (widget.allowLoading)
                      setState(() {
                        widget.loaders.add(widget.onCreate());
                        widget.createLoading = true;
                      });
                    await widget.onCreate();
                    if (widget.allowLoading)
                      setState(() {
                        widget.createLoading = false;
                        widget.loaders.remove(widget.onCreate());
                      });
                  } // setState(() {
                  //   widget.createLoading = false;
                  //   widget.loaders.remove(widget.onCreate());
                  // });
                },
                child: widget.createLoading
                    ? SpinKitDualRing(color: Colors.white)
                    : Icon(
                        !widget.allowLoading ? Icons.add : Icons.autorenew,
                        color: Colors.white,
                      ),
              )
            : null,
        body: Container(
          height: widget.height,
          width: widget.width,
          child: ListView.builder(
              itemCount: widget.rows.length,
              itemBuilder: (context, index) {
                List<Widget> row = List<Widget>();

                for (var item in widget.keys) {
                  try {
                    row.add(Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          widget.rows[index][item].toString(),
                          textAlign: TextAlign.start,
                          style: MyTextStyle.simpleButtonTextStyle(
                              fontSize: 14, myColor: widget.textColor),
                        ),
                      ),
                    ));
                  } catch (e) {
                    row.add(Container());
                  }
                }
                if (widget.onDelete != null)
                  row.add(SimpleActionButton(
                    myColor: Colors.red,
                    radius: 20,
                    elevation: 0,
                    onTap: () {
                      widget.onDelete(index);
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ));
                return FlatButton(
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0.5, color: Colors.black.withOpacity(0.5))),
                  onPressed: () {
                    widget.onUpdate(index);
                  },
                  child: Row(
                    children: row,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class MyMultiButtons extends StatefulWidget {
  List<int> selectedIndix = List<int>();
  List<String> source;
  Function(int) onSelect;
  Function() onShowMore;
  int maxShowingPrerRow;
  int numberOfRows;
  bool allowMulti;
  MyMultiButtons(this.source, this.onSelect, this.onShowMore,
      {this.maxShowingPrerRow = 5,
      this.allowMulti = true,
      this.numberOfRows = 3,
      this.selectedIndix});
  @override
  _MyMultiButtonsState createState() => _MyMultiButtonsState();
}

class _MyMultiButtonsState extends State<MyMultiButtons> {
  bool showAll = false;
  @override
  void initState() {
    super.initState();
    if (widget.selectedIndix == null) {
      widget.selectedIndix = List<int>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildRows(maxNumber: widget.numberOfRows),
        ),
      ),
    );
  }

  List<Row> buildRows({int maxNumber = 3}) {
    List<Row> r = List<Row>();
    for (var i = 0; i < maxNumber; i++) {
      int start = (i * widget.maxShowingPrerRow) < widget.source.length
          ? i * widget.maxShowingPrerRow
          : (widget.source.length);
      int end = (start + widget.maxShowingPrerRow) < widget.source.length
          ? start + widget.maxShowingPrerRow
          : (widget.source.length);
      List<Widget> buttons = List<Widget>();
      if (start != end) {
        for (var item in widget.source.getRange(start, end)) {
          int selectedIndex = widget.source.indexOf(item);
          buttons.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  if (!widget.selectedIndix.contains(selectedIndex)) {
                    widget.selectedIndix.add(selectedIndex);
                    widget.onSelect(selectedIndex);
                  } else {
                    widget.selectedIndix.remove(selectedIndex);
                    widget.onSelect(selectedIndex);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item,
                  style:
                      MyTextStyle.simpleButtonTextStyle(myColor: Colors.black),
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                ),
              ),
              elevation: 2,
              color: widget.selectedIndix.contains(selectedIndex)
                  ? Colors.grey[200]
                  : Colors.white,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(2)),
            ),
          ));
        }
        r.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons,
        ));
      }
    }

    return r;
  }
}

class MySortWidget extends StatefulWidget {
  final List<Map> elements;
  MySortWidget(this.elements);
  @override
  _MySortWidgetState createState() => _MySortWidgetState();
}

class _MySortWidgetState extends State<MySortWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtil.getContextHeight(context) * 0.5,
      width: MyUtil.getContextWidth(context),
      child: Stack(
        children: [
          ///For each sort group
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border:
                    Border.all(color: Colors.black.withOpacity(0.4), width: 1)),
            height: MyUtil.getContextHeight(context) * 0.42,
            child: ListView.builder(
                itemCount: widget.elements.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2),
                                width: 0.5)),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                widget.elements[index]['sortTitle'],
                                style: MyTextStyle.simpleButtonTextStyle(
                                    myColor: Colors.black),
                              ),
                            ),
                            widget.elements[index].containsKey('sorts')
                                ? Center(
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    widget
                                                        .elements[index]
                                                            ['sorts']
                                                        .length;
                                                i++)
                                              MySortsElements(
                                                  widget.elements[index]
                                                      ['sorts'][i]['sortName'],
                                                  widget.elements[index]
                                                      ['sorts'][i]['sortPrice'],
                                                  (str) {
                                                widget.elements[index]['sorts']
                                                    [i]['sortName'] = str;
                                              }, (str) {
                                                widget.elements[index]['sorts']
                                                        [i]['sortPrice'] =
                                                    double.parse(str);
                                              }, () {
                                                setState(() {
                                                  widget.elements[index]
                                                          ['sorts']
                                                      .removeAt(i);
                                                });
                                              })
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () async {
                                    await MyMessegesDialog.showMyYesOrNoMessege(
                                        S.of(context).removingSort, context);
                                    if (MyMessegesDialog.pressOk)
                                      setState(() {
                                        widget.elements.removeAt(index);
                                      });
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment:
                                  Alignment.bottomLeft.add(Alignment(0, 0.6)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      widget.elements[index]['sorts'].add(
                                          {'sortName': ' ', 'sortPrice': 0.00});
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      S.of(context).sorts,
                      style: MyTextStyle.simpleLoadingTextStyle(fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () async {
                          await InputSingleDialog(S.of(context).addingSortTitle,
                              (titleSort) {
                            setState(() {
                              widget.elements.add({'sortTitle': titleSort});
                              widget.elements.last['sorts'] = List<Map>();
                              widget.elements.last['sorts']
                                  .add({'sortName': ' ', 'sortPrice': 0.00});
                            });
                          }).showTheDialog(context);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySortsElements extends StatefulWidget {
  final TextEditingController sortName = TextEditingController();
  final TextEditingController sortPrice = TextEditingController();
  final Function(String) onSortNameChange;
  final Function(String) onSortPriceChange;
  final Function() onRemove;
  MySortsElements(String sortName, double sortPrice, this.onSortNameChange,
      this.onSortPriceChange, this.onRemove) {
    this.sortName.text = sortName;
    this.sortPrice.text = sortPrice.toString();
  }
  @override
  _MySortsElementsState createState() => _MySortsElementsState();
}

class _MySortsElementsState extends State<MySortsElements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: widget.onSortNameChange,
                controller: widget.sortName,
                decoration: InputDecoration(labelText: "Sort name"),
                validator: (str) {
                  if (str.isEmpty) return S.of(context).notValideText;
                  return null;
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: widget.onSortPriceChange,
                controller: widget.sortPrice,
                decoration: InputDecoration(labelText: "Sort price"),
                validator: (str) {
                  if (str.isEmpty) return S.of(context).notValideText;
                  return MyValidators.onlyNumbers(str);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: widget.onRemove,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MySortWidgetColors extends StatefulWidget {
  final List<Color> colors;

  MySortWidgetColors(this.colors);
  @override
  _MySortWidgetColorsState createState() => _MySortWidgetColorsState();
}

class _MySortWidgetColorsState extends State<MySortWidgetColors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtil.getContextHeight(context) * 0.2,
      width: MyUtil.getContextWidth(context),
      child: Stack(
        children: [
          Container(
            height: MyUtil.getContextHeight(context) * 0.1,
            width: MyUtil.getContextWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                    color: Colors.black.withOpacity(0.2), width: 0.5)),
            child: GridView.builder(
                itemCount: widget.colors.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10, childAspectRatio: 2),
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            widget.colors.removeAt(index);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: widget.colors[index],
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      S.of(context).colorChoiseAdd,
                      style: MyTextStyle.simpleLoadingTextStyle(fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () async {
                          // await MyChooseColorsDialog().showMyDialog((col) {
                          //   if (!widget.colors.contains(col))
                          //     widget.colors.add(col);
                          // }, context);
                          // widget.onChange(widget.colors);
                          setState(() {});
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNamedImages extends StatefulWidget {
  final List<String> name;
  final List<File> images;
  final List<String> imagesUrl;
  final String addingTitle;
  final double width;
  final double height;
  MyNamedImages(this.name, this.images, this.imagesUrl, this.addingTitle,
      this.width, this.height);
  @override
  _MyNamedImagesState createState() => _MyNamedImagesState();
}

class _MyNamedImagesState extends State<MyNamedImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          Container(
            height: widget.height * 0.8,
            width: widget.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.name.length,
                itemBuilder: (context, index) {
                  File image;
                  String imgUrl;
                  GlobalKey<MyImageCLoadingFromHTMLFileOrUrlState> key =
                      GlobalKey<MyImageCLoadingFromHTMLFileOrUrlState>();

                  ///Check if its a URL source
                  if (widget.imagesUrl != null &&
                      widget.imagesUrl.length > index) {
                    imgUrl = widget.imagesUrl[index];
                  }
                  if (widget.images != null && widget.images.length > index) {
                    image = widget.images[index];
                  }
                  return Container(
                    width: widget.width * 0.2,
                    height: widget.width * 0.2,

                    ///Element
                    child: Stack(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () async {
                              var img = await MyFunctionsHtml.getImage();
                              setState(() {
                                if (widget.imagesUrl != null &&
                                    widget.imagesUrl.length > index) {
                                  widget.imagesUrl.removeAt(index);
                                }
                                if (widget.images != null &&
                                    widget.images.length > index) {
                                  widget.images.removeAt(index);
                                }
                                if (widget.images != null)
                                  widget.images.add(img);
                              });
                              key.currentState.initState();
                            },
                            child: Container(
                                child: MyImageCLoadingFromHTMLFileOrUrl(
                              image,
                              imgUrl,
                              key: key,
                            )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.name.removeAt(index);
                                if (widget.imagesUrl != null &&
                                    widget.imagesUrl.length > index) {
                                  widget.imagesUrl.removeAt(index);
                                }
                                if (widget.images != null &&
                                    widget.images.length > index) {
                                  widget.images.removeAt(index);
                                }
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 40,
                              width: MyUtil.getContextWidth(context) * 0.15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.white.withOpacity(0.7)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: TextEditingController(
                                      text: widget.name[index]),
                                  style: MyTextStyle.simpleButtonTextStyle(
                                      fontSize: 15, myColor: Colors.black),
                                  onChanged: (str) {
                                    widget.name[index] = str;
                                  },
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton.icon(
                onPressed: () async {
                  //On adding new Element
                  InputSingleDialog(S.of(context).addNewVistorName, (value) {
                    setState(() {
                      widget.name.add(value);
                    });
                  }).showTheDialog(context);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                label: Text(
                  widget.addingTitle,
                  style: MyTextStyle.simpleLoadingTextStyle(fontSize: 15),
                )),
          )
        ],
      ),
    );
  }
}

class MyImageCLoadingFromHTMLFileOrUrl extends StatefulWidget {
  File image;
  String imgUrl;
  MyImageCLoadingFromHTMLFileOrUrl(this.image, this.imgUrl, {Key key})
      : super(key: key);
  @override
  MyImageCLoadingFromHTMLFileOrUrlState createState() {
    return MyImageCLoadingFromHTMLFileOrUrlState();
  }
}

class MyImageCLoadingFromHTMLFileOrUrlState
    extends State<MyImageCLoadingFromHTMLFileOrUrl> {
  bool loading = false;
  ImageProvider imProvider;
  initData() {
    if (widget.image != null) {
      setState(() {
        loading = true;
      });
      MyConverter.getHtmlBloobAs64Biyte(widget.image).then((value) {
        setState(() {
          imProvider = MemoryImage(value);
          loading = false;
        });
      });
    } else if (widget.imgUrl != null) {
      imProvider = NetworkImage(widget.imgUrl);
      setState(() {
        loading = true;
      });
      imProvider
          .resolve(ImageConfiguration())
          .addListener(ImageStreamListener((_, __) {
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      }));
    }
  }

  @override
  void initState() {
    try {
      super.initState();
      initData();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: imProvider != null
              ? DecorationImage(image: imProvider, fit: BoxFit.cover)
              : null,
          color: Colors.grey[300]),
      child: loading
          ? SpinKitDualRing(color: Colors.blue)
          : imProvider == null
              ? Icon(
                  Icons.image,
                  color: Colors.black.withOpacity(0.4),
                )
              : Container(),
    );
  }
}

class MyMultiDropDownChoices extends StatefulWidget {
  final List<DropdownMenuItem> iteams;
  final List<String> selctedObjects;
  final Function() onAdd;
  final Function(int) onDelete;
  final Function(dynamic, int) onChange;
  final String Function(int) valueGetter;
  final SliverGridDelegate delegate;
  final double width;
  final double hight;
  MyMultiDropDownChoices(
      {@required this.iteams,
      @required this.delegate,
      @required this.onAdd,
      @required this.onChange,
      @required this.onDelete,
      @required this.selctedObjects,
      @required this.hight,
      @required this.width,
      @required this.valueGetter});
  @override
  _MyMultiDropDownChoicesState createState() => _MyMultiDropDownChoicesState();
}

class _MyMultiDropDownChoicesState extends State<MyMultiDropDownChoices> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                width: widget.width,
                height: widget.hight,
                child: GridView.builder(
                    gridDelegate: widget.delegate,
                    itemCount: widget.selctedObjects.length,
                    itemBuilder: (context, index) {
                      double myOp = 1;
                      return StatefulBuilder(
                          builder: (context, state) => ShowUpAnimation(
                                child: AnimatedOpacity(
                                  onEnd: () {
                                    if (myOp == 0) {
                                      Future.delayed(Duration(milliseconds: 5),
                                          () {
                                        state(() => myOp = 1);
                                        widget.onDelete(index);
                                      });
                                    }
                                  },
                                  duration: Duration(milliseconds: 300),
                                  opacity: myOp,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton(
                                      icon: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          state(() {
                                            myOp = 0;
                                          });
                                        },
                                      ),
                                      items: widget.iteams,
                                      onChanged: (val) {
                                        widget.onChange(val, index);
                                      },
                                      value: widget.valueGetter(index),
                                    ),
                                  ),
                                ),
                              ));
                    }),
              )),
          Expanded(
              child: TextButton.icon(
                  onPressed: widget.onAdd,
                  icon: Icon(Icons.add),
                  label: Text(S.of(context).addNewElement)))
        ],
      );
}

class ShowUpAnimation extends StatefulWidget {
  final Widget child;

  const ShowUpAnimation({Key key, this.child}) : super(key: key);

  @override
  _ShowUpAnimationState createState() => _ShowUpAnimationState();
}

class _ShowUpAnimationState extends State<ShowUpAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        value: 0.0,
        duration: Duration(
          milliseconds: 500,
        ));
    setState(() {
      _controller.value = 1;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return newAnimation.FadeScaleTransition(
      animation: _controller,
      child: widget.child,
    );
  }
}
