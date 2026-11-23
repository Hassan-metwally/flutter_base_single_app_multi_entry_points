import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../common/domain/entity/users/client_entity.dart';
import '../../domain/use_cases/client_get_profile_use_case.dart';
import '../../domain/use_cases/client_update_profile_use_case.dart';

part 'client_personal_profile_state.dart';

@Injectable()
class ClientPersonalProfileCubit extends Cubit<ClientPersonalProfileState> with SafeEmitMixin {
  final ClientGetProfileUseCase _getClientDataUseCase;
  final ClientUpdateProfileUseCase _updateClientDataUseCase;
  ClientPersonalProfileCubit(this._getClientDataUseCase, this._updateClientDataUseCase) : super(const ClientPersonalProfileState.initial());

  void getData() async {
    emit(state.copyWith(getDataState: const Async.loading()));
    final result = await _getClientDataUseCase(NoParams());
    result.fold(
      (failer) {
        emit(state.copyWith(getDataState: Async.failure(failer)));
      },
      (data) {
        emit(state.copyWith(getDataState: Async.success(data)));
      },
    );
  }

  void updateProfile(ClientUpdateProfileParams params) async {
    emit(state.copyWith(updateDataState: const Async.loading()));
    final result = await _updateClientDataUseCase(params);
    result.fold(
      (failer) {
        emit(state.copyWith(updateDataState: Async.failure(failer)));
      },
      (data) {
        emit(state.copyWith(getDataState: Async.success(data), updateDataState: const Async.successWithoutData()));
      },
    );
    emit(state.copyWith(updateDataState: const Async.initial()));
  }

  @override
  void emit(ClientPersonalProfileState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
