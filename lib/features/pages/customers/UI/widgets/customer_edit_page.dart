import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h2m_destrib/core/wedgits/app_form_text_field.dart';
import 'package:h2m_destrib/features/pages/customers/logic/cubit/customers_cubit.dart';

import '../../../../../core/Theming/colors.dart';
import '../../../../../core/Theming/styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/wedgits/app_text_button.dart';

class CustomerEditPage extends StatefulWidget {
  const CustomerEditPage({super.key});

  @override
  State<CustomerEditPage> createState() => _CustomerEditPageState();
}

class _CustomerEditPageState extends State<CustomerEditPage> {
  int? priceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.mainColor,
      appBar: AppBar(
        title: Text('تسجيل عميل', style: TextStyles.titleMediumLight(context)),
        centerTitle: true,
        backgroundColor: ColorManager.mainColor,
        elevation: 3,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: ColorManager.mainAccent,
            child: const Icon(Icons.arrow_back,
                size: 40, color: ColorManager.mainWhite),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .7,
            child: Form(
              key: context.read<CustomersCubit>().customerFormKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppFormTextField(
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: ColorManager.mainAccent,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide:
                              BorderSide(color: ColorManager.mainAccent)),
                      controller:
                          context.read<CustomersCubit>().custNameTextController,
                      hintText: 'إسم العميل',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'إسم العميل مطلوب';
                        }
                        return null;
                      },
                    ),
                    spacingVertical(16),
                    AppFormTextField(
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: ColorManager.mainAccent,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide:
                              BorderSide(color: ColorManager.mainAccent)),
                      controller: context
                          .read<CustomersCubit>()
                          .custAddressTextController,
                      hintText: 'عنوان العميل',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'عنوان العميل مطلوب';
                        }
                        return null;
                      },
                    ),
                    spacingVertical(16),
                    AppFormTextField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: ColorManager.mainAccent,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide:
                              BorderSide(color: ColorManager.mainAccent)),
                      controller: context
                          .read<CustomersCubit>()
                          .custPhoneTextController,
                      hintText: 'رقم الموبايل',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رقم الموبايل مطلوب';
                        }
                        return null;
                      },
                    ),
                    spacingVertical(16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ColorManager.mainAccent,
                        ),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: RadioMenuButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Colors.transparent),
                                  ),
                                  value: 0,
                                  groupValue: priceIndex,
                                  onChanged: (selectedVal) {
                                    setState(
                                      () {
                                        priceIndex = selectedVal!;
                                      },
                                    );
                                  },
                                  child: Text("مستهلك",
                                      style: priceIndex == 0
                                          ? TextStyles.headlineMediumDark(
                                                  context)
                                              .copyWith(
                                                  color: ColorManager.mainBlack)
                                          : TextStyles.titleMediumLight(
                                              context)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: RadioMenuButton(
                                  value: 1,
                                  groupValue: priceIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      priceIndex = value!;
                                    });
                                  },
                                  child: Text("نص جملة",
                                      style: priceIndex == 1
                                          ? TextStyles.headlineMediumDark(
                                                  context)
                                              .copyWith(color: Colors.black)
                                          : TextStyles.titleMediumLight(
                                              context)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: RadioMenuButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                            Colors.transparent),
                                  ),
                                  value: 2,
                                  groupValue: priceIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      priceIndex = value!;
                                    });
                                  },
                                  child: Text("سعر الجملة",
                                      style: priceIndex == 2
                                          ? TextStyles.headlineMediumDark(
                                                  context)
                                              .copyWith(
                                              color: Colors.black,
                                            )
                                          : TextStyles.titleMediumLight(
                                              context)),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    spacingVertical(35),
                    AppTextButton(
                        backgroundColor: ColorManager.mainAccent,
                        borderRadius: 20.r,
                        buttonText: 'تسجيل العميل',
                        textStyle: TextStyles.headlineSmallLight(context),
                        onPressed: () {
                          //validateAndLogin(context);
                        }),
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}
