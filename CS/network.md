# 네트워크 내용 정리
## 네트워크 구성
- DMZ: Demilitarized zone, 외부에 공개하기 위한 네트워크
- SOHO: Small Office, Home Office
> SOHO와 대기업의 네트워크 구성은 다름. 지사가 있는 경우 VPN 필요.
## 프로토콜
- Protocol: 원활하게 통신하기 위한 통신 규약
- OSI 7 Layer: ISO(International Organization for Standardization) 에서 정한 통신 모델
## OSI 7 Layer
7. 응용 계층 (Application Layer)
6. 표현 계층 (Presentation Layer)
5. 세션 계층 (Session)
4. 전송 계층 (Transport)
3. 네트워크 계층 (Network)
2. 데이터 링크 계층 (Data link)
1. 물리 계층 (Physical)
> 하위 계층으로 내려가면서 캡슐화(데이터 전송에 필요한 헤더 추가)
> 상위 계층으로 올라가면서 역캡슐화 한다.
## 물리 계층
- 전송매체를 의미. ex) 0/1 정보를 담은 전파를 전기신호로 변환한다. (랜카드)
- 전송매체 - 유선/무선