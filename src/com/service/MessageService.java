package com.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.security.Escape;

import com.connect.Connect;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.sun.crypto.provider.RSACipher;

import User.Alldata;
import User.Area;
import User.echarts;
import User.userInfo;
import User.usermess;
import User.xsdate;
import sun.security.util.Password;





//服务层
public class MessageService {
	public static int login(String sql) {
		Connection conn = Connect.getConn();
		Statement st = null;
		ResultSet rs = null;
		int row = 0;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				row = 1;
			} else {
				row = 0;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return row;

	}
	
	public static int add(String sql) {

		// 创建数据库链接
		Connection conn = Connect.getConn();
		Statement st = null;
		int row = 0;

		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
			row = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 关闭连接
			Connect.close(conn, st, null);
		}
		return row;

	}
	
	
	public static int delete(String sql) {

		// 创建数据库链接
		Connection conn = Connect.getConn();
		Statement st = null;
		int row = 0;

		try {
			st = conn.createStatement();
			st.executeUpdate(sql);
			row = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 关闭连接
			Connect.close(conn, st, null);
		}
		return row;

	}
	
	
	//级联获取第一层数据
		public static List<Alldata> getalldate(String sql) throws SQLException {
			// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
			List<Alldata> lst = new ArrayList<Alldata>();
			// 获取连接对象
			Connection conn = Connect.getConn();
			try {
				// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
				Statement st = conn.createStatement();
				// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
				ResultSet rs = st.executeQuery(sql);
				// 遍历结果集对象
				while (rs.next()) {
					Alldata mes = new Alldata();
					mes.setTypeid(rs.getString("typeid"));
					mes.setYewu(rs.getString("yewu"));
				
					
				
					lst.add(mes);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				// 资源使用完之后，如果没有关闭，则需要关闭
				if (conn != null) {
					conn.close();
				}
			}
			return lst;
		}
		
		
		//级联获取第二层数据
		public static List<xsdate> getxsdate(String sql) throws SQLException {
			// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
			List<xsdate> lst = new ArrayList<xsdate>();
			// 获取连接对象
			Connection conn = Connect.getConn();
			try {
				// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
				Statement st = conn.createStatement();
				// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
				ResultSet rs = st.executeQuery(sql);
				// 遍历结果集对象
				while (rs.next()) {
					xsdate mes = new xsdate();
					mes.setXtypeid(rs.getString("xtypeid"));
					mes.setXsyw(rs.getString("xsyw"));
				
					
				
					lst.add(mes);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				// 资源使用完之后，如果没有关闭，则需要关闭
				if (conn != null) {
					conn.close();
				}
			}
			return lst;
		}
		//echarts按分类获取数据和数量
		public static List<echarts> getechartsdata(String sql) throws SQLException {
			// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
			List<echarts> lst = new ArrayList<echarts>();
			// 获取连接对象
			Connection conn = Connect.getConn();
			try {
				// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
				Statement st = conn.createStatement();
				// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
				ResultSet rs = st.executeQuery(sql);
				// 遍历结果集对象
				while (rs.next()) {
					echarts mes = new echarts();
					mes.setLeibie(rs.getString("leibie"));
					mes.setNum(rs.getInt("num"));
					lst.add(mes);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				// 资源使用完之后，如果没有关闭，则需要关闭
				if (conn != null) {
					conn.close();
				}
			}
			return lst;
		}
	
	
	//获得数据量
		public static int  getlayuiinfonum(String sql) throws SQLException {
			int num=0;
			
			// 获取连接对象
			Connection conn = Connect.getConn();
			try {
				// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
				Statement st = conn.createStatement();
				// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
				ResultSet rs = st.executeQuery(sql);
				// 遍历结果集对象
				while (rs.next()) {
					num=rs.getInt("num");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				// 资源使用完之后，如果没有关闭，则需要关闭
				if (conn != null) {
					conn.close();
				}
			}
			
		        return num;
		
		}
	
		
		//获得用户权限
				public static String  getuserpremission(String sql) throws SQLException {
					String pre= "";
					
					// 获取连接对象
					Connection conn = Connect.getConn();
					try {
						// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
						Statement st = conn.createStatement();
						// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
						ResultSet rs = st.executeQuery(sql);
						// 遍历结果集对象
						while (rs.next()) {
							pre=rs.getString("premission");
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
						// 资源使用完之后，如果没有关闭，则需要关闭
						if (conn != null) {
							conn.close();
						}
					}
					
				        return pre;
				
				}
	
	
	
	//测试layui
	public static List<userInfo> getlayuiinfo(int page,int limit,String sql) throws SQLException {
		// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
		List<userInfo> lst = new ArrayList<userInfo>();
		// 获取连接对象
		Connection conn = Connect.getConn();
		try {
			// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
			Statement st = conn.createStatement();
			// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
			ResultSet rs = st.executeQuery(sql);
			// 遍历结果集对象
			while (rs.next()) {
				userInfo mes = new userInfo();
				mes.setCompanyname(rs.getString("companyname"));
				mes.setComaddress(rs.getString("comaddress"));
				mes.setComwebsite(rs.getString("comwebsite"));
				mes.setEmail(rs.getString("email"));
				mes.setLawperson(rs.getString("lawperson"));
				mes.setPostal(rs.getString("postal"));
				mes.setContacts(rs.getString("contacts"));
				mes.setPhone(rs.getString("phone"));
				mes.setFax(rs.getString("fax"));
				mes.setInsattr(rs.getString("insattr"));
				mes.setBelongcom(rs.getString("belongcom"));
				mes.setSummary(rs.getString("summary"));
				mes.setTechname(rs.getString("techname"));
				mes.setTechchat(rs.getString("techchat"));
				mes.setDiscuss(rs.getString("discuss"));
				mes.setSubject(rs.getString("subject"));
				mes.setDomain(rs.getString("domain"));
				mes.setVocation(rs.getString("vocation"));
				mes.setTogemodern(rs.getString("togemodern"));
				mes.setTogecom(rs.getString("togecom"));
				mes.setStatus(rs.getString("status"));
				mes.setMoney(rs.getString("money"));
				mes.setBelongarea(rs.getString("belongarea"));
				mes.setTelphone(rs.getString("telphone"));
				mes.setOffice(rs.getString("office"));
				mes.setKeyword(rs.getString("keyword"));
				mes.setTotime(rs.getString("totime"));
				mes.setXsshenhe(rs.getString("xsshenhe"));
				mes.setBmshenhe(rs.getString("bmshenhe"));
				mes.setId(rs.getInt("id"));
				lst.add(mes);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 资源使用完之后，如果没有关闭，则需要关闭
			if (conn != null) {
				conn.close();
			}
		}
		//从所有的数据对象lst找出需要展示的数据存在一个新的list中
		   List<userInfo> list = new ArrayList<>();
	        int start=(page-1)*limit;//判断当前也开始的数据位置
	        for (int i =start; i <start+limit&&i<lst.size(); i++) {
	            list.add(lst.get(i));
	        }
	        return list;
	
	}
	//查询证文信息
	public static List<userInfo> getmessage(String sql) throws SQLException {
		// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
		List<userInfo> lst = new ArrayList<userInfo>();
		// 获取连接对象
		Connection conn = Connect.getConn();
		try {
			// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
			Statement st = conn.createStatement();
			// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
			ResultSet rs = st.executeQuery(sql);
			// 遍历结果集对象
			while (rs.next()) {
				userInfo mes = new userInfo();
				mes.setCompanyname(rs.getString("companyname"));
				mes.setComaddress(rs.getString("comaddress"));
				mes.setComwebsite(rs.getString("comwebsite"));
				mes.setEmail(rs.getString("email"));
				mes.setLawperson(rs.getString("lawperson"));
				mes.setPostal(rs.getString("postal"));
				mes.setContacts(rs.getString("contacts"));
				mes.setPhone(rs.getString("phone"));
				mes.setFax(rs.getString("fax"));
				mes.setInsattr(rs.getString("insattr"));
				mes.setBelongcom(rs.getString("belongcom"));
				mes.setSummary(rs.getString("summary"));
				mes.setTechname(rs.getString("techname"));
				mes.setTechchat(rs.getString("techchat"));
				mes.setDiscuss(rs.getString("discuss"));
				mes.setSubject(rs.getString("subject"));
				mes.setDomain(rs.getString("domain"));
				mes.setVocation(rs.getString("vocation"));
				mes.setTogemodern(rs.getString("togemodern"));
				mes.setTogecom(rs.getString("togecom"));
				mes.setStatus(rs.getString("status"));
				mes.setMoney(rs.getString("money"));
				mes.setBelongarea(rs.getString("belongarea"));
				mes.setTotime(rs.getString("totime"));
				mes.setTelphone(rs.getString("telphone"));
				mes.setXsadvice(rs.getString("xsadvice"));
				mes.setBmadvice(rs.getString("bmadvice"));
				mes.setXsshenhe(rs.getString("xsshenhe"));
				mes.setBmshenhe(rs.getString("bmshenhe"));
				mes.setOffice(rs.getString("office"));
				mes.setId(rs.getInt("id"));
				lst.add(mes);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 资源使用完之后，如果没有关闭，则需要关闭
			if (conn != null) {
				conn.close();
			}
		}
		return lst;
	}
	public static boolean update(String sql) {

		Connection conn = Connect.getConn();
		Statement st = null;
		boolean f = false;
		int a = 0;

		try {
			st = conn.createStatement();
			a = st.executeUpdate(sql);

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			Connect.close(conn, st, null);
		}

		if (a > 0) {
			f = true;
		}
		return f;
	}
	
	public static userInfo searchinfo(String sql) {

		Connection conn = Connect.getConn();
		Statement st = null;
		ResultSet rs = null;
		userInfo mess = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {

				String companyname = rs.getString("companyname");
				String comaddress = rs.getString("comaddress");
				String comwebsite = rs.getString("comwebsite");
				String email = rs.getString("email");
				String lawperson = rs.getString("lawperson");
				String postal = rs.getString("postal");
				String contacts = rs.getString("contacts");
				String phone = rs.getString("phone");
				String fax = rs.getString("fax");
				String insattr = rs.getString("insattr");
				String belongcom = rs.getString("belongcom");
				String summary = rs.getString("summary");
				String techname = rs.getString("techname");
				String techchat = rs.getString("techchat");
				String discuss = rs.getString("discuss");
				String subject = rs.getString("subject");
				String domain = rs.getString("domain");
				String vocation = rs.getString("vocation");
				String togemodern = rs.getString("togemodern");
				String togecom = rs.getString("togecom");
				String status = rs.getString("status");
				String money = rs.getString("money");
				String belongarea = rs.getString("belongarea");
				String totime=rs.getString("totime");
				String telphone=rs.getString("telphone");
				String keyword=rs.getString("keyword");
				String xsadvice=rs.getString("xsadvice");
				String bmadvice=rs.getString("bmadvice");
				String xsshenhe=rs.getString("xsshenhe");
				String bmshenhe=rs.getString("bmshenhe");
				String office=rs.getString("office");
				int id=rs.getInt("id");
				
				//mess = new userInfo(username, password, shenfen, weizhi);
				mess=new userInfo(companyname, comaddress, comwebsite, email, lawperson, postal, contacts, phone, fax, insattr, belongcom, summary, techname, techchat, discuss, 
						subject, domain, vocation, togemodern, togecom, status, money,belongarea,totime,telphone,keyword,xsadvice,bmadvice,xsshenhe,office,bmshenhe,id);
						
						
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			Connect.close(conn, st, rs);
		}
		return mess;
	}
	//检索usermess对象
	public static usermess searchmess(String sql) {

		Connection conn = Connect.getConn();
		Statement st = null;
		ResultSet rs = null;
		usermess mess = null;
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {

				String username = rs.getString("username");
				String password = rs.getString("password");
				String employee = rs.getString("employee");
				String factoryname = rs.getString("factoryname");
				String postal=rs.getString("postal");
				String premission=rs.getString("premission");
				
				
				//mess = new userInfo(username, password, shenfen, weizhi);
				mess=new  usermess(username, password, employee, factoryname, postal,premission);
						
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			Connect.close(conn, st, rs);
		}
		return mess;
	}
	
	public static List<Area> getarea(String sql) throws SQLException {
		// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
		List<Area> lst = new ArrayList<Area>();
		// 获取连接对象
		Connection conn = Connect.getConn();
		try {
			// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
			Statement st = conn.createStatement();
			// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
			ResultSet rs = st.executeQuery(sql);
			// 遍历结果集对象
			while (rs.next()) {
				Area mes = new Area();
				mes.setCode(rs.getString("code"));
				mes.setAreaname(rs.getString("areaname"));
			
				lst.add(mes);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 资源使用完之后，如果没有关闭，则需要关闭
			if (conn != null) {
				conn.close();
			}
		}
		return lst;
	}
	
	//查询usermess的数据集
	public static List<usermess> getusermess(String sql) throws SQLException {
		// 查询语句的执行结果为一个表格，即多个学生对象的集合，所有可以创建数组列表对象来存储
		List<usermess> lst = new ArrayList<usermess>();
		// 获取连接对象
		Connection conn = Connect.getConn();
		try {
			// 连接对象conn调用createStatement()方法，创建一个执行SQL语句的对象st
			Statement st = conn.createStatement();
			// 执行SQL语句的对象st调用executeQuery()方法，执行查询语句，将查询到的结果返回到一个结果集中
			ResultSet rs = st.executeQuery(sql);
			// 遍历结果集对象
			while (rs.next()) {
				usermess mes = new usermess();
				mes.setUsername(rs.getString("username"));
				mes.setPassword(rs.getString("Password"));
				mes.setEmployee(rs.getString("employee"));
				mes.setFactoryname(rs.getString("factoryname"));
				mes.setPostal(rs.getString("postal"));
				mes.setPremission(rs.getString("premission"));
			
				lst.add(mes);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			// 资源使用完之后，如果没有关闭，则需要关闭
			if (conn != null) {
				conn.close();
			}
		}
		return lst;
	}
	



}