package com.likelion.week81_82.aspect;


import com.likelion.week81_82.service.Impl.DepartmentServiceImpl;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;

@Configuration
@Aspect
public class serviceAspect {
    private final Logger logger = LoggerFactory.getLogger(DepartmentServiceImpl.class);

    @Before("execution(* com.likelion.week81_82.service.*.*(..))")
    public void before(JoinPoint joinPoint){
        logger.info("Before called " + joinPoint.toString());
    }

    @After("execution(* com.likelion.week81_82.service.*.*(..))")
    public void after(JoinPoint joinPoint){
        logger.info("After called " + joinPoint.toString());
    }

}
