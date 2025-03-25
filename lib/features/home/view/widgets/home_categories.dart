part of '../home_view.dart';

class _HomeCategoriesWidget extends StatelessWidget {
  const _HomeCategoriesWidget({required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                context.read<HomeCubit>().changeSelectedIndex(index);
              },
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: _getBorder(index, context.read<HomeCubit>().selectedIndex),
                ),
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          categories[index].image,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BoxBorder? _getBorder(int index, int selectedIndex) {
    if (index == selectedIndex) {
      return Border.all(
        color: Colors.blue,
        width: 4,
      );
    } else {
      return null;
    }
  }
}
