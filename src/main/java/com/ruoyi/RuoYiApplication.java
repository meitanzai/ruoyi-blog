package com.ruoyi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;

import javax.annotation.PostConstruct;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.TimeZone;

/**
 * 启动程序
 * 设置用户登录密码：superAdmin是用户登录名，admin是密码，adcd是盐
 * String s = new Md5Hash("admin" + "admin123" + "adcd").toHex();
 *
 * @author ruoyi
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class RuoYiApplication {
    public static void main(String[] args) throws UnknownHostException {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
        ConfigurableApplicationContext context = SpringApplication.run(RuoYiApplication.class, args);
        String serverPort = context.getEnvironment().getProperty("server.port");

        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              \n" +
                "                                    \n" +
                "ruoyi started at http://localhost:"+serverPort  + "\n"+
                "                 http://"+InetAddress.getLocalHost().getHostAddress()+":"+serverPort);
    }

    /**
     * 设置时区
     */
    @PostConstruct
    void setDefaultTimezone() {
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Shanghai"));
    }
}
