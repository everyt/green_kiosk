package cookie;

public interface Cookie_Verification {
	default boolean verification(String str) {
        return false;
    }
    default boolean verificationByTypeWithNo(String str, String type, String no) {
        return false;
    }
}
