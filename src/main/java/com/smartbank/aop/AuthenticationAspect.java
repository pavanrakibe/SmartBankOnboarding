package com.smartbank.aop;

import jakarta.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class AuthenticationAspect {

    // =====================================================
    // ADMIN CONTROLLER
    // =====================================================

    @Pointcut("execution(* com.smartbank.controller.AdminController.*(..))")
    public void adminControllerMethods() {
    }


    // =====================================================
    // USER CONTROLLER
    // =====================================================

    @Pointcut("execution(* com.smartbank.controller.UserController.*(..))")
    public void userControllerMethods() {
    }


    // =====================================================
    // ADMIN AUTHENTICATION
    // =====================================================

    @Around("adminControllerMethods()")
    public Object checkAdminLogin(
            ProceedingJoinPoint joinPoint) throws Throwable {

        ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder
                        .getRequestAttributes();

        if (attributes == null) {
            return "redirect:/auth/login";
        }

        HttpSession session =
                attributes.getRequest().getSession(false);

        if (session == null) {
            return "redirect:/auth/login";
        }

        String adminemail =
                (String) session.getAttribute("adminemail");

        if (adminemail == null || adminemail.trim().isEmpty()) {
            return "redirect:/auth/login";
        }

        return joinPoint.proceed();
    }


    // =====================================================
    // USER AUTHENTICATION
    // =====================================================

    @Around("userControllerMethods()")
    public Object checkUserLogin(
            ProceedingJoinPoint joinPoint) throws Throwable {

        ServletRequestAttributes attributes =
                (ServletRequestAttributes) RequestContextHolder
                        .getRequestAttributes();

        // Request not available
        if (attributes == null) {
            return "redirect:/auth/login";
        }

        HttpSession session =
                attributes.getRequest().getSession(false);

        // Session does not exist
        if (session == null) {
            return "redirect:/auth/login";
        }

        String useremail =
                (String) session.getAttribute("useremail");

        // User is not logged in
        if (useremail == null || useremail.trim().isEmpty()) {
            return "redirect:/auth/login";
        }

        // User is logged in
        return joinPoint.proceed();
    }
}