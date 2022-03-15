// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:territoriei/repositories/igroup_repository.dart';
import 'package:territoriei/routes.dart';
import 'package:territoriei/widget/navigator_scope.dart';

import '../blocs/group_bloc.dart';

class GroupScreen extends StatelessWidget {
  static String route = '$GroupScreen';

  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: NavigatorScope(
        home: const _Group(),
        builder: (BuildContext context, Navigator navigator) {
          return BlocProvider(
            create: (context) => GroupBloc(
              repository: RepositoryProvider.of(context),
            ),
            child: navigator,
          );
        },
        routes: {
          ...routes,
        },
      ),
    );
  }
}

class _Group extends StatefulWidget {
  const _Group({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<_Group> createState() => _GroupState();
}

class _GroupState extends State<_Group> {
  late final IGroupRepository repository;
  late final _groupBloc = BlocProvider.of<GroupBloc>(context);
  final _controller = ScrollController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _groupBloc.add(GroupGetSessionEvent());
    });
  }

  @override
  void dispose() {
    _groupBloc.close();
    _controller.dispose();
    super.dispose();
  }

  //  void _onConfirm(
  //     dynamic payload, String text, GroupSendResponseTemplate template) {
  //   _groupBloc.add(
  //     GroupSendResponseEvent(
  //       response: GroupSendResponse(
  //         payload: payload,
  //         text: text,
  //         field: template.field,
  //         type: template.type,
  //         attrs: template.attrs,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Territórios'),
        bottom: PreferredSize(
          child: Container(
            color: Colors.orange,
            height: 2.0,
          ),
          preferredSize: const Size.fromHeight(4.0),
        ),
      ),
      backgroundColor: const Color(0xff3E434C),
      body: BlocConsumer<GroupBloc, GroupState>(
        listener: (context, state) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (_controller.hasClients) {
              _controller.animateTo(
                _controller.position.maxScrollExtent,
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
              );
            }
          });
        },
        bloc: _groupBloc,
        builder: (context, state) {
          if (state is GroupWithoutSession || state is GroupGettingSession) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GroupGettingSessionSuccess) {
            final composition = state.groups;
            // ignore: avoid_print
            print(composition);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Serviços',
                        style: GoogleFonts.dancingScript(
                          textStyle: TextStyle(
                            // ignore: use_full_hex_values_for_flutter_colors
                            color: Color(0xffcc39191),
                            letterSpacing: .5,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                // _expansionServices(),
                // _cardsServices()
              ],
            );
          }
          return const Center(
            child: Text('Algo inesperado ocorreu'),
          );
        },
      ),
    );
  }
}
