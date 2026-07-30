import 'package:bloc/bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/di/di.dart';
import '../../domain/use_case/_client_register_use_case.dart';

typedef ClientRegisterState = Async<void>;

class ClientRegisterCubit extends Cubit<ClientRegisterState> with SafeEmitMixin {
  ClientRegisterCubit() : super(const Async.initial());

  final ClientRegisterUseCase _registerUseCase = injector();

  void register(ClientRegisterParams params) async {
    emit(const Async.loading());
    final result = await _registerUseCase(params);
    result.fold(
      (failure) {
        emit(Async.failure(failure));
      },
      (_) {
        emit(const Async.successWithoutData());
      },
    );
    emit(const Async.initial());
  }
}
