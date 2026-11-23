import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';

typedef MoreState = Async<void>;

@Injectable()
class ProviderMoreCubit extends Cubit<MoreState> with SafeEmitMixin {
  ProviderMoreCubit() : super(const Async.initial());
}
