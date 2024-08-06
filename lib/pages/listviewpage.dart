import "package:app/my_const/myconstant.dart";
import "package:flutter/material.dart";
import "../helper/data_helper.dart";

class ListLesson extends StatelessWidget {
  final Function deleteItemOnList;

  ListLesson({required this.deleteItemOnList, super.key});

  @override
  Widget build(BuildContext context) {
    List allLesson = DataHelper.allAddedLesson;
    return allLesson.isNotEmpty
        ? ListView.builder(
            itemCount: allLesson.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  deleteItemOnList(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Card(
                    child: ListTile(
                      title: Text(allLesson[index].nameOfLesson),
                      leading: CircleAvatar(
                        backgroundColor: MyConstant.mainColor.shade100,
                        child: Text((allLesson[index].valueOfLetter *
                                allLesson[index].valueOfCredit)
                            .toString()),
                      ),
                      subtitle: Text(
                          "not değeri : ${allLesson[index].valueOfLetter}  kredi : ${allLesson[index].valueOfCredit}"),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
              "Ders ekleyiniz ... ",
              style: MyConstant.styleProp,
            ),
          );
  }
}
