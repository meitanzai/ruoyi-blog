package com.ruoyi.framework.websocket;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;


/**
 * websocket接口
 *
 * @author 一粒麦子
 */
@RestController()
@RequestMapping("websocket")
public class WebSocketController {

    @PostMapping("/pushMsgToUsers")
    public ResponseEntity<String> pushMsgToUsers(String message, String toUserIds) throws IOException {
        List<String> persons = Arrays.asList(toUserIds.split(","));
        WebSocketServer.sendToUserList(persons, message);
        return ResponseEntity.ok("服务器信息发送成功！发送目标用户id:" + toUserIds);
    }

}