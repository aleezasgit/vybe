import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vybe_app/configs/configs.dart';

class FormBuilderSelectableChips extends FormBuilderField<List<String>> {
  final String label;
  final List<String> options;

  FormBuilderSelectableChips({
    super.key,
    required super.name,
    required this.label,
    required this.options,
    List<String>? initialValue,
    super.validator,
  }) : super(
         initialValue: initialValue ?? [],
         builder: (FormFieldState<List<String>> field) {
           return _FormBuilderSelectableChipsWidget(
             field: field,
             label: label,
             options: options,
           );
         },
       );

  @override
  FormBuilderFieldState<FormBuilderSelectableChips, List<String>>
  createState() => _FormBuilderSelectableChipsState();
}

class _FormBuilderSelectableChipsState
    extends FormBuilderFieldState<FormBuilderSelectableChips, List<String>> {}

class _FormBuilderSelectableChipsWidget extends StatelessWidget {
  const _FormBuilderSelectableChipsWidget({
    required this.field,
    required this.label,
    required this.options,
  });

  final FormFieldState<List<String>> field;
  final String label;
  final List<String> options;

  void _toggle(String option) {
    final current = List<String>.from(field.value ?? []);
    if (current.contains(option)) {
      current.remove(option);
    } else {
      current.add(option);
    }
    field.didChange(current);
  }

  @override
  Widget build(BuildContext context) {
    final selected = field.value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppText.b1b!.w(6).cl(AppTheme.c.text.shade800 ?? Colors.white),
        ),
        Space.yf(6),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: options.map((option) {
            final isSelected = selected.contains(option);
            return _SelectableChip(
              label: option,
              isSelected: isSelected,
              onTap: () => _toggle(option),
            );
          }).toList(),
        ),
        if (field.hasError) ...[
          Space.yf(6),
          Text(field.errorText!, style: AppText.b2?.cl(Colors.red)),
        ],
      ],
    );
  }
}

class _SelectableChip extends StatelessWidget {
  const _SelectableChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: Space.all(17, 9.5),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.c.primary.main
              : AppTheme.c.background.main,
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(
            color: isSelected
                ? AppTheme.c.primary.main ?? Colors.purple
                : Color(0xFF141824),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppText.b1!
                  .s(isSelected ? 13.sp : 12.sp)
                  .w(isSelected ? 7 : 4)
                  .cl(AppTheme.c.text.shade800!),
            ),
            if (isSelected) ...[
              Space.xf(5),
              Icon(
                Icons.close,
                size: 15.r,
                color: AppTheme.c.white!.withValues(alpha: 0.8),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
