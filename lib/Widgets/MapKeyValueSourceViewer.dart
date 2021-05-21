import 'package:flutter/material.dart';

class MapCreatorObject extends StatefulWidget {
  final String? myKey, value;
  final void Function(String, String) onChange;
  final void Function() onDelete;
  const MapCreatorObject(
      {Key? key,
      this.myKey,
      this.value,
      required this.onChange,
      required this.onDelete})
      : super(key: key);

  @override
  _MapCreatorObjectState createState() => _MapCreatorObjectState();
}

class _MapCreatorObjectState extends State<MapCreatorObject> {
  bool editValue = false, editKey = false;
  final keyForm = GlobalKey<FormState>();
  final keyController = TextEditingController();
  final valueController = TextEditingController();
  @override
  void initState() {
    keyController.text = widget.myKey!;
    valueController.text = widget.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: keyForm,
        onChanged: () =>
            widget.onChange(keyController.text, valueController.text),
        child: Row(
          children: [
            // the key
            Expanded(
              child: TextFormField(
                controller: keyController,
                readOnly: !editKey,
                onFieldSubmitted: (v) {
                  setState(() {
                    editKey = !editKey;
                  });
                },
                onTap: () {
                  setState(() {
                    editKey = !editKey;
                  });
                },
              ),
            ),
            // the icon
            Icon(
              Icons.navigate_next_outlined,
              color: Colors.grey,
            ),
            // the value
            Expanded(
              child: TextFormField(
                controller: valueController,
                readOnly: !editValue,
                onFieldSubmitted: (v) {
                  setState(() {
                    editValue = !editValue;
                  });
                },
                onTap: () {
                  setState(() {
                    editValue = !editValue;
                  });
                },
              ),
            ),
            // the actions
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onPressed: () => widget.onDelete())
          ],
        ),
      ),
    );
  }
}

class MapKeyValueViewer extends StatefulWidget {
  final void Function(String, String)? onChange;
  final void Function()? onAdd;
  final void Function(Map)? onDelete;
  final double width, height;
  final List<Map<String, String>>? list;
  const MapKeyValueViewer(
      {Key? key,
      this.onChange,
      this.onAdd,
      this.onDelete,
      required this.width,
      required this.height,
      this.list})
      : super(key: key);

  @override
  _MapKeyValueViewerState createState() => _MapKeyValueViewerState();
}

class _MapKeyValueViewerState extends State<MapKeyValueViewer> {
  _indexKeys() {
    final k = <String>[];
    widget.list!.forEach((element) {
      k.add(element.keys.first);
    });
    widget.list!.clear();
    setState(() {
      widget.list!.addAll([
        for (final x in k) <String, String>{k.indexOf(x).toString(): x}
      ]);
    });
  }

  final cont = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.resolveWith<OutlinedBorder>(
                                (states) => RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      _indexKeys();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text("Index keys"),
                    )),
              ),
              Tooltip(
                message: "Add new Element",
                child: InkWell(
                  onTap: () {
                    // add new element to the list
                    if (widget.list!.last.isNotEmpty) {
                      // add new one
                      setState(() {
                        widget.list!.add(<String, String>{"": ""});
                      });
                      if (widget.onAdd != null) widget.onAdd!();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: Text("key")),
              Expanded(child: Text("Value"))
            ],
          ),
          Divider(),
          SizedBox(
            height: widget.height,
            width: widget.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  key: ValueKey(widget.list),
                  addAutomaticKeepAlives: true,
                  controller: cont,
                  itemCount: widget.list!.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MapCreatorObject(
                        key: ValueKey(widget.list![index]),
                        onDelete: () async {
                          setState(() {
                            widget.list!.removeAt(index);
                          });
                          if (widget.onDelete != null)
                            widget.onDelete!(widget.list![index]);
                        },
                        onChange: (key, value) {
                          // change the key and the value for this object
                          var map = <String, String>{key: value};
                          widget.list![index] = map;
                          if (widget.onChange != null)
                            widget.onChange!(key, value);
                        },
                        value: widget.list![index].values.toList()[0],
                        myKey: widget.list![index].keys.toList()[0],
                      ),
                    );
                  }),
            ),
          ),
          // the adding button
          // at the end add the icon
        ],
      ),
    );
  }
}
