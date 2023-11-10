package cookie;

public interface Cookie_Upload {
	default boolean upload(String str) {
        return false; // 주문 테이블 매니저 만들어지면 구현
    }
}
