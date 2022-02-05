import 'package:beautyapp/layout/cubit/cubit.dart';
import 'package:beautyapp/layout/cubit/states.dart';
import 'package:beautyapp/layout/layout.dart';
import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  void initState() {
    super.initState();
    LayoutCubit.get(context).aboutUS();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listenWhen: (context, state) =>
          state is AboutSuccessState || state is AboutErrorState,
      buildWhen: (context, state) =>
          state is AboutSuccessState || state is AboutLoadingState,
      listener: (context, state) {},
      builder: (context, state) {
        return state is AboutSuccessState
            ? SizedBox.expand(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Html(data: state.msg),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'أكاديمية برادا للتجميل',
                    //       style: Theme.of(context).textTheme.headline5,
                    //       textAlign: TextAlign.start,
                    //     ),
                    //     SizedBox(height: vSpace(1),),
                    //     Text(
                    //       'نحدد أنفسنا من خلال أعضائنا المصممون وفناني التجميلوالمصنعين والموزعين والموظفين المستقلين والموظفينوالصالونات والمنتجعات والموردين ومدارس التجميل والطلاب.ونحن جميعا نشترك في شغف وهدف مشترك: القيام بالعمل الذي نحبه وأن نكون الأفضل في أعمالنا، والارتقاء بأنفسنا ، وبعضنا البعض ، وصناعتنا كما نذهب.',
                    //       style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black,fontSize: 12,height: 2.5),
                    //       textAlign: TextAlign.start,
                    //     ),
                    //     SizedBox(height: vSpace(1),),
                    //     Text(
                    //       'دعمنا المستمر',
                    //       style: Theme.of(context).textTheme.headline5,
                    //       textAlign: TextAlign.start,
                    //     ),
                    //     SizedBox(height: vSpace(1),),
                    //     Text(
                    //       'نحن نقدم مواد تدريبية عالية الجودة عبر البريد الإلكتروني عند التسجيل ، للسماح لك ببدء التعلم على الفور. ستدعمك المواد أيضًا بعد تدريبك ويسهل الوصول إليها عبر الإنترنت أو يمكن طباعتها ، إذا كنت تفضل ذلك. فريق الحجوزات لدينا ودود ومحترف لضمان معالجة حجزك بسرعة.',
                    //       style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black,fontSize: 12,height: 2.5),
                    //       textAlign: TextAlign.start,
                    //     ),
                    //   ],
                    // ),
                  ),
                ),
              )
            : spinkit;
      },
    );
  }
}
