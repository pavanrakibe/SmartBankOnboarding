package com.smartbank.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    private static final Logger logger =
            LoggerFactory.getLogger(LoggingAspect.class);


    // =====================================================
    // ALL SERVICE METHODS
    // =====================================================

    @Pointcut("execution(* com.smartbank.service..*(..))")
    public void serviceMethods() {
    }


    // =====================================================
    // LOGGING
    // =====================================================

    @Around("serviceMethods()")
    public Object aroundLog(
            ProceedingJoinPoint joinPoint) throws Throwable {

        String className =
                joinPoint.getTarget().getClass().getSimpleName();

        String methodName =
                joinPoint.getSignature().getName();

        long startTime =
                System.currentTimeMillis();


        // ================= START =================

        logger.info(
                "STARTED : {}.{}()",
                className,
                methodName
        );


        try {

            // Execute actual service method

            Object result =
                    joinPoint.proceed();


            // ================= SUCCESS =================

            long endTime =
                    System.currentTimeMillis();

            logger.info(
                    "COMPLETED : {}.{}() | Time Taken : {} ms",
                    className,
                    methodName,
                    endTime - startTime
            );


            return result;


        } catch (Exception e) {


            // ================= ERROR =================

            long endTime =
                    System.currentTimeMillis();


            logger.error(
                    "FAILED : {}.{}() | Time Taken : {} ms | Error : {}",
                    className,
                    methodName,
                    endTime - startTime,
                    e.getMessage(),
                    e
            );


            // Important:
            // Send exception back to service/controller

            throw e;
        }
    }
}