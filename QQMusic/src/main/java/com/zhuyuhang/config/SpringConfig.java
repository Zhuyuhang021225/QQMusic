package com.zhuyuhang.config;

import org.springframework.context.annotation.*;
import org.springframework.stereotype.Controller;

/**
 * @author Zhuyuhang
 */
@Configuration
@ComponentScan(value = "com.zhuyuhang")
@PropertySource("classpath:jdbc.properties")
@Import({JDBCConfig.class,MybatisConfig.class})
public class SpringConfig {
}
