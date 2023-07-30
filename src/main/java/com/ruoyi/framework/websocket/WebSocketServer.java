package com.ruoyi.framework.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * websocket 消息处理
 *
 * @author 一粒麦子
 */
@Component
@ServerEndpoint(value = "/websocket/message/{userId}", configurator = HttpSessionConfig.class)
public class WebSocketServer {

    /**
     * WebSocketServer 日志控制器
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketServer.class);

    /**
     * 声明全局session,通过该对象可以给指定的用户发送消息
     */
    private Session session;

    private String userId;

    private HttpSession httpSession;

    /**
     * 用户集
     */
    private static Map<String, WebSocketServer> USERS = new ConcurrentHashMap<String, WebSocketServer>();

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, EndpointConfig endpointConfig, @PathParam("userId") String userId) throws Exception {

        // 赋值
        this.session = session;
        this.userId = userId;
        // 获取值并赋值
        HttpSession httpSession = (HttpSession) endpointConfig.getUserProperties().get(HttpSession.class.getName());
        this.httpSession = httpSession;

        // 添加用户
        USERS.put(userId, this);

        LOGGER.info("\n{} 建立连接  当前人数 - {}", session, USERS.size());

        // 发送消息
        session.getBasicRemote().sendText("RUOYI-BLOG 连接成功");

    }

    /**
     * 服务器接收到客户端消息时调用的方法
     * message 接收 JSON格式
     * 来自用户ID，发送给用户的ID，发送的消息，发送的类型
     * {"fromUserID":"","toUserId":"","msg":"","msgType":""}
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        // 发送人(防止串改)
        String fromUserID = userId;
        try {
            JSONObject msgJson = JSON.parseObject(message);
            String toUserId = msgJson.getString("toUserId");
            String msg = msgJson.getString("msg");

            if (StringUtils.isNotEmpty(toUserId) && USERS.containsKey(toUserId)) {
                // 发送数据
                USERS.get(toUserId).session.getBasicRemote().sendText(msg);
                LOGGER.info("消息发送成功:{},消息内容:{}", userId, msg);
            } else {
                LOGGER.info("当前用户未在线 {}", toUserId);
            }
        } catch (Exception e) {
            try {
                USERS.get(fromUserID).session.getBasicRemote().sendText("系统消息：消息格式错误，拒绝发送 =》" + message);
            } catch (Exception ex) {
                e.printStackTrace();
            }
            e.printStackTrace();
        }
    }

    /**
     * 连接关闭时处理
     */
    @OnClose
    public void onClose(Session session) {

        if (USERS.containsKey(userId)) {
            //从set中删除
            USERS.remove(userId);
        }
        LOGGER.info("用户退出: {} ,当前在线人数为:{}", userId, USERS.size());
    }

    /**
     * 抛出异常时处理
     */
    @OnError
    public void onError(Session session, Throwable throwable) throws Exception {
        throwable.printStackTrace();
        LOGGER.error("用户错误: {} ,原因:{}", userId, throwable.getMessage());
    }


    /**
     * 发送给多个人
     *
     * @param persons
     * @param message
     */
    public static void sendToUserList(List<String> persons, String message) {

        persons.forEach(userId -> {
            try {
                if (StringUtils.isNotBlank(userId) && USERS.containsKey(userId)) {
                    USERS.get(userId).session.getBasicRemote().sendText(message);
                } else {
                    LOGGER.error("用户" + userId + ",不在线！");
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

}
