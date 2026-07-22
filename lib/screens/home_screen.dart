import 'package:flutter/material.dart';
import '../services/api_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiClient _apiClient = ApiClient();
  String _status = 'Loading...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHealthStatus();
  }

  Future<void> _fetchHealthStatus() async {
    setState(() {
      _isLoading = true;
      _status = 'Loading...';
    });
    try {
      final result = await _apiClient.checkHealth();
      setState(() {
        _status = 'Status: ${result['status']}';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backend Health Check'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading) const CircularProgressIndicator(),
            if (!_isLoading)
              Text(
                _status,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchHealthStatus,
              child: const Text('Refresh'),
            ),
            const SizedBox(height: 20),
            Text(
              'Backend URL: ${ApiClient.baseUrl}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
