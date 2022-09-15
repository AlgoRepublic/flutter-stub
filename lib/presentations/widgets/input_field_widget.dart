import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../src/theme/base_theme.dart';

class InputFieldWidget extends StatefulWidget {
  final String? hint;
  final FocusNode? focusNode;
  final void Function(String value)? onChange;
  final IconData? prefixIcon;
  final String? prefixImage;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enable;
  final bool textAlignCenter;
  final bool isSvg;
  final bool showPadding;
  final String? label;
  final bool showDropArrow;
  final bool showBorder;
  final bool isFill;
  final bool showUnderLineBorder;
  final Widget? suffixWidget;

  const InputFieldWidget(
      {Key? key,
      this.focusNode,
      this.hint,
      this.prefixIcon,
      this.prefixImage,
      this.controller,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.enable = true,
      this.textAlignCenter = false,
      this.onChange,
      this.isSvg = false,
      this.showPadding = false,
      this.label,
      this.showDropArrow = false,
      this.showBorder = true,
      this.isFill = true,
      this.showUnderLineBorder = false,
      this.suffixWidget})
      : super(key: key);

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    obscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.subtitle2,
      maxLines: widget.maxLines,
      onChanged: widget.onChange,
      enabled: widget.enable,
      controller: widget.controller,
      textAlign:
          widget.textAlignCenter == true ? TextAlign.center : TextAlign.start,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
      textAlignVertical: TextAlignVertical.center,
      obscureText: widget.obscure ? obscure : widget.obscure,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        contentPadding: widget.showPadding
            ? const EdgeInsets.symmetric(horizontal: 22, vertical: 18)
            : null,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        labelStyle: Theme.of(context).textTheme.subtitle2,
        filled: widget.isFill,
        fillColor: BaseTheme.lightThemeBoxColor,
        border: buildUnderlineInputBorder(),
        enabledBorder: buildUnderlineInputBorder(),
        errorBorder: buildUnderlineInputBorder(),
        focusedBorder: buildUnderlineInputBorder(),
        disabledBorder: buildUnderlineInputBorder(),
        prefixIconConstraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width * 0.5,
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  widget.prefixIcon,
                  color: BaseTheme.lightThemeIconColor,
                ),
              )
            : widget.prefixImage != null
                ? Container(
                    width: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      widget.prefixImage!,
                      color: BaseTheme.lightThemeIconColor,
                    ))
                : null,
        // suffix: widget.suffixWidget,
        suffixIcon: widget.suffixWidget ??
            (widget.showDropArrow
                ? const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: BaseTheme.lightThemeIconColor,
                  )
                : !widget.obscure
                    ? null
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        child: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: BaseTheme.lightThemeIconColor,
                          size: 23,
                        ),
                      )),
      ),
    );
  }

  InputBorder buildUnderlineInputBorder() {
    return widget.showBorder
        ? widget.showUnderLineBorder
            ? const UnderlineInputBorder()
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColorLight,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              )
        : InputBorder.none;
  }
}
