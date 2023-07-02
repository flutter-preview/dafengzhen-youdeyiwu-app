import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youdeyiwu_app/constants/app_constant.dart';

/// Terms
class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    var appName = dotenv.get(AppConstant.appName);

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Text(
                '服务协议',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 16.h),

              // 协议范围
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '一、协议范围',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    '1. $appName服务协议（以下简称"本协议"）由$appName服务提供者与$appName用户（以下简称"用户"或"您"）就服务等相关事项所订立的有效协议。您通过网络页面点击确认或以其他方式选择接受本协议的，即代表您与我们达成本协议并同意接受本协议的全部约定内容。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 为了进一步改善用户体验，我们将会持续更新服务，为用户提供版本升级、功能升级、规则升级等服务和内容的更新，本协议也可能会随之更新。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 帐号注册
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '二、帐号注册',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 您有责任妥善保管注册帐号及密码信息的安全，且您需要对注册帐号项下的行为承担法律责任。因您的原因造成的账户、密码等信息被冒用、盗用或非法使用，由此引起的一切风险、责任、损失、费用等应由您自行承担',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 您可以在任何时候注销您的账号。请注意，账号注销是一项无法恢复的操作。一旦您注销账号，我们将删除您账号内的所有信息，除非适用法律法规另有规定。您将无法通过已注销的账号获得相关服务。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 合法使用
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '三、合法使用',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 您应遵守中华人民共和国相关法律法规及您所属、所居住的国家或地区的法律法规，不得将提供的服务用于任何非法目的，也不得以任何非法方式使用提供的服务',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 您承诺发送或传播的内容应有合法来源，相关内容为您所有或您已获得权利人的授权。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 内容规则
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '四、内容规则',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 您发表的内容（包括但不限于网页、文字、图片、音频、视频、图表等）仅表明您个人的立场和观点，并不代表我们的立场或观点。作为内容的发表者，您需自行对所发表的内容负责，如因所发表内容引发的一切纠纷，由您自行承担法律责任。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '2. 用户在$appName发表的全部原创内容，著作权均归用户本人所有。用户可授权第三方以任何方式使用，不需要得到的$appName同意。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '3. 为了促进您创作内容的分享和传播，您通过$appName服务发表的公开内容，授予我们免费的、非独家使用许可，我们可以将该内容用于开发运营的产品和服务上。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '4. 用户在$appName发表的全部原创内容，著作权均归用户本人所有。用户可授权第三方以任何方式使用，不需要得到的$appName同意。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '5. 第三方若需要转载用户在$appName上发表的具有著作权的内容，应当联系用户获得授权，或按照用户规定的方式使用该内容。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '6. 为了营造绿色、阳光、健康的网络环境，我们有权根据法律法规及监管规定，针对用户使用提供的服务的行为及生成的内容进行审核、监督，为提升审核的质量及效率，我们可能会与第三方合作共同向用户提供该等服务，您同意我们会将您在$appName服务上生成的内容提供给第三方进行审核，也同意第三方可以将审核结果反馈给我们，以便我们进行验证。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '7. 如我们发现或收到他人举报您发布的内容违反法律法规或本协议约定的，我们有权进行独立判断并采取技术手段予以删除、屏蔽或断开链接。同时有权视您的行为性质，采取包括但不限于暂停或终止服务，限制、冻结或终止帐号使用，追究法律责任等措施。',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '8. 如您发现$appName服务中的内容侵犯您的合法权益的（包括但不限于肖像权、著作权等），您可与我们联系，我们会给予您帮助，解决相关问题。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 信息安全
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '五、信息安全',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 保护用户个人信息和数据安全是我们的一项基本原则。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 我们将尽力保护您使用本服务产生的数据，并为此采取合理的数据传输、存储、转换等预防保护措施。但是，互联网数据传输、存储、转换均可能存在一定未知且不确定的数据安全风险。您确认，您已明确知晓并同意接受该等因互联网引发的风险和后果，并已采取恰当的措施，以便在该等风险发生时将损失降至最低。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 知识产权
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '六、知识产权',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 非经我们同意，任何人不得擅自使用、修改、反向编译、复制、公开传播、改变、散布、发行或公开发表本网站程序或内容。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 尊重知识产权是您应尽的义务，如有违反，您应承担损害赔偿责任。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 不可抗力
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '七、不可抗力',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 由于不可抗力事件导致用户遭受损失的，我们不承担责任。不可抗力事件包括但不限于：自然灾害、如台风、洪水、冰雹；政府行为，如征收、征用；计算机病毒或黑客攻击、互联网络、通信线路等原因造成的服务中断。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 您理解并同意，在使用本服务的过程中，可能会遇到网络信息或其他用户行为带来的风险，我们不对任何信息的真实性、适用性、合法性承担责任，也不对因侵权行为给您造成的损害负责。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '3. 非我们原因导致用户损失的，我们不承担赔偿责任。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 服务变更
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '八、服务变更',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 为了改善用户体验、完善服务内容，或者为了保证本服务的安全性和功能的一致性，我们可能随时对本服务或相关功能、相关应用软件进行更新、功能强化、升级、修改或转移。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 如因自然灾害,其他信息服务商故障，相关信息设备和软件检修、维护、故障或者任何不可阻挡因素导致服务中断或终止，不视为我们违约，但我们应尽可能减少该因素对用户的影响。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 法律适用
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '九、法律适用',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Text(
                    '1. 本协议之订立、生效、解释、修订、补充、终止、执行与争议解决均适用中华人民共和国法律；如法律无相关规定的，参照商业惯例或行业惯例',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '2. 您因使用服务所产生的争议，由我们与您协商解决。协商不成时，任何一方均可向被告所在地有管辖权的人民法院提起诉讼。',
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    '3. 本协议任一条款被视为废止、无效或不可执行，该条应视为可分的且并不影响本协议其余条款的有效性及可执行性。',
                  ),
                ],
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    ));
  }
}
