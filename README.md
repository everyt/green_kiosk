# green_kiosk
11/07 ~ 12/01

키오스크 구현 프로젝트의 백업 포크입니다.
전 키오스크의 결제 페이지와 그 로직, 엔드포인트를 구현하였습니다.

### [JSP 바로가기](./src/main/webapp/kiosk/purchase/)

### [TS 바로가기](./src/main/webapp/assets/js/kiosk/purchase/)

### [CSS 바로가기](./src/main/webapp/assets/css/)

### [Youtube 작동영상 바로가기](https://youtu.be/T-1H-DT56p8?si=LoOtSK0wUAK24l2k&t=514)

<img width="40%" src="https://github.com/everyt/react-electron/assets/80094147/d9b2dc31-cc50-4802-b8b2-b10dc5759683"/><br />
가장 기억에 남는 경험이라고 한다면, 이전에 테트리스를 구현했던 경험을 살려, 바코드의 구조를 파악한 뒤 바코드를 구현할 수 있었던 게 기억에 남습니다. <br />

<br />프로젝트 기간이 짧고, 여러명이 계속해서 테이블의 자료형을 바꾸는 둥 혼잡함을 불러일으켰기 때문에 마지막 날 수많은 버그를 수정해야 했습니다 <br />(전부 자료형 문제였습니다... 이를 방지하기 위해 타입스크립트를 적용하기까지 했으나, 애당초 테이블 정의서에서 정의한 자료형을 따르지 않고 외래키의 참조키를 제멋대로 바꾸는 둥의 행위가 반복되었기 때문에 정말 골치가 아팠습니다.).<br /><br />

영수증에서도 받은 금액에 할인된 금액이 적용되지 않는 버그가 있는데, 이는 단순한 연산을 집어넣지 못했기 때문입니다. 하지만 이 간단한 실수로 인해 실제 프로덕션 단계에서 불러올 여파를 생각하면 이러한 실수는 큰 책임이 필요하다고 생각하고, 앞으로 더 주의하려고 합니다.

