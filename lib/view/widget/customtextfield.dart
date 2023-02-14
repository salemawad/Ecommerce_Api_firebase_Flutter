import 'package:flutter/material.dart';
import 'package:myecommerc/coordination/colors.dart';

class CustomField extends StatelessWidget {
  final String title;
  final IconData? iconsuff;
  final IconData? icon;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool? obscuertext;
  final void Function()? onTapICon;
  final  void Function(String?)? onsaved;

  const CustomField(
      {Key? key,
      required this.title,
      this.iconsuff,
      required this.mycontroller,
      required this.valid,
      this.obscuertext,
      this.onTapICon,
      this.icon, this.onsaved
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      child: TextFormField(
        onSaved: onsaved ,
        validator: valid,
        obscureText: obscuertext == null || obscuertext == false ? false : true,
        controller: mycontroller,
        cursorColor: MyColors.primary,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1,color: MyColors.primary)),
          label: Text(
            title,
            style: const TextStyle(fontSize: 13),
          ),
          suffix: InkWell(
            child: Icon(icon),
            onTap: onTapICon,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
      ),
    );
  }
}
