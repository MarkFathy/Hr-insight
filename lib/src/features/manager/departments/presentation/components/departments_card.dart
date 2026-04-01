import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/src/core/utils/extentions.dart';
import 'package:hr_app/src/core/utils/nav.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/presentation/bloc/bloc.dart';
import 'package:hr_app/src/features/manager/departments/presentation/components/job_card.dart';
import 'package:shimmer/shimmer.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentDataEntity department;
  const DepartmentCard({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<DepartmentsAndJobsBloc>();
    bool departModifing = false;
    bool jobModifing = false;
    final crtl = ExpansionTileController();

    return Card(
        key: ValueKey(department.id),
        color: theme.colorScheme.secondary,
        child: StatefulBuilder(builder: (context, changeState) {
          return ExpansionTile(
            controller: crtl,
            title: departModifing
                ? Form(
                    key: bloc.deptEditfFormKey,
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return 'الحقل فارغ';
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: ('اسم القسم'),
                            contentPadding: EdgeInsets.zero),
                        onChanged: (value) {
                          changeState(() {});
                        },
                        controller: bloc.editDeptNameCtrl..text),
                  )
                : Text(department.name!,style:const TextStyle(
              color: Colors.white,
            ),),
            subtitle: Text('الوظائف : ${department.jobsCount}',style:const TextStyle(
              color: Colors.white
            ),),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () {
                      if (departModifing &&
                          bloc.editDeptNameCtrl.text != department.name) {
                        if (!bloc.deptEditfFormKey.currentState!.validate()) {
                          return;
                        }
                        bloc.add(EditDepartmentEvent(id: department.id!));
                      } else {
                        bloc.editDeptNameCtrl.text = department.name!;
                        changeState(() => departModifing = !departModifing);
                      }
                    },
                    child: departModifing
                        ? bloc.editDeptNameCtrl.text != department.name
                            ? const Icon(Icons.done_all,color: Colors.white,)
                            : const Icon(Icons.close,color: Colors.white,)
                        : const Icon(Icons.edit,color: Colors.white,)),
                20.pw,
                InkWell(
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog.adaptive(
                              content: const Text("سيتم حذف القسم نهائياً"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      bloc.add(DeleteDepartmentsEvent(
                                          department.id!));
                                      NV.pop(context);
                                    },
                                    child: const Text('موافق')),
                                TextButton(
                                    onPressed: () {
                                      NV.pop(context);
                                    },
                                    child: const Text('إلغاء')),
                              ],
                            );
                          });
                    }),
                20.pw,
                InkWell(
                    child: Icon(jobModifing ? Icons.close : Icons.add,color: Colors.white,),
                    onTap: () {
                      if (!jobModifing) {
                        if (!crtl.isExpanded) crtl.expand();
                      }
                      changeState(() {
                        jobModifing = !jobModifing;
                      });
                    }),
              ],
            ),
            children: [
              if (jobModifing)
                Form(
                  key: bloc.jobFormKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) return 'الحقل فارغ';
                                return null;
                              },
                              decoration: const InputDecoration(
                                  hintText: ('المسمى الوظيفى'),
                                  contentPadding: EdgeInsets.zero),
                              controller: bloc.jobNameCtrl..text = ''),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            if (!bloc.jobFormKey.currentState!.validate()) {
                              return;
                            }
                            bloc.add(AddJobEvent(department.id!));
                          },
                          icon: const Icon(Icons.done_all))
                    ],
                  ),
                ),
              ...department.jobs!
                  .map((e) => JobCard(job: e, deptId: department.id!))
                  .toList()
            ],
          );
        }));
  }
}

class DepartmentsIndicator extends StatelessWidget {
  const DepartmentsIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        title: Shimmer.fromColors(
          highlightColor: theme.cardColor,
          baseColor: Colors.grey.shade300,
          direction: ShimmerDirection.rtl,
          child: const Divider(
            thickness: 8,
            endIndent: 50,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            20.pw,
            const Icon(Icons.add),
          ],
        ),
        leading: Shimmer.fromColors(
            highlightColor: theme.cardColor,
            baseColor: Colors.grey.shade300,
            direction: ShimmerDirection.rtl,
            child: Icon(
              Icons.edit,
              color: theme.cardColor,
            )),
        subtitle: Shimmer.fromColors(
            highlightColor: theme.cardColor,
            baseColor: Colors.grey.shade300,
            direction: ShimmerDirection.rtl,
            child: const Divider(
              thickness: 8,
              endIndent: 100,
            )),
      ),
    );
  }
}
