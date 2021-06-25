package com.service;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.mysql.cj.protocol.Message;

import User.Alldata;
import User.echarts;
import User.userInfo;
import User.xsdate;

class MessageServiceTest {

	@Test
	//注册测试
	void testAdd() {
		System.out.println("Register Test Case:");
		String[][] a= {{"赵常恒","123456","inperson","factor1","054600","0"},{"zzm","zzm9251","inperson","factor2","054600","0"},{"zchzzm","waod3n","inpersion","factor3","054600","0"},{"infor","infor","inforplace","factor4","054600","0"}
		,{"admin","admin","admin","factor5","054600","0"},{"one","one","business","factor6","054600","0"},{"121112","1212","inpersion","factor7","054600","0"},{"error","error","someone","factor8","054600","0"},{"赵常恒","123456","inperson","factor1","054600","0"}
		};
		for(int i=0;i<a.length;i++) {
			String sql = "insert into user(username,password,employee,factoryname,postal,premission) values('" + a[i][0] + "','" + a[i][1]
					+ "','" + a[i][2] + "','" + a[i][3] +"','" + a[i][4] +"','" + a[i][5] + "')";
				System.out.println("username:"+a[i][0]+"     password:"+a[i][1]+"     vertify:"+a[i][2]+"     factor:"+a[i][3]+"     postal:"+a[0][4]+"     permession:"+a[0][5]+"     Return:"+MessageService.add(sql));
			}
		String sql="xxx";
		System.out.println("username:"+"none"+"     password:"+"none"+"     vertify:"+"none"+"     factor:"+"none"+"     postal:"+"none"+"     permession:"+"none"+"     Return:"+MessageService.add(sql));
		}
	@Test
	//登录测试
	void testLogin() {
		//
		String[][] a= {{"赵常恒","123456","inperson"},{"zzm","zzm9251","inperson"},{"zchzzm","waod3n","inpersion"},{"infor","infor","inforplace"}
		,{"admin","admin","admin"},{"one","one","business"},{"121112","1212","inpersion"},{"error","error","someone"}
		};
		System.out.println("Login Test Case:");
		for(int i=0;i<a.length;i++) {
				String sql="select * from user where (username='" + a[i][0] + "' and password='" +a[i][1]+ "' and employee='"+a[i][1]+"')";
				System.out.println("username:"+a[i][0]+"     password:"+a[i][1]+"     vertify:"+a[i][2]+"     Return:"+MessageService.login(sql));
			}
		String sql="xxx";
		System.out.println("username:"+"none"+"     password:"+"none"+"     vertify:"+"none"+"     Return:"+MessageService.login(sql));
		}
	@Test
	void testDelete() {
		System.out.println("Delete Test Case:");
		String[][] a= {{"赵常恒","123456","inperson","factor1","054600","0"},{"zzm","zzm9251","inperson","factor2","054600","0"},{"zchzzm","waod3n","inpersion","factor3","054600","0"},{"infor","infor","inforplace","factor4","054600","0"}
		,{"admin","admin","admin","factor5","054600","0"},{"one","one","business","factor6","054600","0"},{"121112","1212","inpersion","factor7","054600","0"},{"error","error","someone","factor8","054600","0"},{"赵常恒","123456","inperson","factor1","054600","0"}
		};
		for(int i=0;i<a.length;i++) {
			String sql = "delete from user where username='"+a[i][0]+"'and employee='"+a[i][2]+"'";
				System.out.println("username:"+a[i][0]+"     vertify:"+a[i][2]+"     Return:"+MessageService.delete(sql));
			}
		String sql="xxx";
		System.out.println("username:"+"none"+"     vertify:"+"none"+"     Return:"+MessageService.delete(sql));
		}
	@Test
	//业务测试
	void testGetalldate() throws SQLException {
		List<Alldata> lst = new ArrayList<Alldata>();
		String[][] sql= {{"select * from alldate"},{"select * from alldate where id='"+1+"'"},
				{"select * from alldate where id='"+2+"'"},{"select * from alldate where id='"+3+"'"}
				,{"selec A from alldate" }};
		System.out.println("YeWu Test Case");
		for(int i=0;i<sql.length;i++) {
			System.out.println("测试语句"+sql[i][0]+"   Return:"+MessageService.getalldate(sql[i][0]));
		}
		String sql1="xxx";
		System.out.println("测试语句"+sql1+"   Return:"+MessageService.getalldate(sql1));

	}
	//二层产业测试
	@Test
	void testGetxsdate() throws SQLException {
		List<xsdate> lst = new ArrayList<xsdate>();
		String[] xtypeid= {"1","2","3","4","5"};
		System.out.println("Factory Test Case");
		for(int i=0;i<xtypeid.length;i++) {
			String sql="select * from xsdate where xtypeid='"+Integer.parseInt(xtypeid[i])+"'";
			System.out.println("xtypeid"+xtypeid[i]+"   Return:"+MessageService.getalldate(sql));
			MessageService.getxsdate(sql);
		}
		String sql="xxx";
		System.out.println("xtypeid"+"none"+"   Return:"+MessageService.getalldate(sql));
	}
	//图表数据测试
	@Test
	void testGetechartsdata() throws SQLException {
		List<echarts> lst = new ArrayList<echarts>();
		System.out.println("Echarts Test Case");
		String[] information= {"comaddress","companyname","discuss","voation","test"};
		for(int i=0;i<information.length;i++) {
			String sql="select "+information[i]+" as leibie,count(*) as num from information group by "+information[i]+" ";
			System.out.println("类别:"+information[i]+"    Return:"+MessageService.getechartsdata(sql));
		}
			String sql="xxx";
			System.out.println("类别:"+"none"+"     Return:"+MessageService.getechartsdata(sql));
	}

