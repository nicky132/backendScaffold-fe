package cn.stylefeng.guns;

import cn.stylefeng.roses.kernel.db.starter.SingleDataSourceAutoConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration;

/**
 * SpringBoot方式启动类
 *
 * @author fengshuonan
 * @since 2020/12/1 17:50
 */
@Slf4j
@SpringBootApplication(scanBasePackages = {"cn.stylefeng", "cn.stylefeng.guns.modular.test.service"},
        exclude = {FlywayAutoConfiguration.class, SingleDataSourceAutoConfiguration.class})
public class ProjectStartApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProjectStartApplication.class, args);
        log.info(ProjectStartApplication.class.getSimpleName() + " is success!");
    }

}

