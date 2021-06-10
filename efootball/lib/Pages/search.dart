import 'package:efootball/Helper/Services.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> team = <dynamic>[];
  TextEditingController _searchController;
  bool loading = true;
  FocusNode searchFocus;
  @override
  void initState() {
    super.initState();
    searchFocus = FocusNode();
    _searchController = TextEditingController();
    loading = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchFocus.dispose();
    super.dispose();
  }

  Future<List<dynamic>> getTeam() async {
    List<dynamic> allTeam = await Services().searchTeam(_searchController.text);
    return allTeam;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Search team"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            setState(() {
              team.clear();
            });
          },
          child: Column(
            children: [
              TextField(
                focusNode: searchFocus,
                onSubmitted: (value) async {
                  loading = true;
                  await getTeam().then((allteam) {
                    setState(() {
                      loading = false;
                      team.clear();
                      team = allteam;
                    });
                  });
                },
                controller: _searchController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[350],
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Search team",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Expanded(
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("${team[index]['strTeam']}"),
                          );
                        },
                        itemCount: team.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
