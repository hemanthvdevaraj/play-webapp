package com.play.web.filters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author Insignia
 * 
 */

public class PlayWebFilter implements HandlerInterceptor {

  private static final Logger logger = Logger.getLogger(PlayWebFilter.class);

  private static String SERVLET_CONTEXT;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {

    SERVLET_CONTEXT = request.getContextPath();

    String uri = request.getScheme() + "://" + request.getServerName()
        + ("http".equals(request.getScheme()) && request.getServerPort() == 80
            || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? ""
                : ":" + request.getServerPort())
        + request.getRequestURI()
        + (request.getQueryString() != null ? "?" + request.getQueryString() : "");

    logger.debug("Requested URI = " + uri);

    boolean goAhead = true;
    // if not static resources - TODO get static resource url configured in spring mvc:resource tag
    if (request.getRequestURI().indexOf("/resources/") == -1) {
      if (isNewSession(request)) {
        goAhead = false;
        response.sendRedirect(SERVLET_CONTEXT + "/loginpage");
      }
    }
    return goAhead;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    // TODO Auto-generated method stub

  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    // TODO Auto-generated method stub

  }

  private boolean isNewSession(HttpServletRequest request) {
    boolean result = true;
    HttpSession session = request.getSession();
    if (request.getRequestURI().equals(SERVLET_CONTEXT + "/")
        || request.getRequestURI().equals(SERVLET_CONTEXT + "/loginpage")
        || request.getRequestURI().equals(SERVLET_CONTEXT + "/userlogin")) {
      result = false;
    } else if (session != null && session.getAttribute("userObj") != null) {
      result = false;
    }
    return result;
  }
}
