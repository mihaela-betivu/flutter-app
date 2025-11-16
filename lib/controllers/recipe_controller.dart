import 'package:get/get.dart';
import 'package:flutter_application_1/data/data.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/models/recipe.dart';
import 'package:flutter_application_1/models/new_recipe.dart';

class RecipeController extends GetxController {
  // Observables
  var user = Rxn<User>();
  var searchPlaceholder = ''.obs;
  var categories = <Category>[].obs;
  var recipes = <Recipe>[].obs;
  var newRecipes = <NewRecipe>[].obs;
  var filteredRecipes = <Recipe>[].obs;

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  var selectedCategoryId = 1.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // Încărcarea datelor
  Future<void> loadData() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // Simulăm un delay pentru loading
      await Future.delayed(Duration(seconds: 1));

      // Parsăm datele
      user.value = User.fromJson(recipeData['user']);
      searchPlaceholder.value = recipeData['filters']['search_placeholder'];

      categories.value = (recipeData['filters']['categories'] as List)
          .map((item) => Category.fromJson(item))
          .toList();

      recipes.value = (recipeData['recipes'] as List)
          .map((item) => Recipe.fromJson(item))
          .toList();

      newRecipes.value = (recipeData['new_recipes'] as List)
          .map((item) => NewRecipe.fromJson(item))
          .toList();

      filteredRecipes.value = recipes;

    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Eroare la încărcarea datelor: $e';
      print('Eroare: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Selectare categorie
  void selectCategory(int categoryId) {
    selectedCategoryId.value = categoryId;

    // Update selected state
    categories.value = categories.map((cat) {
      return Category(
        id: cat.id,
        name: cat.name,
        selected: cat.id == categoryId,
      );
    }).toList();

    filterRecipes();
  }

  // Căutare rețete
  void searchRecipes(String query) {
    searchQuery.value = query;
    filterRecipes();
  }

  // Filtrare rețete
  void filterRecipes() {
    var filtered = recipes.toList();

    // Filtrare după căutare
    if (searchQuery.value.isNotEmpty) {
      filtered = filtered
          .where((recipe) => recipe.name
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase()))
          .toList();
    }

    // Aici poți adăuga logica pentru filtrare după categorie
    // if (selectedCategoryId.value != 1) { ... }

    filteredRecipes.value = filtered;
  }

  // Toggle bookmark
  void toggleBookmark(int recipeId) {
    final index = recipes.indexWhere((r) => r.id == recipeId);
    if (index != -1) {
      recipes[index].isBookmarked = !recipes[index].isBookmarked;
      recipes.refresh();
      filterRecipes();
    }
  }

  // Refresh
  Future<void> refreshData() async {
    await loadData();
  }
}