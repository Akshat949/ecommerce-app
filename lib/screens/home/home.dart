import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kToolbarHeight + 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "E Commerce",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(7.5),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search...",
                      filled: true,
                      fillColor: Colors.grey.shade100),
                ),
                SizedBox(height: 24,),
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: CategoriesList.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(e),
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Top Selling",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> CategoriesList = [
  "https://static.vecteezy.com/system/resources/previews/009/345/233/original/stir-fry-salad-with-sushi-and-shrimps-in-a-bowl-with-a-slate-background-top-view-copy-space-shrimp-and-vegetables-served-with-salad-chopsticks-with-asian-food-vector-free-png.png",
  "https://www.pngkey.com/png/full/20-201517_image-freeuse-taco-vegetable-design-food-vector-free.png",
  "https://www.myindiamyglory.com/wp-content/uploads/2016/09/food-and-beverages.png",
  "https://www.seekpng.com/png/full/316-3164991_junk-food-clipart-burger-fry-junk-food-vector.png",
  "https://clipart-library.com/images_k/healthy-food-transparent/healthy-food-transparent-3.png"
];
