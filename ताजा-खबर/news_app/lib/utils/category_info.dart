// ignore_for_file: non_constant_identifier_names
import 'package:news_app/architecture/category_layout.dart';

List<Category> TitleBar() {
  List<Category> CategoriesList = <Category>[];
  Category category;

  //1
  category = Category();
  category.categoryName = "Business";
  category.categoryUrl =
      "https://media.istockphoto.com/photos/the-sales-department-scores-again-picture-id1291751221?b=1&k=20&m=1291751221&s=170667a&w=0&h=PcMe7k0T31nY5_lGAK_c6Us9g4iwGAIg47OVzthSBpk=";
  CategoriesList.add(category);

  //2
  category = Category();
  category.categoryName = "Entertainment";
  category.categoryUrl =
      "https://media.istockphoto.com/photos/popcorn-and-clapperboard-picture-id1191001701";
  CategoriesList.add(category);

  //3
  category = Category();
  category.categoryName = "General";
  category.categoryUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  CategoriesList.add(category);

  //4
  category = Category();
  category.categoryName = "Health";
  category.categoryUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  CategoriesList.add(category);

  //5
  category = Category();
  category.categoryName = "Science";
  category.categoryUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  CategoriesList.add(category);

  //6
  category = Category();
  category.categoryName = "Sports";
  category.categoryUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  CategoriesList.add(category);

  //7
  category = Category();
  category.categoryName = "Technology";
  category.categoryUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  CategoriesList.add(category);

  return CategoriesList;
}
