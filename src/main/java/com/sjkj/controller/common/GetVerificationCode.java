package com.sjkj.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjkj.utils.vcode.Captcha;
import com.sjkj.utils.vcode.GifCaptcha;
import com.sjkj.utils.vcode.SpecCaptcha;

/**
 * 获取验证码
 * @author YJQ
 *
 */
@Controller
@RequestMapping("/common")
public class GetVerificationCode {
	public static Logger _log = Logger.getLogger(GetVerificationCode.class);
    /**
     * 获取验证码（Gif版本）
     * @param response
     */
    @RequestMapping(value="getGifCode",method=RequestMethod.GET)
    public void getGifCode(HttpServletResponse response,HttpServletRequest request){
    	try {
    		response.setHeader("Pragma", "No-cache");  
            response.setHeader("Cache-Control", "no-cache");  
            response.setDateHeader("Expires", 0);  
            response.setContentType("image/gif");  
            /**
             * gif格式动画验证码
             * 宽，高，位数。
             */
            Captcha captcha = new GifCaptcha(146,33,4);
            //输出
            captcha.out(response.getOutputStream());
            HttpSession session = request.getSession(true);  
            //存入Session
            session.setAttribute("_code",captcha.text().toLowerCase());  
            System.out.println(captcha.text().toLowerCase());
    	} catch (Exception e) {
    		_log.error(getClass()+"获取验证码异常：%s"+e.getMessage());
    	}
    }
    /**
     * 获取验证码（jpg版本）
     * @param response
     */
    @RequestMapping(value="getJPGCode",method=RequestMethod.GET)
    public void getJPGCode(HttpServletResponse response,HttpServletRequest request){
    	try {
    		response.setHeader("Pragma", "No-cache");  
    		response.setHeader("Cache-Control", "no-cache");  
    		response.setDateHeader("Expires", 0);  
    		response.setContentType("image/jpg");  
    		/**
    		 * jgp格式验证码
    		 * 宽，高，位数。
    		 */
    		Captcha captcha = new SpecCaptcha(146,33,4);
    		//输出
    		captcha.out(response.getOutputStream());
    		HttpSession session = request.getSession(true);  
    		//存入Session
    		session.setAttribute("_code",captcha.text().toLowerCase());
    		 System.out.println(captcha.text().toLowerCase());
    	} catch (Exception e) {
    		_log.error(getClass()+"获取验证码异常：%s"+e.getMessage());
    	}
    }
}
