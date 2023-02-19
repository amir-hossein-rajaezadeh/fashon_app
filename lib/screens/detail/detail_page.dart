import 'package:fashon_app/base/base_view_model.dart';
import 'package:fashon_app/screens/detail/component/detail_body.dart';
import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';



class DetailArguments {
 final BaseViewModelOffline data;
 final bool isFromMostPopulor;

  DetailArguments( this.data,this.isFromMostPopulor);
}



class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
        final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return DetailBody(data: args.data,isFromMostPopulor: args.isFromMostPopulor,);

  }
}