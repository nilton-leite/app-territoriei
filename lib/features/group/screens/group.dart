// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:territoriei/repositories/igroup_repository.dart';
import 'package:territoriei/routes.dart';
import 'package:territoriei/widget/dynamic_icon.dart';
import 'package:territoriei/widget/progress.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _groupBloc.add(GroupGetGroupEvent());
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
    GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();
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
          if (state is GroupWithoutGroup || state is GroupGettingGroup) {
            return Center(child: Progress());
          }

          if (state is GroupGettingGroupSuccess) {
            final groups = state.groups;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Grupos',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xffFFFFFF),
                            // letterSpacing: .5,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                ),

                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () async {
                        _groupBloc.add(GroupGetGroupEvent());
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: groups.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => '',
                              child: Card(
                                color: Color(0xFF868A8F),
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: DynamicIcon(
                                        'map_outlined',
                                        color: Color(0xFFFFFFFFF),
                                        size: 80.0,
                                      ),
                                    ),
                                    Text(
                                      groups[index].description.toUpperCase(),
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          color: Color(0xffFFC000),
                                          letterSpacing: .5,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
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
