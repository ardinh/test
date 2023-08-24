import 'package:haha/models/core_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListPanel extends StatefulWidget {
  final List<CoreModel>? items;
  final ScrollController scrollController;
  final void Function(bool showLoader, bool showSearch)? onScroll;
  final Function(CoreModel data)? onAction;
  final List<dynamic>? dataChecked;
  final Function(CoreModel data, bool checked)? onChanged;
  final bool useCheckbox;
  const ListPanel(
      {Key? key,
      this.items,
      this.onScroll,
      this.onAction,
      required this.scrollController,
      this.dataChecked,
      this.onChanged,
      this.useCheckbox = false})
      : super(key: key);

  @override
  _ListPanelState createState() => _ListPanelState();
}

class _ListPanelState extends State<ListPanel> {
  final _scrollThreshold = 50.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.onScroll != null) {
      widget.onScroll!(
          (widget.scrollController.position.maxScrollExtent -
                  widget.scrollController.position.pixels <=
              _scrollThreshold),
          (widget.scrollController.position.userScrollDirection ==
              ScrollDirection.forward));
    }
  }

  @override
  Widget build(BuildContext context) {
    if ((widget.items != null && widget.items!.isNotEmpty)) {
      return SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            crossAxisSpacing: 2, // Spasi antara kolom
            mainAxisSpacing: 2, // Spasi antara baris
          ),
          itemBuilder: (BuildContext context, int index) {
            return index >= widget.items!.length
                ? const SizedBox.shrink()
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      // index: index,
                      child: widget.items![index].getListItem(context),
                      // actions: widget.items![index].getActions(),
                      onTap: () => /*Get.toNamed(Routes.Invoice) */ widget
                          .onAction!(widget.items![index]),
                    ),
                  );
          },
          itemCount: widget.items!.length + 1,
          controller: widget.scrollController,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
