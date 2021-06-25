package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.JsonUtils;
import com.service.MessageService;

import User.Users;
import User.echarts;
import User.type;
import User.userInfo;
import User.usermess;
import User.xsdate;
import javafx.scene.control.Alert;
import net.sf.json.JSONArray;





@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * 方法选择
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String method = req.getParameter("method");

		if ("login".equals(method)) {
			try {
				login(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("addinformation".equals(method)) {
			addinformation(req,resp);
		}
		//通过修改状态为3
		else if ("xsby".equals(method)) {
			xsby(req, resp);
		}//不通过状态为4
		else if ("xsnotby".equals(method)) {
			xsnotby(req, resp);
		}else if ("bmby".equals(method)) {
			try {
				bmby(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//不通过状态为4
		else if ("bmnotby".equals(method)) {
			try {
				bmnotby(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if ("find".equals(method)) {
			try {
				find(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("back".equals(method)) {
			try {
				back(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("register".equals(method)) {
			
				try {
					register(req, resp);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}else if ("repassword".equals(method)) {
			repassword(req,resp);
		}
		else if ("find2".equals(method)) {
			try {
				find2(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if ("back1".equals(method)) {
			try {
				back1(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("searchbm".equals(method)) {
			try {
				searchbm(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("finduserinfo".equals(method)) {
			finduserinfo(req,resp);
		}
		else if ("updateuserinfo".equals(method)) {
			updateuserinfo(req,resp);
		}
		else if ("updateuserpremission".equals(method)) {
			updateuserpremission(req,resp);
		}else if ("fenleisearch".equals(method)) {
			try {
				fenleisearch(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("adminfindflinfo".equals(method)) {
			try {
				adminfindflinfo(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("layuifind".equals(method)) {
			try {
				layuifind(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("layuisearch".equals(method)) {
			try {
				layuisearch(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("xsdata".equals(method)) {//级联获取第二层数据
			try {
				xsdata(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("deleteuser".equals(method)) {
			deleteuser(req,resp);
		}else if ("deletemessinfo".equals(method)) {
			deletemessinfo(req,resp);
		}else if ("echarts".equals(method)) {
			try {
				echarts(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("updatemessinfo".equals(method)) {
			try {
				updatemessinfo(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("selectpremission".equals(method)) {
			try {
				selectpremission(req,resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}


	// 登录
	private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
		req.setCharacterEncoding("utf-8");
		// 获取数据
		String id = req.getParameter("Username");
		String admin = req.getParameter("Password");
		String shenfen = req.getParameter("shenfen");
		String sql = null;
		sql = "select * from user where (username='" + id + "' and password='" + admin + "' and employee='"+shenfen+"')";
		if ("inperson".equals(shenfen)) {
			
			if (MessageService.login(sql)>0) {
				usermess list =MessageService.searchmess(sql);
				String factoryname=list.getFactoryname();
				String postal1=list.getPostal();
				String username=list.getUsername();
				String premission=list.getPremission();
				String info="sucess";
				req.setAttribute("info", info);
				//req.setAttribute("factoryname", factoryname);
				
				//req.setAttribute("postal1", postal1);
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("factoryname", factoryname);
				session.setAttribute("postal1", postal1);
				session.setAttribute("premission", premission);
				req.getRequestDispatcher("index.jsp").forward(req, resp);
				resp.setContentType("text/html; charset=UTF-8"); //转码
			    
			   
			}else {
				resp.sendRedirect("error403.html");
			}
		}else if("inforplace".equals(shenfen)){
			if (MessageService.login(sql)>0) {
				req.setAttribute("shenfen", shenfen);
				req.getRequestDispatcher("index1.jsp").forward(req, resp);
			}else {
				resp.sendRedirect("error403.html");
			}
		}else if("business".equals(shenfen)){
			if (MessageService.login(sql)>0) {
				String sql1= "select * from information where status = '1'";
				List<userInfo> lst=MessageService.getmessage(sql1);
				req.setAttribute("meslist", lst); 
				
				
				req.getRequestDispatcher("index2.jsp").forward(req, resp);
			}else {
				resp.sendRedirect("error403.html");
			}
		
		}else if("admin".equals(shenfen)){
			if (MessageService.login(sql)>0) {
				//req.setAttribute("shenfen", shenfen);
				String tip="登陆成功";
				
				req.setAttribute("tip",tip);
				
				req.getRequestDispatcher("control.jsp").forward(req, resp);
			}else {
				resp.sendRedirect("error403.html");
			}
		
		}
	}
	
	// 添加项目信息
		private void addinformation(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			req.setCharacterEncoding("utf-8");
			// 获取数
			String telphone=req.getParameter("telphone");
			String keyword1=req.getParameter("keyword1");
			String keyword2=req.getParameter("keyword2");
			String keyword3=req.getParameter("keyword3");
			String keyword4=req.getParameter("keyword4");
			String keyword5=req.getParameter("keyword5");
			StringBuffer buf1=new StringBuffer();
			if (keyword1!="") {
				buf1.append(keyword1+"、");
			}
			if (keyword2!="") {
				buf1.append(keyword2+"、");
			}
			if (keyword3!="") {
				buf1.append(keyword3+"、");
			}
			if (keyword4!="") {
				buf1.append(keyword4+"、");
			}
			if (keyword5!="") {
				buf1.append(keyword5+"、");
			}
			String keyword=buf1.toString();
			String companyname = req.getParameter("companyname");
			String comaddress = req.getParameter("comaddress");
			String comwebsite = req.getParameter("comwebsite");
			String belongarea =req.getParameter("belongarea");
			String email = req.getParameter("email");
			String lawperson = req.getParameter("lawperson");
			String postal = req.getParameter("postal");
			String contacts = req.getParameter("contacts");
			String phone = req.getParameter("phone");
			String fax = req.getParameter("fax");
			String insattr = req.getParameter("insattr");
			String belongcom = req.getParameter("belongcom");
			String totime=req.getParameter("totime");
			String summary = req.getParameter("summary");
			String techname = req.getParameter("techname");
			String techchat = req.getParameter("techchat");
			String discuss = req.getParameter("discuss");
			String subject;
			String domain="";
			String vocation;
			if (discuss.equals("基础研究")) {
				subject = req.getParameter("subject");	
				//System.out.println(subject);
				domain="";
				vocation="";
			}else {
				subject="";
				//获取checkbox的值，将其转换为字符串
				String [] domainarr=req.getParameterValues("domain");
				StringBuffer buf=new StringBuffer();	
				for (int i = 0; i < domainarr.length; i++) {
					 buf.append(domainarr[i]+"、");
					} 
				domain=buf.toString();
				 vocation = req.getParameter("vocation");
			}
			
			
			String togemodern = req.getParameter("togemodern");
			String togecom = req.getParameter("togecom");
			String money = req.getParameter("money");
			String  status="0";
			String factoryname=req.getParameter("factoryname");
			String username=req.getParameter("username");
			
			
			
			
			
			String sql = "insert into information(companyname,comaddress,comwebsite,email,lawperson,postal,contacts,phone,fax"
					+ ",insattr,belongcom,summary,techname,techchat,discuss,subject,domain,vocation,togemodern,togecom,status,money,belongarea,totime,telphone,keyword) "
					+ "values('" + companyname + "','" + comaddress+ "','" + comwebsite + "','" + email +"','" + lawperson +
					"','" + postal +"','" + contacts +"','" + phone +"','" + fax +"','" + insattr +"','" + belongcom +"','" + summary +"','" + techname +
					"','" + techchat +"','" + discuss +"','" + subject +"','" + domain +"','" + vocation +"','" + togemodern +"','" + togecom +"','" + status +"','" + money +"','" + belongarea +"','" + totime +"','" + telphone +"','" + keyword +"')";
			// 添加后消息显示
			String sql1 = "select * from information where (companyname='" + factoryname +"')";
			userInfo list =MessageService.searchinfo(sql1);
//			//一个机构职能提交一次，判断是否已经提交过
//			if (MessageService.login(sql1)>0) {
//				String info="已经提交过一次，不能再次提交";
//				
//				
//				String postal1=list.getPostal();
////				req.setAttribute("postal1", postal1);
////				req.setAttribute("factoryname", factoryname);
////				req.setAttribute("username", username);
//				
//				
//				HttpSession session = req.getSession();
//				session.setAttribute("username", username);
//				session.setAttribute("factoryname", factoryname);
//				session.setAttribute("postal1", postal1);
//				req.setAttribute("info", info);
//				req.getRequestDispatcher("index.jsp").forward(req, resp);
//			}else {
				if (MessageService.add(sql) > 0) {
					
					String info="sucess";
					req.setAttribute("info", info);
//					req.setAttribute("postal1", postal);
//					req.setAttribute("factoryname", factoryname);
//					req.setAttribute("username", username);
					HttpSession session = req.getSession();
					session.setAttribute("username", username);
					session.setAttribute("factoryname", factoryname);
					session.setAttribute("postal1", postal);
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				} else {
					String info="fail";
					req.setAttribute("info", info);
					req.setAttribute("factoryname", factoryname);
					req.setAttribute("username", username);
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				
					
				}
//			}
			
		}
		
		
		// 注册公司账户
		private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
			req.setCharacterEncoding("utf-8");
			// 获取数据

			String name = req.getParameter("username");		
			String password = req.getParameter("password");
			String employee = req.getParameter("shenfen");
			String factoryname = req.getParameter("factoryname");
			String postal=req.getParameter("postal");
			String premission="0";
			if (employee.equals("inperson")) {
				String sql = "insert into user(username,password,employee,factoryname,postal,premission) values('" + name + "','" + password
						+ "','" + employee + "','" + factoryname +"','" + postal +"','" + premission + "')";
				String sql1 = "select * from user where (username='" + name +"')";
				String sql2="select * from user where (factoryname='" + factoryname +"')";
				if (MessageService.login(sql1)>0) {
					String tip="账户名已存在，注册失败";
					req.setAttribute("tip", tip);
					req.getRequestDispatcher("register.jsp").forward(req, resp);
					
				}else {
					if (MessageService.login(sql2)>0) {
						String tip="已存在该机构，注册失败";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("register.jsp").forward(req, resp);
					}else {
						// 添加后消息显示
						if (MessageService.add(sql) > 0) {
							String tip="注册成功";
							req.setAttribute("tip", tip);
							req.getRequestDispatcher("login.jsp").forward(req, resp);
						} else {
							String tip="注册失败";
							req.setAttribute("tip", tip);
							req.getRequestDispatcher("register.jsp").forward(req, resp);
						} 
					}
				}
			}else {
				String tip="已存在，注册失败";
				req.setAttribute("tip", tip);
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			}
		
			
		}

		//查询具体业务处具体信息
		private void find(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			String shenfen=req.getParameter("shenfen1");
			
			String sql = "select * from information where id = '" + id + "'";
			userInfo mess= MessageService.searchinfo(sql);
				req.setAttribute("shenfen", shenfen);
				req.setAttribute("mess",mess);
				req.getRequestDispatcher("findInfo.jsp").forward(req, resp);
			
		}
		//分类查找相关部门的报文
				private void searchbm(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					String office = req.getParameter("office");
					
					String sql1= "select * from information where office = '" + office + "'";
					List<userInfo> lst=MessageService.getmessage(sql1);
					req.setAttribute("meslist", lst); 
					req.getRequestDispatcher("index2.jsp").forward(req, resp);
					
				}
		//形式审核查看具体信息
		private void find2(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			
			
			String sql = "select * from information where id = '" + id + "'";
			userInfo mess= MessageService.searchinfo(sql);
				
				req.setAttribute("mess",mess);
				req.getRequestDispatcher("AllInformation.jsp").forward(req, resp);
			
		}
		//管理员查看分类检索具体信息
				private void adminfindflinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					String id = req.getParameter("id");
					  //去掉传过来数据的但单引号
			           String regexp = "\'";
			           id = id.replaceAll(regexp, "");
					//System.out.println(id);
					
					String sql = "select * from information where id = '" + id + "'";
					userInfo mess= MessageService.searchinfo(sql);
						
						req.setAttribute("mess",mess);
						req.getRequestDispatcher("adminfindflinfo.jsp").forward(req, resp);
					
				}
		//普通用户未修改密码返回上一页
		private void back(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
			req.setCharacterEncoding("utf-8");
			
			String username=req.getParameter("username");
			String sql = "select * from user where (username='" + username + "')";
			usermess list =MessageService.searchmess(sql);
			String factoryname=list.getFactoryname();
			String postal1=list.getPostal();
			
			req.setAttribute("factoryname", factoryname);
			
			req.setAttribute("postal1", postal1);
			HttpSession session = req.getSession();
			session.setAttribute("username", username);
					
			
			
			
			req.getRequestDispatcher("index.jsp").forward(req, resp);
					
				}
		//计财处，业务处查看完信息返回上一页
//				private void back2(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
//					req.setCharacterEncoding("utf-8");
//					
//					String shenfen=req.getParameter("shenfen1");
//					
//					req.setAttribute("shenfen", shenfen);
//					
//					
//					
//					
//					req.getRequestDispatcher("index1.jsp").forward(req, resp);
//							
//						}
				//各业务出查看完信息不修改时返回上一页
				private void back1(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					String sql1= "select * from information where status = '1'";
					List<userInfo> lst=MessageService.getmessage(sql1);
					req.setAttribute("meslist", lst); 
					
					
					req.getRequestDispatcher("index2.jsp").forward(req, resp);
					
					
					
					
					
					
					req.getRequestDispatcher("index2.jsp").forward(req, resp);
							
						}

//		
		//形式审核员通过修改状态为1
		private void xsby(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			req.setCharacterEncoding("utf-8");
			
			
			String id = req.getParameter("id");
			String xsadvice=req.getParameter("xsadvice");
			String office=req.getParameter("office");
			String shenhe="形式审核通过";
			String status="1";
			//修改状态为3；
			String sql = "update information set status='" + status + "',xsadvice='" + xsadvice + "',xsshenhe='" + shenhe +"',office='" + office+ "' where id='" + id
					+ "'";
			
			if (MessageService.update(sql)) {
				String tip="形式审核通过";
				req.setAttribute("tip", tip);
				
				
				req.getRequestDispatcher("index1.jsp").forward(req, resp);
					
				}else {
					
					req.getRequestDispatcher("index1.jsp").forward(req, resp);
				}

		}
		//部门审核员通过修改状态为3
				private void bmby(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					
					
					String id = req.getParameter("id");
					String bmadvice=req.getParameter("bmadvice");
					String shenhe="部门审核通过";
					String status="3";
					//修改状态为3；
					String sql = "update information set status='" + status + "',bmadvice='" + bmadvice + "',bmshenhe='" + shenhe + "' where id='" + id
							+ "'";
					
					if (MessageService.update(sql)) {
						String tip="部门审核通过";
						req.setAttribute("tip", tip);
						String sql1= "select * from information where status = '1'";
						List<userInfo> lst=MessageService.getmessage(sql1);
						req.setAttribute("meslist", lst);
						
						req.getRequestDispatcher("index2.jsp").forward(req, resp);
							
						}else {
							
							req.getRequestDispatcher("index2.jsp").forward(req, resp);
						}
				}
		//形式审核不通过修改状态为2
		private void xsnotby(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			String xsadvice=req.getParameter("xsadvice");
			String shenhe="形式审核未通过";
			String status="2";
			//修改状态为3；
			String sql = "update information set status='" + status + "',xsadvice='" + xsadvice + "',xsshenhe='" + shenhe + "' where id='" + id
					+ "'";
			
			if (MessageService.update(sql)) {
				String tip="形式审核未通过";
				req.setAttribute("tip", tip);
				
				
				req.getRequestDispatcher("index1.jsp").forward(req, resp);
					
				}else {
					
					req.getRequestDispatcher("index1.jsp").forward(req, resp);
				}

		}
		//部门审核不通过修改状态为4
		private void bmnotby(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			String bmadvice=req.getParameter("bmadvice");
			String shenhe="部门审核未通过";
			String status="2";
			//修改状态为3；
			String sql = "update information set status='" + status + "',bmadvice='" + bmadvice + "',bmshenhe='" + shenhe + "' where id='" + id
					+ "'";
			
			if (MessageService.update(sql)) {
				String tip="部门审核未通过";
				req.setAttribute("tip", tip);
				String sql1= "select * from information where status = '1'";
				List<userInfo> lst=MessageService.getmessage(sql1);
				req.setAttribute("meslist", lst);
				
				req.getRequestDispatcher("index2.jsp").forward(req, resp);
					
				}else {
					
					req.getRequestDispatcher("index2.jsp").forward(req, resp);
				}

		}
		
		//修改密码
		private void repassword(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
			req.setCharacterEncoding("utf-8");
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			 

			String sql = "update user set password='" + password + "' where username='" + username+ "'";
			if (MessageService.update(sql)) {
				resp.sendRedirect("login.jsp");			}
			else {
				
				resp.sendRedirect("redictpass.jsp");
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
			}

		}
		
		
		//管理员查看用户具体信息
				private void finduserinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
					req.setCharacterEncoding("utf-8");
					String username = req.getParameter("username");
				
					

					String sql = "select  * from user where username='"+username+"'";
					usermess mess=MessageService.searchmess(sql);
					req.setAttribute("mess", mess);
					req.getRequestDispatcher("updateuserinfo.jsp").forward(req, resp);

				}
				//管理员修改用户具体信息
				private void updateuserinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
					req.setCharacterEncoding("utf-8");
					String username = req.getParameter("username");
					String password=req.getParameter("password");
					String postal=req.getParameter("postal");
				
					

					String sql = "update user set postal='"+postal+"',password='"+password+"'  where username='"+username+"'";
					if (MessageService.update(sql)) {
						String tip="信息修改成功";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("control.jsp").forward(req, resp);

					}else {
						String tip="信息修改失败";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("control.jsp").forward(req, resp);
					}
					
				}
				//管理员修改用户具体权限
				private void updateuserpremission(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
					req.setCharacterEncoding("utf-8");
					//获取checkbox的值，将其转换为字符串
					String employee=req.getParameter("employee");
					String [] premissionarr=req.getParameterValues("premission");
					StringBuffer buf=new StringBuffer();	
					for (int i = 0; i < premissionarr.length; i++) {
						 buf.append(premissionarr[i]);
						} 
					String premission=buf.toString();
				
					
					
				
					

					String sql = "update user set premission='"+premission+"' where employee='"+employee+"'";
					if (MessageService.update(sql)) {
						String tip="信息修改成功";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("control.jsp").forward(req, resp);

					}else {
						String tip="信息修改失败";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("control.jsp").forward(req, resp);
					}
					
				}
				//分类检索查询信息
				private void fenleisearch(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException ,SQLException{
					req.setCharacterEncoding("utf-8");
					resp.setContentType("text/html;charset=utf-8");
					//即是点击事件，获取点击跳转的页数，以及每页需要展示的数据 数目，第一次加载默认为page=1&&limit=10
					   int page =Integer.parseInt(req.getParameter("page"));
			           int limit =Integer.parseInt(req.getParameter("limit"));
			           	String whatinfo=req.getParameter("whatinfo");
			           	String whatinfomessage=req.getParameter("whatinfomessage");
			           	String sql="select *  from information where "+whatinfo+" like '"+whatinfomessage+"' ";
			           //封装的要传回给前台的数据类
			           Users r=new Users();
			           //向前端传回状态码 0为正常状态码
			           r.setCode(0);
			           r.setMsg("获得数据成功");
			           
			           //获得满足条件的总数据量
			           	String sql1="select count(*)  as num from information where "+whatinfo+" like '"+whatinfomessage+"' ";
			           //	System.out.println(sql1);
			           int num=MessageService.getlayuiinfonum(sql1);
			           
			           //所有满足数据数目，并不是单单一页展示的数目
			           r.setCount(num);
			           //传递的数据集
			           
			           r.setData(MessageService.getlayuiinfo(page, limit,sql));
			           //加载处理  可有可无，并不影响
			           delay();
			           //向前端传递数据并显示
			           //System.out.println(JsonUtils.toJson(r));
			           resp.getWriter().print(JsonUtils.toJson(r));
			          
					
				}
				
				
				private void layuisearch(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					resp.setContentType("text/html;charset=utf-8");
					
					
					//即是点击事件，获取点击跳转的页数，以及每页需要展示的数据 数目，第一次加载默认为page=1&&limit=10
					   int page =Integer.parseInt(req.getParameter("page"));
			           int limit =Integer.parseInt(req.getParameter("limit"));
			           //获取传过来的json
			           String json=req.getParameter("json");
			           //将json字符串转换为json对象
			          JSONArray jsonArray=JSONArray.fromObject(json);
			          //转换为实体类的list集合
			          List<type> list=(List<type>) jsonArray.toCollection(jsonArray, type.class);
			          //获取一共有多少个查询限制条件
			          int  limitcount=list.size();
			         
			          //书写sql语句
			          String sql="select * from information where id>0";
			          //查询一共有多少条数据
			          String sql1="select count(*) as num from information where id>0";
			          for (int i = 0; i < limitcount; i++) {
			        	  
			        	  //查询语句拼接的时候要注意前三个，and/or  数据库列属性     like/=   在sql语句中是字符串  是不用带引号的
			        	  //例如 select * from information   where id>0 and companyname like '凌云'
			        	  if (list.get(i).getFour().equals("like")) {
			        		  //模糊查询(要注意like要与数据库属性用空格分开啊)
			        		  sql+="  "+list.get(i).getOne()+"  "+list.get(i).getTwo()+"  "+list.get(i).getFour()+"   '%"+list.get(i).getThree()+"%' ";
			        		  sql1+="  "+list.get(i).getOne()+"  "+list.get(i).getTwo()+"  "+list.get(i).getFour()+"   '%"+list.get(i).getThree()+"%' ";
						}else {
							//精确查询
							sql+="  "+list.get(i).getOne()+"  "+list.get(i).getTwo()+list.get(i).getFour()+"   '"+list.get(i).getThree()+"' ";
							sql1+="  "+list.get(i).getOne()+"  "+list.get(i).getTwo()+list.get(i).getFour()+"   '"+list.get(i).getThree()+"' ";
						}
						
					}
			          
						
			          

			           //封装的要传回给前台的数据类
			           Users r=new Users();
			           //向前端传回状态码 0为正常状态码
			           r.setCode(0);
			           r.setMsg("获得数据成功");
			           //所有的数据数目，并不是单单一页展示的数目
			           int num=MessageService.getlayuiinfonum(sql1);
			           r.setCount(num);
			           //传递的数据集
			           r.setData(MessageService.getlayuiinfo(page, limit,sql));
			           //加载处理  可有可无，并不影响
			           delay();
			           //向前端传递数据并显示
			           resp.getWriter().print(JsonUtils.toJson(r));
			           
				
				}
				//初始化加载所有数据
				private void layuifind(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					
					resp.setContentType("text/html;charset=utf-8");
					
					
					//即是点击事件，获取点击跳转的页数，以及每页需要展示的数据 数目，第一次加载默认为page=1&&limit=10
					   int page =Integer.parseInt(req.getParameter("page"));
			           int limit =Integer.parseInt(req.getParameter("limit"));
			           //封装的要传回给前台的数据类
			           Users r=new Users();
			           //向前端传回状态码 0为正常状态码
			           r.setCode(0);
			           r.setMsg("获得数据成功");
			           String sqlString="select * from information";
			           //获得满足条件的总数据量
			           String sql="select count(*) as num from information";
			           int num=MessageService.getlayuiinfonum(sql);
			           
			           //所有满足数据数目，并不是单单一页展示的数目
			           r.setCount(num);
			           //传递的数据集
			           
			           r.setData(MessageService.getlayuiinfo(page, limit,sqlString));
			           //加载处理  可有可无，并不影响
			           delay();
			           //向前端传递数据并显示
			           resp.getWriter().print(JsonUtils.toJson(r));
			           //System.out.println(JsonUtils.toJson(r));
				
				}
				
				   public void delay(){
				        try {
				            Thread.sleep(2000);
				        } catch (InterruptedException e) {
				            e.printStackTrace();
				        }
				    }
				   
				   
				 //查询级联二层数据具体信息
					private void xsdata(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
						req.setCharacterEncoding("utf-8");
						resp.setContentType("text/html;charset=utf-8");
						
						String xtypeid=req.getParameter("xtypeid");
						
						String sql="select * from xsdate where xtypeid='"+xtypeid+"'";
						List<xsdate> meslist=MessageService.getxsdate(sql);
						String list=JsonUtils.toJson(meslist);
						
						//向前台响应ajax数据
						PrintWriter pw=resp.getWriter();
						
						pw.println(list);
						pw.flush();
						pw.close();
						
						


						
					}
				
				
				
				
				
				
				
//		//删除用户信息
		private void deleteuser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
					req.setCharacterEncoding("utf-8");
					String name = req.getParameter("username");
					
					String sql = "delete  from user where username= '" + name + "'";
					if (MessageService.delete(sql)>0) {
						String tip="删除成功";
						req.setAttribute("tip", tip);
						req.getRequestDispatcher("control.jsp").forward(req, resp);
						}else {
							String tip="删除失败";
							req.setAttribute("tip", tip);
							req.getRequestDispatcher("control.jsp").forward(req, resp);
						}

				}
		//删除征文信息
				private void  deletemessinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
							req.setCharacterEncoding("utf-8");
							resp.setContentType("text/html;charset=utf-8");
							String id = req.getParameter("id");
							
							String tip;
							//System.out.println(id);
							String sql = "delete  from information where id= '" + id + "'";
							if (MessageService.delete(sql)>0) {
								 tip="删除成功";
								
								}else {
									 tip="删除失败";
									
									
								}
							resp.getWriter().println(JsonUtils.toJson(tip));

						}
				
				
				//测试图表
				private void echarts(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					resp.setContentType("text/html;charset=utf-8");
					
					String information=req.getParameter("information");
					
					
					
					String  sql="select "+information+" as leibie,count(*) as num from information group by "+information+" ";
					
					List<echarts>  echartslist= MessageService.getechartsdata(sql);
					//list转json
					JSONArray Js = JSONArray.fromObject(echartslist);
					
					resp.getWriter().print(Js);
					
					
				}
				
				//测试图表
				private void updatemessinfo(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					resp.setContentType("text/html;charset=utf-8");
					
					String id=req.getParameter("id");
					String comaddress=req.getParameter("comaddress");
					String comwebsite=req.getParameter("comwebsite");
					String lawperson=req.getParameter("lawperson");
					String contacts=req.getParameter("contacts");
					String telphone=req.getParameter("telphone");
					String belongcom=req.getParameter("belongcom");
					String email=req.getParameter("email");
					String postal=req.getParameter("postal");
					String phone=req.getParameter("phone");
					String fax=req.getParameter("fax");
					String summary=req.getParameter("summary");
					String techname=req.getParameter("techname");
					String totime=req.getParameter("totime");
					String techchat=req.getParameter("techchat");
					String keyword=req.getParameter("keyword");
					String money=req.getParameter("money");
					String togecom=req.getParameter("togecom");
					
					
					String sql = "update information set comaddress='"+comaddress+"',comwebsite='"+comwebsite+"' ,lawperson='"+lawperson+"' "
							+ ",contacts='"+contacts+"',telphone='"+telphone+"',belongcom='"+belongcom+"',email='"+email+"'"
									+ ",postal='"+postal+"',phone='"+phone+"',fax='"+fax+"',summary='"+summary+"',techname='"+techname+"',totime='"+totime+"'  "
											+ " ,techchat='"+techchat+"',keyword='"+keyword+"',money='"+money+"',togecom='"+togecom+"'  where id='"+id+"'";
					
				if (MessageService.update(sql)) {
					String tip="编辑成功";
					req.setAttribute("tip", tip);
					req.getRequestDispatcher("fenlei.jsp").forward(req, resp);
				}else {
					String tip="编辑失败";
					req.setAttribute("tip", tip);
					req.getRequestDispatcher("fenlei.jsp").forward(req, resp);
				}


					
				}
				
				private void selectpremission(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
					req.setCharacterEncoding("utf-8");
					resp.setContentType("text/html;charset=utf-8");
					
					String information=req.getParameter("information");
					
					
					
					String  sql="select premission from user where employee = '"+information+"' group by premission";
					System.out.println(sql);
					String pre = MessageService.getuserpremission(sql);
					resp.getWriter().print(pre);
					
					
				}

	

}
