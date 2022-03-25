import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/modules/home/widgets/add_button_widget.dart';
import 'package:notes/modules/login/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback? onTap;
  AppBarWidget({
    Key? key,
    required this.user,
    this.onTap,
  }) : super(
          key: key,
          child: Container(
            height: 125,
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(user.photoUrl!)),
                title: RichText(
                  text: TextSpan(
                    text: 'Olá, ',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: user.name!,
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                trailing: AddButtonWidget(
                  onTap: onTap ?? () {},
                ),
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(125),
        );
}
