import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:helios_q2/src/core/utils/input_converter.dart';
import 'package:helios_q2/src/features/packaging/data/repositories/packaging_repository_impl.dart';
import 'package:helios_q2/src/features/packaging/domain/repositories/packaging_repository.dart';
import 'package:helios_q2/src/features/packaging/domain/use_cases/packed_up.dart';
import 'package:helios_q2/src/features/packaging/presentation/bloc/packaging_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  //! Features - Packaging
  //Bloc
  serviceLocator.registerFactory(
    () => PackagingBloc(
      packedUp: serviceLocator(),
      inputConverter: serviceLocator(),
    ),
  );
  // Use cases
  serviceLocator.registerLazySingleton(() => PackedUp(serviceLocator()));
  // Repository
  serviceLocator.registerLazySingleton<PackagingRepository>(
    () => PackagingRepositoryImpl(),
  );

  //! Core
  serviceLocator.registerLazySingleton(() => InputConverter());

  //! External
  WidgetsFlutterBinding.ensureInitialized();
}
