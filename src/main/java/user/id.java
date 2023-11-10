package user;


public String findld(String name, String email) {

	String id=null;
	try {
String sql= "select member_id" + " from member_info" + " where name= ? and" + " email=?";
PreparedStatement pstmt= conn.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, email);

	ResultSet rs = pstmt.executeQuery();
Suring sql2-"select company_id"+"from company_info"+"lwhere name=?and"t "email=?";
PreparedStatement pstmt2 =conn.prepareStatement(sql2);
pstmt2.setString(1, name);
pstmt2.setString(2, email);
ResultSet rs2= pstmt2.executeQuery();
if(rs.next()
id=rs.getString("member_info.member_id");
if(rs2.next()
id=rs2.getString("company_info.company_id"),
catch (SQLExceptione)f
e.printStackTrace();
return id;

}
