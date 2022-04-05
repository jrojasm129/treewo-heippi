import 'package:flutter/material.dart';
import 'package:tree_wo/providers/providers.dart';
import 'package:tree_wo/services/navigation_service.dart';
import 'package:tree_wo/ui/screens/auth/login_screen.dart';

import '../../../widgets/widgets.dart';

class HomeCustomAppBar extends StatelessWidget {

  const HomeCustomAppBar({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Hi, ${user.name}',
              style: textTheme.headlineMedium!.copyWith(
                  color: Colors.black87, fontWeight: FontWeight.w600)),
        ),
        PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          offset: const Offset(0, 30),
            itemBuilder: (context) => [
                  PopupMenuItem(                    
                    child: const CustomIconButtom(
                      label: 'LogOut', 
                      icon: Icons.exit_to_app_outlined,
                      backGroundColor: Colors.transparent,
                      iconColor: Colors.red
                    ),
                    onTap: () async {
                      await userProvider.logOut();
                      Navigator.pushReplacement(
                          context,
                          NavigationService.fadeInTransition(
                              const LoginScreen()));
                    },
                  )
                ],
            child: user.picture != null
                ? CircleAvatar(
                    maxRadius: 15,
                    backgroundColor: Colors.white,
                    child: Image.asset(user.picture!))
                : DefaultNameAvatar(name: user.name)),
        
      ],
    );
  }
}

