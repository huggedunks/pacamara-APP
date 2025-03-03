import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pacamara_app/domain/usecase/memo_list/get_memo_list_usecase.dart';

final getMemoListUsecaseProvider = Provider.autoDispose((ref) => GetMemoListUsecase());
