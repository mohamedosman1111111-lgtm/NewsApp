import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/state.dart';
import 'package:news_app/feathers/main_layout/Articles/ArticleItem.dart';
import 'package:news_app/feathers/main_layout/sources/search_viewModel.dart';
import 'package:news_app/utils/AppColors.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchViewModel viewModel;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<SearchViewModel>();
    viewModel.clear();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextField(
              controller: controller,
              autofocus: true,
              inputFormatters: [LengthLimitingTextInputFormatter(500)],
              style: TextStyle(color: theme.primaryColor),
              cursorColor: theme.primaryColor,
              onChanged: (value) {
                setState(() {});
                viewModel.search(value);
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(color: AppColors.grey),
                prefixIcon: Icon(Icons.search, color: theme.primaryColor),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                  icon: Icon(Icons.close, color: theme.primaryColor),
                  onPressed: () {
                    controller.clear();
                    viewModel.clear();
                    setState(() {});
                  },
                ),
                filled: true,
                fillColor: theme.focusColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ),
        body: Consumer<SearchViewModel>(
          builder: (context, vm, _) {
            final state = vm.state;
            switch (state) {
              case InitialState():
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.search, size: 64, color: AppColors.grey),
                      const SizedBox(height: 12),
                      const Text(
                        "Search for news articles",
                        style: TextStyle(color: AppColors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                );
              case LoadingState():
                return Center(
                  child: CircularProgressIndicator(color: theme.primaryColor),
                );
              case ErrorState():
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.primaryColor),
                    ),
                  ),
                );
              case SuccessState():
                if (state.data.isEmpty) {
                  return const Center(
                    child: Text(
                      "No results found",
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  itemCount: state.data.length,
                  separatorBuilder: (_, __) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.012,
                  ),
                  itemBuilder: (_, index) =>
                      ArticleItem(article: state.data[index]),
                );
            }
          },
        ),
      ),
    );
  }
}