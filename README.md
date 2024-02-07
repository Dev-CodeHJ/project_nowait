![홈화면](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/ffdbadb9-c085-4f40-a22c-0be0ca910a20)

# :blue_heart: Nowait PROJECT

<img alt="스크린샷 2024-02-04 오후 6 30 38" src="https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/41afd39f-2fce-45ea-8fdb-3a36069e982f">

> ### 식당 예약 및 포장 프로그램 사이트입니다.



# :blue_heart: 개발 기간
:point_right: 2023.11.24 - 2023.12.15 (3주)



#  :blue_heart: 개발 인원 및 파트
:point_right: Full-stack : 3명

|개발자                 |파트                |
|-----------------------|--------------------|
|김휘진                 |사장, 가게, 메뉴, 주문|
|손창무                 |리뷰, 댓글           |
|지연정                 |손님                 |



# :blue_heart: 기술 스텍
<img src="https://img.shields.io/badge/Java-3766AB?style=flat-square&logo=OpenJDK&logoColor=white"/> <img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/> 
<img src="https://img.shields.io/badge/Apache%20Maven-C71A36?style=flat-square&logo=Apache%20Maven&logoColor=white"/> <br>  <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/> <img src="https://img.shields.io/badge/HTML-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> 
<img src="https://img.shields.io/badge/CSS-1572B6?style=flat-square&logo=CSS3&logoColor=white"/> <br> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/>



# :blue_heart: 서비스 소개
:point_right: 식당에 가기 전에 미리 포장이나 방문 예약을 해놓을 수 있게 만든 프로그램입니다.



# :blue_heart: 협업 툴
<img src="https://img.shields.io/badge/WBS-00AC47?style=flat-square&logo=Wbs&logoColor=white"/> <br>
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white"/>



# :blue_heart: ERD
<img width="887" alt="image" src="https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/4e6e1a6f-c4f6-4d21-8b5b-e6c7cfdbed90">


# :blue_heart: 구현 기능

### :open_file_folder: 사장님(회원가입, 수정, 삭제)

![사장님_회원가입](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/45acb59b-64cb-4b4b-8571-6154b9946746)
#### :point_right: 회원가입 시 아이디 중복검사를 통해 아이디의 unique속성 유지
#

![사장님_메인화면](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/53562f7a-63e7-4d5c-8d09-acb47428b7a3)
#### :point_right: 사장님 로그인 성공 시 해당 사장님이 등록한 가게 리스트 화면

***

### :open_file_folder: 가게
![가게_신규등록](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/9790c1f3-ac89-4866-8d8b-d6b84ef7bb52)
#### :point_right: 가게 신규 등록 시 등록하려는 사업자 등록번호는 이미 존재해서는 안된다.
#

![가게_기존불러오기](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/d2162500-c20f-4521-af72-52d728f07b08)
#### :point_right: 이미 등록되어있는 사업자 등록번호와 비밀코드를 통해 등록되어있는 가게정보를 내 가게정보로 불러온다.
#

![가게불러오기후_메인](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/b8faa27e-b7bd-4367-876a-3859c8187794)
#### :point_right: 가게 등록 및 불러오기 완료 시 내 가게 목록에 가게가 늘어난 것을 확인할 수 있다.
#

![가게_정보](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/c884efe0-6716-486a-bee4-05dcd8f09ff9)
#### :point_right: 가게 클릭 시 가게 상세정보 및 가게 관리메뉴 이용 가능

*** 

### :open_file_folder: 메뉴

![메뉴_메뉴관리](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/37bdc9fc-cb15-456d-b2c0-4a66ad8f9c5b)
#### :point_right: 해당 가게의 모든 메뉴 목록화면
#### :point_right: 각 메뉴 별 수정, 삭제, 메뉴 상세정보, 카테고리 관리 등의 기능 구현
#

![메뉴_카테고리관리](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/9fd7508e-0f35-4a51-be32-f57cdbb8dca1)
#### :point_right: 카테고리 등록, 수정, 삭제가 가능한 화면
#

![메뉴_상세정보](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/5da9adc0-c2de-4764-bb9c-fb7a46ff22df)
#### :point_right: 해당 메뉴의 상세정보 화면
#### :point_right: 해당 메뉴에 대한 수정, 삭제 및 메뉴 옵션 등록, 수정, 삭제 기능 구현

***

### :open_file_folder: 주문

![주문_메인](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/3de0f935-d2b7-436a-9de3-bfe51f626c80)
#### :point_right: 손님 로그인 시 모든 가게 목록 출력
#

![주문_가게](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/cb2c1292-421f-4657-b42b-cfde858c6642)
#### :point_right: 주문을 원하는 가게 클릭 시 메뉴를 담을 수 있는 화면으로 이동
#### :point_right: 원하는 메뉴 장바구니 담기 클릭 시 수량, 메뉴옵션 선택 가능
#### :point_right: 품절메뉴는 선택 불가능
#

![주문_장바구니](https://github.com/Dev-CodeHJ/project_nowait/assets/103896076/91514ed2-d322-4e41-84d8-e939f456f8a7)
#### :point_right: 장바구니 화면 이동 시 장바구니에 있는 모든 메뉴 출력
#### :point_right: 장바구니에 담긴 메뉴 옵션, 수량 수정 가능
#### :point_right: 결제 전 결제 방식, 에약 방식 선택(홀 방문 선택 시 방문 인원 입력)

***
