import 'package:avalia_ai/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AVAIDropdown extends StatefulWidget {
  final String label;
  final String placeholder;
  final List<String> options;
  final bool smallDropdown;
  final FormFieldValidator<String> validator;

  const AVAIDropdown({
    Key? key,
    this.label = '',
    required this.placeholder,
    required this.options,
    this.smallDropdown = false,
    required this.validator,
  }) : super(key: key);

  @override
  AVAIDropdownState createState() => AVAIDropdownState();
}

class AVAIDropdownState extends State<AVAIDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty) ...[
          Text(
            widget.label,
            textAlign: TextAlign.start,
            style: AVAITextStyle().label,
          ),
          const SizedBox(height: 4)
        ],
        FormField<String>(
          validator: widget.validator,
          initialValue: selectedValue,
          builder: (FormFieldState<String> state) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  widget.placeholder,
                  style: AVAITextStyle().placeholder,
                ),
                items: widget.options
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: AVAITextStyle().content,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  state.didChange(value);
                },
                buttonStyleData: ButtonStyleData(
                  elevation: 1,
                  height: widget.smallDropdown ? 40 : 54,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: widget.smallDropdown ? 12 : 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AVAIColors.white30,
                    boxShadow: const [],
                    border: Border.all(
                      color: AVAIColors.white20,
                      width: 1,
                    ),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AVAIColors.grey,
                  ),
                  iconSize: 14,
                  iconDisabledColor: AVAIColors.lightGrey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AVAIColors.white30,
                  ),
                  offset: const Offset(0, -4),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(4),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
