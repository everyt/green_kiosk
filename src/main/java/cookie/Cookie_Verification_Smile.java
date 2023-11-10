package cookie;

import user.Member_Mgr;

public class Cookie_Verification_Smile implements Cookie_Verification {
	@Override
	public boolean verificationByTypeWithNo(String str, String type, String no) {
		Member_Mgr member_Mgr = new Member_Mgr();
		boolean flag = false;
		
		if (type.equals("phoneNumber")) {
			int no2 = member_Mgr.get_user_with_phone(str).getMem_no();
			if (no2 > 0 && Integer.parseInt(no) == no2) {
				flag = true;
			}
		} else if (type.equals("userID")) {
			flag = member_Mgr.checkId(str);
		}
		
		return flag;
	}
}
