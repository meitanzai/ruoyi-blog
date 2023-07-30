package com.ruoyi.framework.websocket;

import com.ruoyi.common.utils.ToolUtils;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

/**
 * httpSession
 *
 * @author 一粒麦子
 */
public class HttpSessionConfig extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {

        // 获取 httpSession
        HttpSession httpSession = (HttpSession) request.getHttpSession();

        // 将 httpSession 对象存储到配置对象中，在 onOpen 方法中获取即可
        if (ToolUtils.isNotEmpty(httpSession)) {
            sec.getUserProperties().put(HttpSession.class.getName(), httpSession);
        }
    }
}