import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/empty_list_replacement.dart';
import 'package:beautyapp/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  late LayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is ServicesErrorState,
      buildWhen: (context, state) => state is ServicesSuccessState,
      listener: (context, state) {
        if (state is ServicesErrorState) {
          internetAlert(() {
            layoutCubit.getServices();
          });
        }
      },
      builder: (context, state) {
        return state is ServicesLoadingState
            ? spinkit
            : state is ServicesSuccessState
                ? state.servicesModel.data!.isEmpty
                    ? const EmptyListReplacement(text: 'لا يوجد عناصر')
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.servicesModel.data!.length,
                        itemBuilder: (context, i) => InkWell(
                            onTap: () {
                              context.router.push(
                                  ServiceDetailsScreen(service: state.servicesModel.data![i]));
                            },
                            child: ServiceItem(service: state.servicesModel.data![i])))
                : const SizedBox();
      },
    );
  }
}
