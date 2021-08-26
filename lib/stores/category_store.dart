import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/catergory_repository.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  _CategoryStoreBase() {
    _loadCategories();
  }

  ObservableList<Category> categoryList = ObservableList();

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(
      0,
      Category(
        id: '*',
        description: 'Todas',
      ),
    );

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e.toString());
    }
  }
}
