import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/edorsement_item.dart';
import 'package:beautyapp/widgets/empty_list_replacement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({Key? key}) : super(key: key);

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  late LayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getCertifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is CertificationsErrorState,
      buildWhen: (context, state) => state is CertificationsSuccessState,
      listener: (context, state) {
        if (state is CertificationsErrorState) {
          internetAlert(() {
            layoutCubit.getCertifications();
          });
        }
      },
      builder: (context, state) {
        return state is CertificationsLoadingState
            ? spinkit
            : state is CertificationsSuccessState
                ? state.certificationsModel.data!.isEmpty
                    ? const EmptyListReplacement(text: 'لا يوجد عناصر')
                    : GridView.count(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        children: List.generate(
                          state.certificationsModel.data!.length,
                          (index) => CertificationItem(
                              certification:
                                  state.certificationsModel.data![index]),
                        ),
                      )
                : const SizedBox();
      },
    );
  }
}
