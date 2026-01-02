import 'package:flutter/material.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({super.key});

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF808000), // Olive
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Buy'),
            Tab(text: 'Sell'),
            Tab(text: 'Exchange'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBuyTab(),
          _buildSellTab(),
          _buildExchangeTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF808000),
        icon: const Icon(Icons.add_a_photo, color: Colors.white),
        label: const Text('Post Item', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildBuyTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildMarketItem(
          title: 'Used Textbook - Calculus',
          price: '\$25.00',
          condition: 'Good',
          type: 'Buy',
        );
      },
    );
  }

  Widget _buildSellTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.storefront, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          const Text(
            'You haven\'t listed any items yet.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF87CEEB),
              foregroundColor: Colors.white,
            ),
            child: const Text('Start Selling'),
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildMarketItem(
          title: 'Gaming Headset for Mechanical Keyboard',
          price: 'Exchange',
          condition: 'Like New',
          type: 'Exchange',
        );
      },
    );
  }

  Widget _buildMarketItem({
    required String title,
    required String price,
    required String condition,
    required String type,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.grey),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Condition: $condition',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      color: type == 'Exchange' ? const Color(0xFF87CEEB) : const Color(0xFF808000),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
