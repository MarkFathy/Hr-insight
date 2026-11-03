import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hr_app/core/utils/connectivity_auto_restore_mixin.dart';
import 'package:hr_app/core/utils/extensions.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';

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
  String _searchQuery = '';
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void onConnectivityRestored() {}

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = widget.employees.where((e) {
      if (_searchQuery.trim().isEmpty) return true;
      final name = e.name?.toLowerCase() ?? '';
      final job = e.job?.title?.toLowerCase() ?? '';
      final dept = e.department?.name?.toLowerCase() ?? '';
      final query = _searchQuery.toLowerCase().trim();
      return name.contains(query) ||
          job.contains(query) ||
          dept.contains(query);
    }).toList();

    final showAllTile = widget.showAllOption && _searchQuery.isEmpty;
    final totalCount = (showAllTile ? 1 : 0) + filteredEmployees.length;

    return Container(
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
                setState(() {
                  _searchQuery = val;
                });
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
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.white.withValues(alpha: 0.7),
                          size: 18,
                        ),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
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

          // Employees List (Virtualized with ListView.builder)
          Flexible(
            child: filteredEmployees.isEmpty && !showAllTile
                ? Padding(
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
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: totalCount,
                    itemBuilder: (context, index) {
                      if (showAllTile && index == 0) {
                        return _buildEmployeeTile(
                          context: context,
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

                      return _buildEmployeeTile(
                        context: context,
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
                  ),
          ),
          16.ph,
        ],
      ),
    );
  }

  Widget _buildEmployeeTile({
    required BuildContext context,
    required bool isSelected,
    required String name,
    required String subtitle,
    required VoidCallback onTap,
    String? imageUrl,
    IconData? icon,
  }) {
    final validImageUrl = imageUrl.toValidImageUrl;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: isSelected
            ? context.colors.primary.withValues(alpha: 0.12)
            : context.colors.surface.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: isSelected ? context.colors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 4,
          ),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primary.withValues(alpha: 0.15),
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : context.colors.primary.withValues(alpha: 0.4),
                width: 1.5,
              ),
            ),
            child: ClipOval(
              child: validImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: validImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ColoredBox(
                        color: context.colors.surface,
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, _, _) => Icon(
                        Icons.person_rounded,
                        color: context.colors.primary,
                        size: 24,
                      ),
                    )
                  : Icon(
                      icon ?? Icons.person_rounded,
                      color: context.colors.primary,
                      size: 24,
                    ),
            ),
          ),
          title: Text(
            name,
            style: context.typography.titleSmall.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? context.colors.primary : Colors.white,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: context.typography.bodySmall.copyWith(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 11,
            ),
          ),
          trailing: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? context.colors.primary : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? context.colors.primary
                    : Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.black)
                : null,
          ),
        ),
      ),
    );
  }
}
