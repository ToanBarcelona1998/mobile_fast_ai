import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:reown_connect/reown_connect.dart';
import 'package:web3dart/crypto.dart';

final class ReownConnectImpl implements ReownConnect {
  late ReownAppKit _appKit;
  late ReownAppKitModal _appKitModal;

  @override
  Future<void> init(
    String projectId, {
    required BuildContext context,
    required String appName,
    required String description,
    required String url,
    required String icon,
  }) async {
    _appKit = await ReownAppKit.createInstance(
      projectId: projectId,
      metadata: PairingMetadata(
        name: appName,
        description: description,
        url: url,
        icons: [
          icon,
        ],
      ),
    );

    _appKitModal = ReownAppKitModal(
      // ignore: use_build_context_synchronously
      context: context,
      appKit: _appKit,
    );

    await _appKitModal.init();
  }

  List<String> getConnectedAccounts() {
    return _appKitModal.session?.getAccounts() ?? [];
  }

  Future<void> send({
    required String account,
  }) async {

    final transaction = {
      'to': '',
      'value': '0x0', // No ETH sent
      'data': '0x',
      'gas': '0x5208', // Adjust gas limit (e.g., 21000)
      'gasPrice': '0x3B9ACA00', // Adjust gas price (e.g., 1 Gwei)
      'nonce': '0x0', // Replace with the actual nonce
    };

    final encodedTransaction = jsonEncode(transaction);

    final encodedMessage = bytesToHex(utf8.encode(encodedTransaction));

    final String  signature = await _appKit.request(
      topic: _appKitModal.session!.topic!,
      chainId: _appKitModal.selectedChain!.chainId,
      request: SessionRequestParams(
        method: 'personal_sign',
        params: [
          encodedMessage,
          _appKitModal.session!.email,
        ],
      ),
    );
    
  }
}
