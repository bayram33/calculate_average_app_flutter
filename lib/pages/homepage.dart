import "package:app/model/lesson.dart";
import "package:app/my_const/myconstant.dart";
import "package:app/pages/averagepage.dart";
import "package:app/pages/listviewpage.dart";
import "package:flutter/material.dart";
import "../helper/data_helper.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedVal = 4;
  double selectedCreditVal = 1;
  String selectedLessonName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2,
        title: Center(
          child: Text(
            MyConstant.nameOftitle,
            style: MyConstant.styleProp,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: _buildForm(),
                ),
              ),
              Expanded(
                flex: 1,
                child: AveragePage(
                    average: DataHelper.calcAverage(),
                    lessonCount: DataHelper.allAddedLesson.length),
              ),
            ],
          ),
          // list
          Expanded(
            child: ListLesson(deleteItemOnList: (index) {
              setState(() {
                DataHelper.allAddedLesson.removeAt(index);
              });
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDropdownLetter(),
              _buildDropdownCredit(),
              IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var addLesson = Lesson(
                        nameOfLesson: selectedLessonName,
                        valueOfLetter: selectedVal,
                        valueOfCredit: selectedCreditVal);
                    setState(() {
                      DataHelper.addLesson(addLesson);
                    });
                    //  print(DataHelper.allAddedLesson);
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return Padding(
      padding: MyConstant.paddingDrop,
      child: TextFormField(
        onSaved: (newValue) {
          setState(() {
            selectedLessonName = newValue!;
          });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter the lesson buddy";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(borderRadius: MyConstant.borderRadiusDrop),
          filled: true,
          fillColor: MyConstant.mainColor.shade100.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildDropdownLetter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: MyConstant.paddingDrop,
        decoration: BoxDecoration(
          color: MyConstant.mainColor.shade100.withOpacity(0.3),
          borderRadius: MyConstant.borderRadiusDrop,
          border: Border.all(width: 1),
        ),
        child: DropdownButton<double>(
          items: DataHelper.allLessonMenuItem(),
          onChanged: (value) {
            setState(() {
              selectedVal = value!;
            });
          },
          value: selectedVal,
          underline: Container(),
        ),
      ),
    );
  }

  Widget _buildDropdownCredit() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: MyConstant.paddingDrop,
        decoration: BoxDecoration(
          color: MyConstant.mainColor.shade100.withOpacity(0.3),
          borderRadius: MyConstant.borderRadiusDrop,
          border: Border.all(width: 1),
        ),
        child: DropdownButton<double>(
          items: DataHelper.allCreditMenuItem(),
          onChanged: (value) {
            setState(() {
              selectedCreditVal = value!;
            });
          },
          value: selectedCreditVal,
          underline: Container(),
        ),
      ),
    );
  }
}
