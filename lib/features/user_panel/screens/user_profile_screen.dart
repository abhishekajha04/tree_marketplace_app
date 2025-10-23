import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_details_form.dart';
import '../widgets/profile_bank_details.dart';
import '../widgets/profile_kyc_documents.dart';
import '../widgets/profile_recent_purchases.dart';
import '../widgets/profile_payout_requests.dart';
import '../widgets/profile_sidebar.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(242, 255, 255, 255), 
        child: Row(
          children: [
            ProfileSidebar(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CustomHeaderBar(),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(71, 245, 245, 245), 
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: ListView(
                          children: [
                            // Profile Header and Details Form side by side
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ProfileHeader(),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  flex: 2,
                                  child: ProfileDetailsForm(),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            // Bank Details
                            ProfileBankDetails(),
                            SizedBox(height: 24),
                            // KYC Documents
                            ProfileKycDocuments(),
                            SizedBox(height: 24),
                            // Recent Purchases and Payout Requests
                            Row(
                              children: [
                                Expanded(child: ProfileRecentPurchases()),
                                SizedBox(width: 16),
                                Expanded(child: ProfilePayoutRequests()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomHeaderBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Keep header bar white for contrast
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Profile",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  "Manage your account information and settings",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.notifications_none,
            color: Colors.grey[500],
            size: 29,
          ),
          SizedBox(width: 14),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 25, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}