package com.sjkj.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Component
@Aspect
public class LogAspect{
   // @Autowired
   // private AdminOperateLogService adminOperateLogService;
    private static Logger log = LoggerFactory.getLogger(LogAspect.class);

    /**
     * before
     *
     * @param jp
     * @param rl
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    @Before("within(com.visionet.project.app.web..*) && @annotation(rl)")
    public void before(JoinPoint jp, Log rl) throws IllegalArgumentException, IllegalAccessException {
        Object[] parames = jp.getArgs();// 获取目标方法体参数
        String className = jp.getTarget().getClass().toString();// 获取目标类名
        className = className.substring(className.indexOf("com"));
        String signature = jp.getSignature().toString(); // 获取目标方法签名
        String methodName = signature.substring(signature.lastIndexOf(".") + 1, signature.indexOf("("));
        String modelName = rl.model(); // 根据类名获取所属的模块
        String ziduan = rl.field();
        String params = null;
        params = (cast(parames, ziduan));
        String logs = rl.log();
        // 进入方法前日志打印
        // System.out.println("方法执行前执行.....");
        String userName = null;
        if(!StringUtils.equals(methodName, "uploadFile")){
        	//不拦截资料上传，解决火狐浏览器不兼容的问题
    		userName = getUserName();
        	if (Validator.isNull(userName)) {
        		throw new CustomRuntimeException("请重新登录");
        	}
        }
        log.info("用户名:" + userName + "||进行的操作是" + rl.name() + "||所属模块：" + modelName + "||进入"
                + signature + ",执行的是" + logs + "操作,参数" + params);
    }

    /**
     * success 标注该方法体为后置通知，当目标方法执行成功后执行该方法体
     *
     * @param jp
     * @param rl
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    @SuppressWarnings("unused")
    @AfterReturning("within(com.visionet.project.app.web..*) && @annotation(rl)")
    public void addLogSuccess(JoinPoint jp, Log rl) throws IllegalArgumentException, IllegalAccessException {
        Object[] parames = jp.getArgs();// 获取目标方法体参数 String[]
        String className = jp.getTarget().getClass().toString();// 获取目标类名,com.visionet.project.app.web.user.UserController
        className = className.substring(className.indexOf("com"));// com.visionet.project.app.web.user.UserController
        String signature = jp.getSignature().toString(); // 获取目标方法签名
        String methodName = signature.substring(signature.lastIndexOf(".") + 1, signature.indexOf("("));// 进入的方法名addNew()
        String modelName = rl.model(); // 根据类名获取所属的模块xx管理
        String ziduan = rl.field();// 用户帐号,user,user_account
        String params = null; // 要打印的内容
        params = (cast(parames, ziduan));
        String userName = getUserName();
        //adminOperateLogService.addAdminOperateLog(rl.name() + "[" + params + "]", super.getCurrentUserId(), modelName,1);
        log.info("用户名:" + userName + "||进行的操作是" + rl.name() + "||所属模块：" + modelName + "||进入" + signature + ",操作成功，参数是" + params);
    }

	/**
	 * @return
	 */
	private String getUserName() {
		Object principal = SecurityUtils.getSubject().getPrincipal();
    	String jsonString = JSONArray.toJSONString(principal);
		JSONObject parseObject = JSON.parseObject(jsonString);
		String userName = parseObject.get("userName").toString();
		return userName;
	}

