import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../referral_Program/widgets/earnings_summary_card.dart';
import '../../referral_Program/widgets/how_it_works_step.dart';
import '../../referral_Program/widgets/recent_referral_tile.dart';
import '../../referral_Program/widgets/referral_code_card.dart';
import '../../referral_Program/widgets/social_share_button.dart';


class ReferralProgramScreen extends StatelessWidget {
  static const routeName = '/referral-program';

  const ReferralProgramScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey, 
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: null, 
        ),
        title: const Text('Referral Program'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textTitle, 
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: AppColors.lightGreenBackground, 
                      child: Icon(
                        Icons.card_giftcard,
                        color: AppColors.primaryGreen,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Invite & Earn',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textTitle, 
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Share your referral code with friends and earn\nrewards when they join',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textBody, 
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),

        
              const ReferralCodeCard(referralCode: 'REF2024XY'),
              const SizedBox(height: 24.0),

            
              const Text(
                'Share with Friends',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle, 
                ),
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SocialShareButton(
                    label: 'WhatsApp',
                    icon: FontAwesomeIcons.whatsapp,
                    color: AppColors.whatsapp,
                  ),
                  SocialShareButton(
                    label: 'Telegram',
                    icon: FontAwesomeIcons.telegram,
                    color: AppColors.telegram,
                  ),
                  SocialShareButton(
                    label: 'Instagram',
                    icon: FontAwesomeIcons.instagram,
                    gradient: AppColors.instagram,
                  ),
                  SocialShareButton(
                    label: 'More',
                    icon: Icons.more_horiz,
                    color: AppColors.primaryGreen,
                  ),
                ],
              ),
              const SizedBox(height: 24.0),

            
              const EarningsSummaryCard(),
              const SizedBox(height: 24.0),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Referrals',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textTitle, 
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const RecentReferralTile(
                name: 'Sarah Johnson',
                date: 'Joined 2 days ago',
                amount: '+\$15.00',
                status: 'Completed',
                imageUrl: 'assets/images/sarah.png', 
              ),
              const RecentReferralTile(
                name: 'Mike Chen',
                date: 'Joined 1 week ago',
                amount: '+\$15.00',
                status: 'Pending',
                imageUrl: 'assets/images/mike.png', 
              ),
              const RecentReferralTile(
                name: 'Emily Davis',
                date: 'Joined 2 weeks ago',
                amount: '+\$15.00',
                status: 'Completed',
                imageUrl: 'assets/images/emily.png',
              ),
              const SizedBox(height: 24.0),


              const Text(
                'How It Works',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTitle, 
                ),
              ),
              const SizedBox(height: 16.0),
              const HowItWorksStep(
                number: '1',
                title: 'Share your code',
                description: 'Send your referral code to friends and family',
              ),
              const HowItWorksStep(
                number: '2',
                title: 'They sign up',
                description: 'Your friends join using your referral code',
              ),
              const HowItWorksStep(
                number: '3',
                title: 'You both earn',
                description: 'Get \$15 for each successful referral',
              ),
              const SizedBox(height: 32.0),

             
              CustomButton(
                text: 'Invite More Friends',
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}