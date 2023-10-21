package com.ruoyi.framework.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.StringUtils;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;

/**
 * websocket 消息处理
 *
 * @author 一粒麦子
 */
@Component
@ServerEndpoint(value = "/blog/websocket/message/{userId}", configurator = HttpSessionConfig.class)
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
     * 非活动连接保持时间 (毫秒)
     * 60*1000   1分钟
     * 60*1000*30   30分钟
     */
    private static final long sessionTimeout = 60 * 1000 * 5;

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

        // 设置消息大小最大值10M
        session.setMaxBinaryMessageBufferSize(20 * 1024 * 1024);
        session.setMaxTextMessageBufferSize(20 * 1024 * 1024);
        session.setMaxIdleTimeout(sessionTimeout);

        int userSize = USERS.size();
        LOGGER.info("\n{} 建立连接  当前人数 - {}", session, userSize);

        // 推送在线人数
        sendMsgAll("webOnlineUserNum:" + userSize, session, userId, true);

    }

    /**
     * 服务器接收到客户端消息时调用的方法
     * message 接收 JSON格式
     * 来自用户ID，发送给用户的ID，发送的消息，发送的类型
     * {"fromUserID":"","toUserId":"","msg":"","msgType":""}
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        LOGGER.info(message);
        // 发送人(防止串改)
        String fromUserID = userId;
        try {
            sendMsg(message, session, fromUserID);
        } catch (Exception e) {
            USERS.get(fromUserID).session.getAsyncRemote().sendText("系统消息：消息格式错误，拒绝发送 =》" + message);
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
        // 推送在线人数
        sendMsgAll("webOnlineUserNum:" + USERS.size(), session, userId, true);
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
     * 发送消息
     *
     * @param message    消息体
     * @param session    session
     * @param fromUserID 发送者用户ID
     * @throws Exception
     */
    private void sendMsg(String message, Session session, String fromUserID) throws Exception {

        // 发送心跳
        if (Objects.equals("ping", message)) {
            LOGGER.info("心跳检测:{},消息内容:{}", userId, message);
            USERS.get(fromUserID).session.getAsyncRemote().sendText("pong");
            return;
        }

        if (USERS.size() == 1 && USERS.containsKey(userId)) {
            USERS.get(userId).session.getBasicRemote().sendText("{\"fromUserID\":\"\",\"toUserId\":\"\",\"msg\":\"" + "当前会话仅您一人" + "\",\"msgType\":\"3\",\"my\":\"false\",\"prompt\":true}");
        }

        JSONObject msgJson = JSON.parseObject(message);
        String toUserId = msgJson.getString("toUserId");
        String msg = msgJson.getString("msg");
        String msgType = msgJson.getString("msgType");

        // 从cookie中获取 nickName
        String token = new String(Base64.decodeBase64(userId));
        String[] tokenArr = token.split(",");
        msgJson.put("nickName", tokenArr[0]);

        if (Objects.equals("3", msgType)) { // 发送给所有在线的人
            sendMsgAll(msgJson.toJSONString(), session, fromUserID, false);
            return;
        }

        // 一对一发送
        if (StringUtils.isNotEmpty(toUserId) && USERS.containsKey(toUserId)) {
            // 发送数据
            USERS.get(toUserId).session.getAsyncRemote().sendText(msg);
            LOGGER.info("消息发送成功:{},消息内容:{}", userId, msg);
        } else {
            LOGGER.info("当前用户未在线 {}", toUserId);
        }
    }

    /**
     * 发送消息给所有人 不包括自己
     *
     * @param message    发送内容
     * @param session
     * @param fromUserID
     * @param oneself    是否发送给自己，true发送，false不发送
     */
    private static void sendMsgAll(String message, Session session, String fromUserID, boolean oneself) {
        // 发送消息
        USERS.entrySet().stream().forEach((entry) -> {
            if (oneself) {
                USERS.get(entry.getKey()).session.getAsyncRemote().sendText(message);
            } else {
                if (!Objects.equals(fromUserID, entry.getKey()))
                    USERS.get(entry.getKey()).session.getAsyncRemote().sendText(message);
            }

        });
    }

    /**
     * 一对多发送
     *
     * @param persons
     * @param message
     */
    public static void sendToUserList(List<String> persons, String message) {

        persons.forEach(userId -> {
            if (StringUtils.isNotBlank(userId) && USERS.containsKey(userId)) {
                USERS.get(userId).session.getAsyncRemote().sendText(message);
            } else {
                LOGGER.error("用户" + userId + ",不在线！");
            }
        });
    }

}