	@Test
	//页面分类查询测试
	void testGetlayuiinfonum() throws SQLException {
		System.out.println("Layui Num Test Case");
		String[][] test= {{"companyname","天津科技大学"},{"comaddress","天津市河西区大沽南路1038号"},{"insattr","高等院校"},{"insattr","测试"}};
		for(int i=0;i<test.length;i++) {
			String sql="select count(*)  as num from information where "+test[i][0]+" like '"+test[i][1]+"' ";
			System.out.println("Key: "+test[i][0]+"     content:"+test[i][1]+"     Return:"+MessageService.getlayuiinfonum(sql));
		}
		String sql="xxx";
		System.out.println("Key: "+"none"+"     content:"+"none"+"     Return:"+MessageService.getlayuiinfonum(sql));
	}

	@Test
	void testGetuserpremission() throws SQLException {
		System.out.println("Permission Test Case");
		String[][] test= {{"infor","inforplace"},{"admin","admin"},{"one","business"},{"123456","inperson"},{"noexist","noexist"}};
		for(int i=0;i<test.length;i++) {
			String sql="select premission from user where username='"+test[i][0]+"'employee='"+test[i][1]+"'";
			System.out.println("username:"+test[i][0]+"     emplyee:"+test[i][1]+"     Return:"+MessageService.getuserpremission(sql));
		}
		String sql="xxx";
		System.out.println("username:"+"none"+"     emplyee:"+"none"+"     Return:"+MessageService.getuserpremission(sql));
	}

	@Test
	void testGetlayuiinfo() throws NumberFormatException, SQLException {
		System.out.println("LayuiInfo Test Case");
		String[][] test= {{"1","companyname","天津科技大学"},{"1","comaddress","天津市河西区大沽南路1038号"},{"1","insattr","高等院校"},{"1","insattr","测试"},
				{"2","companyname","天津科技大学"},{"3","comaddress","天津市河西区大沽南路1038号"},{"4","insattr","高等院校"}};
		for(int i=0;i<test.length;i++) {
			String sql="select *  from information where "+test[i][1]+" like '"+test[i][2]+"' ";
			System.out.println("page:"+test[i][0]+"     Key: "+test[i][1]+"     content:"+test[i][2]+"     Return:"+MessageService.getlayuiinfo(Integer.parseInt(test[i][0]), 20, sql));
		}
		String sql="xxx";
		System.out.println("page:"+"none"+"     Key: "+"none"+"     content:"+"none"+"     Return:"+MessageService.getlayuiinfo(1, 20, sql));
	}

