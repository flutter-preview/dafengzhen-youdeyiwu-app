import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youdeyiwu_app/register/bloc/register_bloc.dart';
import 'package:youdeyiwu_app/register/bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      semanticsLabel: 'logo',
                      width: 48.w,
                      height: 48.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "已经存在账号?",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {},
                        child: Text(
                          "开始登录吧",
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, bottom: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "欢迎来到尤得一物",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "输入您的信息开始吧",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "账号",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "账号不能为空！";
                                }
                                return null;
                              },
                              focusNode: _focusNode,
                              controller: _textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "请输入账号",
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: _focusNode.hasFocus
                                    ? IconButton(
                                        onPressed: () {
                                          _textController.clear();
                                        },
                                        icon: Icon(Icons.clear),
                                      )
                                    : null,
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              "密码",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "密码不能为空！";
                                }
                                return null;
                              },
                              focusNode: _focusNode,
                              controller: _textController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "请输入密码",
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: _focusNode.hasFocus
                                    ? IconButton(
                                        onPressed: () {
                                          _textController.clear();
                                        },
                                        icon: Icon(Icons.clear),
                                      )
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(32.h),
                              child: Center(
                                child: ElevatedButton.icon(
                                  icon: Icon(Icons.person_add),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _focusNode.unfocus();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text("Great!")),
                                      );
                                    }
                                  },
                                  label: Text(
                                    "快速注册",
                                  ),
                                  style: ButtonStyle(
                                    textStyle: MaterialStatePropertyAll(
                                        Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(32.h),
                      //   child: Center(
                      //     child: MaterialButton(
                      //       onPressed: () {
                      //         print(_textController.text);
                      //       },
                      //       child: Text(
                      //         "快速注册",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .titleMedium
                      //             ?.copyWith(color: Colors.white70),
                      //       ),
                      //       color: Theme.of(context).colorScheme.primary,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
