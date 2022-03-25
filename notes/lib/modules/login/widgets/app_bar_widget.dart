import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({Key? key})
      : super(
          key: key,
          child: Container(
            color: Colors.orange,
            height: 410,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/foto.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Faça suas\nanotações\naqui',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Simples,\nrápido, fácil.',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset(
                        'assets/images/arrow.png',
                        height: 20,
                      ),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(410),
        );
}