	@Test
	void testGetmessage() throws SQLException {
		System.out.println("DemandInfo Test Case");
		List<userInfo> lst = new ArrayList<userInfo>();
		String[][] sql= {{"select * from information"},{"select * from information where id='"+1+"'"},
				{"select * from information where id='"+99+"'"},{"select * from information where id='"+134+"'"}
				,{"select A from information" }};
		for(int i=0;i<sql.length;i++) {
			System.out.println("测试语句"+sql[i][0]+"   Return:"+MessageService.getmessage(sql[i][0]));
		}
		String sql1="xxx";
		System.out.println("测试语句"+sql1+"   Return:"+MessageService.getmessage(sql1));
	}

	@Test
	//征文信息状态修改
	void testUpdate() {
		String[] status=new String[] {
				"0","1","3"};
		//id=531 文件ID 正确测试 最终status=3
		int id=531;
		//普通转形式审核  True
		String sql1 = "update information set status='" + status[1] + "' where id='" + id
				+ "'";
		//形式转部门 True
		String sql2 = "update information set status='" + status[2] + "' where id='" + id
				+ "'";

		if (MessageService.update(sql1)) {
			System.out.println("形式审核通过");
		if (MessageService.update(sql2)) {
			System.out.println("部门审核通过");
			}
	}
	}

	@Test
	//信息查询
	void testSearchinfo() {
		System.out.println("DemandSearchInfo Test Case");
		String[][] sql= {{"select * from information"},{"select * from information where id='"+1+"'"},
				{"select * from information where id='"+99+"'"},{"select * from information where id='"+134+"'"}
				,{"selec A from alldate" }};
		for(int i=0;i<sql.length;i++) {
			System.out.println("测试语句"+sql[i][0]+"   Return:"+MessageService.searchinfo(sql[i][0]));
		}
		String sql1="xxx";
		System.out.println("测试语句"+sql1+"   Return:"+MessageService.searchinfo(sql1));
	}

	@Test
	//用户查询
	void testSearchmess() {
		System.out.println("UserSearchInfo Test Case");
		String[][] sql= {{"select * from user"},{"select * from user where id='"+1+"'"},
				{"select * from user where id='"+99+"'"},{"select * from user where id='"+5+"'"}
				,{"selec A from alldate" }};
		for(int i=0;i<sql.length;i++) {
			System.out.println("测试语句"+sql[i][0]+"   Return:"+MessageService.searchmess(sql[i][0]));
		}
		String sql1="xxx";
		System.out.println("测试语句"+sql1+"   Return:"+MessageService.searchmess(sql1));
	}

	@Test
	//地域查询
	void testGetarea() throws SQLException {
		System.out.println("Area Test Case");
		int [] j= {1};
		String[][] sql= {{"select * from area"},{"select areaname from area where code='"+130100+"'"},
				{"select * from area where id='"+10+"'"},{"selec A from alldate" },{"select * from area where id='"+j[0]+"'"}
				};
		for(int i=0;i<sql.length;i++) {
			System.out.println("测试语句"+sql[i][0]+"   Return:"+MessageService.getarea(sql[i][0]));
		}
		for(int i=0;i<j.length;i++) {
			System.out.println("测试语句"+sql[4][0]+"   Return:"+MessageService.getarea(sql[i][0]));
			j[0]++;
		}
		String sql1="xxx";
		System.out.println("测试语句"+sql1+"   Return:"+MessageService.getarea(sql1));
	}
}
