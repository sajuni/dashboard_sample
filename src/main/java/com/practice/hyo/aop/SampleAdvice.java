//package com.practice.hyo.aop;
//
//import java.util.Arrays;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.springframework.stereotype.Component;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Component
//@Aspect
//public class SampleAdvice {
//
//	@Before("execution(* com.practice.hyo.service.MessageService*.*(..))")
//	public void startLog(JoinPoint jp) {
//		log.info("------------------------------");
//		log.info("------------------------------");
//		log.debug("------------------------------");
//		log.info(Arrays.toString(jp.getArgs()));
//	}
//	
//}
