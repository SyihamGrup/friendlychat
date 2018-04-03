import 'package:flutter/material.dart';

import '../entity/message_entity.dart';
import '../constant/app_images.dart';



class ChatMessageComponent extends StatelessWidget {

  ChatMessageComponent({
    this.messageEntity,
    this.animation
  });

  final MessageEntity messageEntity;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              backgroundImage: messageEntity.senderPhotoUrl != null
                  ? new NetworkImage(messageEntity.senderPhotoUrl)
                  : AppImages.placeholderAvatar,
            ),
          ),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  messageEntity.senderName ?? 'User',
                  style: Theme.of(context).textTheme.subhead,
                ),
                messageEntity.imageUrl == null
                    ? _buildTextContent(context)
                    : _buildImageContent(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Text(messageEntity.text),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Image.network(
        messageEntity.imageUrl,
        width: 250.0,
      ),
    );
  }

}
