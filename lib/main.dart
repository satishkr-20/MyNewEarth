import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask1/app/bloc/offering_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/model/offering_model.dart';
import 'app/screens/offering_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(OfferingModelAdapter()); // Register the adapter
  await Hive.openBox<OfferingModel>('offeringsBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OfferingBloc>(
      create: (context) => OfferingBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OfferingsListScreen(),
      ),
    );
  }
}
