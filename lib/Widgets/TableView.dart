import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Functions/ValidateStrings.dart';

import 'TemplateCRUDPAge.dart';

class TableViewObject extends StatefulWidget {
  final bool addIndex;
  final List<Map<String, dynamic>> list;
  final List<String> keys;
  final List<String> titles;
  final void Function(Map<String, dynamic>)? onTap;
  final List<Map<String, Widget Function(BuildContext, Map<String, dynamic>)>>?
      actionsWidgets;

  const TableViewObject(
      {Key? key,
      required this.list,
      required this.keys,
      required this.titles,
      this.addIndex = false,
      this.onTap,
      this.actionsWidgets})
      : super(key: key);
  @override
  _TableViewObjectState createState() => _TableViewObjectState();
}

class _TableViewObjectState extends State<TableViewObject> {
  int selectedColumn = 0;
  bool sorted = true;
  String? sortingOnWhat;

  _sortOnIndex() {
    setState(() {
      widget.list.sort((a, b) {
        if (sorted) {
          return widget.list.indexOf(a).compareTo(widget.list.indexOf(b));
        } else {
          return widget.list.indexOf(b).compareTo(widget.list.indexOf(a));
        }
      });
    });
  }

  _sorting() {
    setState(() {
      currentViewList.sort((a, b) {
        if (sorted) {
          return a[sortingOnWhat!]
              .toString()
              .compareTo(b[sortingOnWhat!].toString());
        } else {
          return b[sortingOnWhat!]
              .toString()
              .compareTo(a[sortingOnWhat!].toString());
        }
      });
    });
  }

  @override
  void initState() {
    pagination(0);
    sortingOnWhat = widget.keys[0];
    super.initState();
    _sorting();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  List<Map<String, dynamic>> currentViewList = <Map<String, dynamic>>[];
  final cont = ScrollController();
  double getSpacing() {
    final s = 50 * widget.keys.length.toDouble();
    if (s < MediaQuery.of(context).size.width) {
      return MediaQuery.of(context).size.width /
          (widget.keys.length + (widget.actionsWidgets?.length ?? 0) + 2);
    }
    return 50;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Center(
        child: Container(
          key: ValueKey(widget.list.length),
          child: widget.list.isEmpty
              ? NoElementWidget()
              : ScrollConfiguration(
                  behavior: MScroll(),
                  child: Center(
                    child: PaginatedDataTable(
                      columnSpacing: getSpacing(),
                      showCheckboxColumn: false,
                      sortColumnIndex: selectedColumn,
                      sortAscending: sorted,
                      columns: [
                        if (widget.addIndex)
                          DataColumn(
                              label: Text("N"),
                              onSort: (index, bol) {
                                selectedColumn = index;
                                _sortOnIndex();
                              }),
                        for (int i = 0; i < widget.keys.length; i++)
                          DataColumn(
                              label: Text(widget.titles[i]),
                              onSort: (index, bol) {
                                sortingOnWhat = widget.keys[i];
                                selectedColumn = index;
                                sorted = bol;
                                _sorting();
                              }),
                        if (widget.actionsWidgets != null)
                          for (final x in widget.actionsWidgets!)
                            DataColumn(label: Text(x.keys.toList()[0]))
                      ],

                      onPageChanged: (index) {
                        currentIndex = index;
                        pagination(currentIndex);
                        // pagination
                      },
                      rowsPerPage: getRowPerPage(),
                      source: MySource(
                          currentViewList, widget.addIndex, widget.keys, (ww) {
                        widget.onTap!(ww as Map<String, dynamic>);
                      }, widget.actionsWidgets, context, widget.list.length,
                          (index) => widget.list[index]),
                      // rows: [
                      //   for (final object in widget.list)
                      //     DataRow(cells: <DataCell>[
                      //       if (widget.addIndex)
                      //         DataCell(Text(widget.list.indexOf(object).toString())),
                      //       for (final x in widget.keys)
                      //         DataCell(Text(object[x]?.toString() ?? "-")),
                      //       if (widget.actionsWidgets != null)
                      //         for (final x in widget.actionsWidgets)
                      //           DataCell(x.values.toList()[0](context, object))
                      //     ], onSelectChanged: (x) => widget.onTap(object))
                      // ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  int getRowPerPage() => widget.list.length > 80 ? 80 : widget.list.length;
  int currentIndex = 0;
  void pagination(int startIndex) {
    currentViewList.addAll(widget.list
        .getRange(startIndex, startIndex + getRowPerPage())
        .toList());
  }
}

class MySource extends DataTableSource {
  final List<Map<String, dynamic>> list;
  final List<String> keys;
  final bool addIndex;
  final void Function(Map) onTap;
  final int count;
  final Map Function(int) onLastValueAdded;
  final List<Map<String, Widget Function(BuildContext, Map<String, dynamic>)>>?
      actionsWidgets;
  final BuildContext context;
  MySource(this.list, this.addIndex, this.keys, this.onTap, this.actionsWidgets,
      this.context, this.count, this.onLastValueAdded);
  @override
  DataRow getRow(int index) {
    if (!(index < list.length)) {
      // reset the values
      list.add(onLastValueAdded(index) as Map<String, dynamic>);
    }

    var object = list[index];
    return DataRow(
        key: ValueKey(object.toString()),
        cells: <DataCell>[
          if (this.addIndex) DataCell(Text(index.toString())),
          for (final x in this.keys)
            DataCell(Text(getTextObject(object[x]) ?? "-")),
          if (this.actionsWidgets != null)
            for (final x in this.actionsWidgets!)
              DataCell(x.values.toList()[0](context, object))
        ],
        onSelectChanged: (val) => this.onTap(object));
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => count;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
  String? getTextObject(object) {
    if (object == null) return '-';
    if (object is Map)
      return MyValidatorString.getObjectLangTextFromLang(object);
    if (object is List) return getTextObject(object[0]);
    return object.toString();
  }
}

class MScroll extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics();
  }
}

class ActionObject {
  Widget? child;
  String? title;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  ActionObject({
    required this.child,
    required this.title,
  });

  ActionObject copyWith({
    Widget? child,
    String? title,
  }) {
    return new ActionObject(
      child: child ?? this.child,
      title: title ?? this.title,
    );
  }

  @override
  String toString() {
    return 'ActionObject{child: $child, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActionObject &&
          runtimeType == other.runtimeType &&
          child == other.child &&
          title == other.title);

  @override
  int get hashCode => child.hashCode ^ title.hashCode;

  factory ActionObject.fromMap(Map<String, dynamic> map) {
    return new ActionObject(
      child: map['child'] as Widget?,
      title: map['title'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'child': this.child,
      'title': this.title,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}
