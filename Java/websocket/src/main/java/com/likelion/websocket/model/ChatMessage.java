package com.likelion.websocket.model;

import lombok.Data;

import java.awt.TrayIcon.MessageType;

@Data
public class ChatMessage {
    private MessageType type;
    private String content;
    private String sender;

    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE
    }
}