    /**
     * @param parames
     * @param field
     * @return
     * @throws IllegalArgumentException
     * @throws IllegalAccessException
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private String cast(Object[] parames, String field) throws IllegalArgumentException, IllegalAccessException {
        StringBuffer buf = new StringBuffer();
        // 将参数转换成具体的对象
        Class<? extends Object> cc = parames[0].getClass();
        Object obj = parames[0];
        Field[] fields = cc.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
        }
        // 把 "用户帐号.user.user_name" 分割成数组
        String[] list = field.split(",");
        /// 如果参数类型是list<String>
        if (list[1].equals("List<String>")) {
            buf.append(list[0] + ":" + ((List) obj).get(0));
            return buf.toString();
        }
        if (list[1].equals("Map")) {
            buf.append(list[0] + ":" + ((Map<String, Object>) obj).get(list[2] + "") + "");
            return buf.toString();
        }
        if (list[1].equals("EXCEL")) { // 直接输出提示信息 ,无参数解析
            buf.append(list[0] + "");
            return buf.toString();
        }
        if (list[1].equals("Text")) { // 直接输出提示信息 ,无参数解析
            buf.append(list[0] + "");
            return buf.toString();
        }
        // 修改 ,增加操作
        // 输出每个字段和字段的属性
        for (Field f : fields) {
            String field1 = f.toString().substring(f.toString().lastIndexOf(".") + 1);// 该字段的名称
            if (list[2].equals(field1)) {// 只输出规定的字段
                buf.append(list[0] + ":" + f.get(obj));
            }
            // 打印属性和参数System.out.println("p1."+field+" --> "+f.get(obj));
        }
        return buf.toString();
    }

    public static void main(String[] args) {
        List<String> l = new ArrayList<>();
        l.add("222");
        System.out.println(l);

    }

    /**
     * Eexception 标注该方法体为异常通知，当目标方法出现异常时，执行该方法体
     *
     * @param jp
     * @param rl
     * @param ex
     * @throws IllegalAccessException
     * @throws IllegalArgumentException
     */
    @SuppressWarnings("unused")
    @AfterThrowing(pointcut = "within(com.visionet.project.app.web..*) && @annotation(rl)", throwing = "ex")
    public void addLog(JoinPoint jp, Log rl, Exception ex) throws IllegalArgumentException, IllegalAccessException {

        Object[] parames = jp.getArgs();// 获取目标方法体参数
        // String params = parseParames(parames); // 解析目标方法体的参数
        String className = jp.getTarget().getClass().toString();// 获取目标类名
        className = className.substring(className.indexOf("com"));
        String signature = jp.getSignature().toString(); // 获取目标方法签名
        String methodName = signature.substring(signature.lastIndexOf(".") + 1, signature.indexOf("("));
        String modelName = rl.model(); // 根据类名获取所属的模块
        String ziduan = rl.field();// 用户帐号,user,user_account
        String params = null;
        params = (cast(parames, ziduan));
        String userName = getUserName();
        //adminOperateLogService.addAdminOperateLog(rl.name() + "[" + params + "]", super.getCurrentUserId(), modelName,0);
        log.error("用户名:" + userName + "||进行的操作是" + rl.name() + "||所属模块：" + modelName + "||进入"
                + signature + ",操作失败，异常是" + ex.getMessage());
    }

    /**
     * 解析方法参数
     *
     * @param parames 方法参数
     * @return 解析后的方法参数
     */
    @SuppressWarnings("unused")
    private String parseParames(Object[] parames) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < parames.length; i++) {
            if (parames[i] instanceof Object[] || parames[i] instanceof Collection) {
                String jsonString = JSONArray.toJSONString(parames[i]);
                JSONArray json = JSONArray.parseArray(jsonString);
                if (i == parames.length - 1) {
                    sb.append(json.toString());
                } else {
                    sb.append(json.toString() + ",");
                }
            } else if (parames[i] instanceof String) {
                sb.append(parames[i]);
            } else {
            	String jsonString = JSON.toJSONString(parames[i]);
            	JSONObject json = JSON.parseObject(jsonString);
                //JSONObject json = JSONObject.fromObject(parames[i]);
                if (i == parames.length - 1) {
                    sb.append(json.toString());
                } else {
                    sb.append(json.toString() + ",");
                }
            }
        }
        String params = sb.toString();
        params = params.replaceAll("(\"\\w+\":\"\",)", "");
        params = params.replaceAll("(,\"\\w+\":\"\")", "");
        return params;
    }

}
