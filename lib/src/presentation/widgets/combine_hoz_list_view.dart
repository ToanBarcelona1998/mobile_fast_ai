import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CombinedHozListView<T> extends StatefulWidget {
  final List<T> data;
  final Widget Function(T, int) builder;
  final Widget Function()? buildEmpty;

  const CombinedHozListView({
    Key? key,
    required this.data,
    required this.builder,
    this.buildEmpty,
  }) : super(key: key);

  @override
  State<CombinedHozListView<T>> createState() => _CombinedHozListViewState<T>();
}

class _CombinedHozListViewState<T> extends State<CombinedHozListView<T>> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty && widget.buildEmpty != null) {
      return widget.buildEmpty!();
    }

    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: [
        SliverToBoxAdapter(
          child: ListView.custom(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            childrenDelegate: SliverChildBuilderDelegate(
              (_, index) => widget.builder(widget.data[index], index),
              childCount: widget.data.length,
              addAutomaticKeepAlives: true,
              findChildIndexCallback: (key) {
                final ValueKey<T?> contactKey = key as ValueKey<T>;

                final data = contactKey.value;

                if (data != null && widget.data.contains(data) == true) {
                  final index = widget.data.indexOf(data);

                  if (index > 0) return index;

                  return null;
                }

                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
