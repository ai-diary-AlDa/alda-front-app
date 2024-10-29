import 'package:alda_front/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillToolbarSelectHeadingButtons extends StatefulWidget {
  const QuillToolbarSelectHeadingButtons({super.key, required this.controller});

  final QuillController controller;

  @override
  State<QuillToolbarSelectHeadingButtons> createState() =>
      _QuillToolbarSelectHeadingButtonsState();
}

class _QuillToolbarSelectHeadingButtonsState
    extends State<QuillToolbarSelectHeadingButtons> {
  Attribute? _selectedAttribute;

  QuillController get controller => widget.controller;

  Style get _selectionStyle => controller.getSelectionStyle();

  final _valueToText = <Attribute, String>{
    Attribute.h1: "H1",
    Attribute.h2: "H2",
    Attribute.h3: "H3",
  };

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedAttribute = _getHeaderValue();
    });
    controller.addListener(_didChangeEditingValue);
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 16,
    );

    final iconTheme = QuillIconTheme(
        iconButtonSelectedData: IconButtonData(
            style: IconButton.styleFrom(backgroundColor: AppColors.black02)));

    final children = _attributes.map((attribute) {
      final isSelected = _selectedAttribute == attribute;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: QuillToolbarIconButton(
          tooltip: "${_valueToText[attribute]}",
          iconTheme: iconTheme,
          isSelected: isSelected,
          onPressed: () => _sharedOnPressed(attribute),
          icon: Text(
            _valueToText[attribute] ??
                (throw ArgumentError.notNull(
                  'attribute',
                )),
            style: style.copyWith(
              color: isSelected ? AppColors.white : AppColors.black02,
            ),
          ),
        ),
      );
    }).toList();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Attribute<dynamic> _getHeaderValue() {
    final attr = controller.toolbarButtonToggler[Attribute.header.key];
    if (attr != null) {
      // checkbox tapping causes controller.selection to go to offset 0
      controller.toolbarButtonToggler.remove(Attribute.header.key);
      return attr;
    }
    return _selectionStyle.attributes[Attribute.header.key] ?? Attribute.header;
  }

  void _didChangeEditingValue() {
    if (mounted) {
      setState(() {
        _selectedAttribute = _getHeaderValue();
      });
    }
  }

  void _sharedOnPressed(Attribute attribute) {
    final attribute0 =
        _selectedAttribute == attribute ? Attribute.header : attribute;
    controller.formatSelection(attribute0);
  }

  List<Attribute> get _attributes {
    return const [
      Attribute.h1,
      Attribute.h2,
      Attribute.h3,
    ];
  }
}
