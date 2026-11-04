import 'package:flutter/material.dart';
import 'package:hr_app/core/extensions/extensions.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/manager_employees/presentation/widgets/employee_picker_tile.dart';

class EmployeePickerSheet extends StatefulWidget {
  final List<EmployeeDataEntity> employees;
  final int? selectedId;
  final bool showAllOption;
  final ValueChanged<EmployeeDataEntity?> onSelected;

  const EmployeePickerSheet({
    required this.employees,
    required this.selectedId,
    required this.onSelected,
    super.key,
    this.showAllOption = true,
  });

  static Future<void> show({
    required BuildContext context,
    required List<EmployeeDataEntity> employees,
    required int? selectedId,
    required ValueChanged<EmployeeDataEntity?> onSelected,
    bool showAllOption = true,
  }) => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) => EmployeePickerSheet(
      employees: employees,
      selectedId: selectedId,
      onSelected: onSelected,
      showAllOption: showAllOption,
    ),
  );

  @override
  State<EmployeePickerSheet> createState() => _EmployeePickerSheetState();
}

class _EmployeePickerSheetState extends State<EmployeePickerSheet>
    with AutoConnectivityRestoreMixin {
  final ValueNotifier<String> _searchQueryNotifier = ValueNotifier<String>('');
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    _searchQueryNotifier.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.8,
    ),
    decoration: BoxDecoration(
      color: context.colors.background,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 20,
          offset: const Offset(0, -5),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Drag handle
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),

        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: context.colors.primary.withValues(alpha: 0.12),
                      borderRadius: context.radius.smBorder,
                    ),
                    child: Icon(
                      Icons.people_alt_rounded,
                      color: context.colors.primary,
                      size: 20,
                    ),
                  ),
                  10.pw,
                  Text(
                    'اختر الموظف',
                    style: context.typography.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.employees.length} موظف',
                  style: context.typography.labelSmall.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Search Field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            controller: _searchCtrl,
            onChanged: (val) {
              _searchQueryNotifier.value = val;
            },
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.colors.surface.withValues(alpha: 0.6),
              hintText: 'بحث باسم الموظف أو القسم...',
              hintStyle: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: context.colors.primary,
                size: 20,
              ),
              suffixIcon: ValueListenableBuilder<String>(
                valueListenable: _searchQueryNotifier,
                builder: (context, query, _) => query.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 18,
                        ),
                        onPressed: () {
                          _searchCtrl.clear();
                          _searchQueryNotifier.value = '';
                        },
                      )
                    : const SizedBox.shrink(),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: context.colors.primary,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: context.colors.primary,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: context.colors.primary,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),

        const Divider(height: 1),

        // Employees List (Isolated search filtering rebuilds)
        Flexible(
          child: ValueListenableBuilder<String>(
            valueListenable: _searchQueryNotifier,
            builder: (context, query, _) {
              final filteredEmployees = widget.employees.where((e) {
                if (query.trim().isEmpty) return true;
                final name = e.name?.toLowerCase() ?? '';
                final job = e.job?.title?.toLowerCase() ?? '';
                final dept = e.department?.name?.toLowerCase() ?? '';
                final q = query.toLowerCase().trim();
                return name.contains(q) || job.contains(q) || dept.contains(q);
              }).toList();

              final showAllTile = widget.showAllOption && query.isEmpty;
              final totalCount =
                  (showAllTile ? 1 : 0) + filteredEmployees.length;

              if (filteredEmployees.isEmpty && !showAllTile) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_search_rounded,
                        size: 48,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                      10.ph,
                      Text(
                        'لا يوجد موظف بهذا الاسم',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: totalCount,
                itemBuilder: (context, index) {
                  if (showAllTile && index == 0) {
                    return EmployeePickerTile(
                      isSelected: widget.selectedId == null,
                      name: 'جميع الموظفين',
                      subtitle: 'عرض كافة طلبات وبيانات الموظفين',
                      icon: Icons.groups_rounded,
                      onTap: () {
                        widget.onSelected(null);
                        Navigator.pop(context);
                      },
                    );
                  }

                  final empIndex = showAllTile ? index - 1 : index;
                  final emp = filteredEmployees[empIndex];
                  final isSelected = widget.selectedId == emp.id;
                  final deptOrJob = [
                    if (emp.department?.name != null) emp.department!.name!,
                    if (emp.job?.title != null) emp.job!.title!,
                  ].join(' • ');

                  return EmployeePickerTile(
                    isSelected: isSelected,
                    name: emp.name ?? 'بدون اسم',
                    subtitle: deptOrJob.isNotEmpty ? deptOrJob : 'موظف',
                    imageUrl: emp.image,
                    onTap: () {
                      widget.onSelected(emp);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          ),
        ),
        16.ph,
      ],
    ),
  );
}
