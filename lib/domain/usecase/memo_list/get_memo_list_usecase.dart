import 'package:pacamara_app/domain/usecase/usecase.dart';
import 'package:pacamara_app/presentation/common/states/memo_list/memo_list_provider.dart';

class GetMemoListUsecase implements Usecase<List<MemoEntity>, GetMemoListUsecaseParam> {
  @override
  Future<List<MemoEntity>> call(GetMemoListUsecaseParam params) async {
    return Future.delayed(const Duration(seconds: 2), () {
      if (params.pageNo > 3) {
        return [];
      } else {
        return [
          MemoEntity(1),
          MemoEntity(2),
          MemoEntity(3),
        ];
      }
    });
  }
}

class GetMemoListUsecaseParam {
  GetMemoListUsecaseParam(this.pageNo);
  final int pageNo;
}
