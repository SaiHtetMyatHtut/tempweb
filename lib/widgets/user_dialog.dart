import 'package:flutter/material.dart';

class UserDialog extends StatelessWidget {
  final String title;
  const UserDialog(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 700,
        height: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
          child: Column(
            children: [
              const Expanded(
                  flex: 1,
                  child: Text(
                    'User Creation',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: NameField(),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Expanded(
                                          child: DropDownGameType(
                                              type: 'Game Type')),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: DropDownUserType(
                                            usertype: 'User Type'),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 50),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://picsum.photos/200'))),
                          ))
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ButtonCancel(),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: ButtonCreate(),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

//fullname
class NameField extends StatelessWidget {
  const NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: const Color.fromRGBO(240, 240, 240, 1),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          label: const Text('Fullname'),
          hintText: "Enter Your Name"),
    );
  }
}

//Button Create
class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(255, 75, 0, 1)),
        ),
        child: const Text(
          'Create',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}

//Cancel Button
class ButtonCancel extends StatelessWidget {
  const ButtonCancel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(240, 240, 240, 1),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Cancel',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}

//Game Type
class DropDownGameType extends StatefulWidget {
  final String type;
  const DropDownGameType({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<DropDownGameType> createState() => _DropDownGameState();
}

class _DropDownGameState extends State<DropDownGameType> {
  var _chosenValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: _chosenValue,
        items: <String>[
          '2D',
          '3D',
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        hint: Text(widget.type), //para
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}

//User Type
class DropDownUserType extends StatefulWidget {
  final String usertype;
  const DropDownUserType({
    Key? key,
    required this.usertype,
  }) : super(key: key);

  @override
  State<DropDownUserType> createState() => _DropDownUserState();
}

class _DropDownUserState extends State<DropDownUserType> {
  var _chosenValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value: _chosenValue,
        items: <String>[
          'Agent',
          'User',
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
        hint: Text(widget.usertype), //para
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
  }
}
