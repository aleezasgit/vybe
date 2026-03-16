import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vybe_app/configs/configs.dart';

enum RadioFieldLayout { row, column }

class AppRadioField extends StatelessWidget {
  const AppRadioField({
    super.key,
    required this.name,
    required this.options,
    this.label,
    this.initialValue,
    this.layout = RadioFieldLayout.column,
    this.validator,
  });

  final String name;
  final String? label;
  final String? initialValue;
  final List<String> options;
  final RadioFieldLayout layout;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      initialValue: initialValue,
      validator: validator,

      builder: (field) {
        final chips = options.map((option) {
          final isSelected = field.value == option;
          return GestureDetector(
            onTap: () => field.didChange(option),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 20.r,
                  height: 20.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? AppTheme.c.primary.main
                        : AppTheme.c.background.shade100,
                    border: Border.all(
                      color: isSelected
                          ? AppTheme.c.primary.main ?? Colors.purple
                          : AppTheme.c.lightGrey.main!,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 8.r,
                            height: 8.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.c.black,
                            ),
                          ),
                        )
                      : null,
                ),
                Space.xf(10),
                Text(
                  option,
                  style: AppText.b1!.cl(
                    AppTheme.c.text.shade800 ?? Colors.white,
                  ),
                ),
              ],
            ),
          );
        }).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Text(
                label!,
                style: AppText.l1b!.w(6).cl(AppTheme.c.text.shade800!),
              ),
              Space.yf(12),
            ],
            layout == RadioFieldLayout.row
                ? Row(
                    children: chips.expand((w) => [w, Space.xf(24)]).toList()
                      ..removeLast(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: chips.expand((w) => [w, Space.yf(16)]).toList()
                      ..removeLast(),
                  ),
            if (field.hasError) ...[
              Space.yf(6),
              Text(field.errorText ?? '', style: AppText.l1b?.cl(Colors.red)),
            ],
          ],
        );
      },
    );
  }
}
