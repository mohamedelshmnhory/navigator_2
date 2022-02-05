import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/routes/router.gr.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:beautyapp/shared/utils/internet_connectivity.dart';
import 'package:beautyapp/widgets/category_item.dart';
import 'package:beautyapp/widgets/empty_list_replacement.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrainersListScreen extends StatefulWidget {
  const TrainersListScreen({Key? key}) : super(key: key);

  @override
  _TrainersListScreenState createState() => _TrainersListScreenState();
}

class _TrainersListScreenState extends State<TrainersListScreen> {
  late LayoutCubit layoutCubit;
  @override
  void initState() {
    layoutCubit = LayoutCubit.get(context)..getTrainers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) => state is TrainersErrorState,
      buildWhen: (context, state) => state is TrainersSuccessState,
      listener: (context, state) {
        if (state is TrainersErrorState) {
          internetAlert(() {
            layoutCubit.getTrainers();
          });
        }
      },
      builder: (context, state) {
        return state is TrainersLoadingState
            ? spinkit
            : state is TrainersSuccessState
                ? state.trainersModel.data!.isEmpty
                    ? const EmptyListReplacement(text: 'لا يوجد عناصر')
                    : GridView.count(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 100 / 125,
                        children: List.generate(
                          state.trainersModel.data!.length,
                          (index) => GestureDetector(
                            onTap: () {
                              context.pushRoute(TrainerDetailsScreen(
                                  trainer: state.trainersModel.data![index]));
                            },
                            child: CategoryItem(
                                text: state.trainersModel.data![index].name,
                                image: state.trainersModel.data![index].image,
                                size: 100),
                          ),
                        ),
                      )
                : const SizedBox();
      },
    );
  }
}
