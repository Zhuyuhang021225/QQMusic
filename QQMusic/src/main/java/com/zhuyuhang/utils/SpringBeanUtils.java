package com.zhuyuhang.utils;

import com.zhuyuhang.config.SpringConfig;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 * @author Zhuyuhang
 */
public class SpringBeanUtils {
    private static AnnotationConfigApplicationContext annotationConfigApplicationContext;

    static  {
        annotationConfigApplicationContext = new AnnotationConfigApplicationContext(SpringConfig.class);
    }

    public static Object getSpringBean(Class<?> clazz){
        return annotationConfigApplicationContext.getBean(clazz);
    }
}
