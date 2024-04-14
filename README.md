<div align=center>
<img src="https://capsule-render.vercel.app/api?type=waving&color=3399FF&height=300&section=header&text=HearTrack&fontSize=90&fontColor=FFFFFF&animation=twinkling" />
</div>

# 💎 HearTrack - 부정맥 검출을 위한 CNN 기반 ECG 데이터 분석 헬스케어 웹서비스
<img width="600" src="https://github.com/yyujnn/Final_Project/assets/129912074/98095df1-a641-4adb-a770-a736973f2480">


<br><br>

## == Contents ==
1. 프로젝트 소개
2. 기간 및 기여도
3. 기술 스택
4. 개발 설계
5. 주요 기능


<br>


## 👀 **프로젝트 소개**
```

🏆 SMHRD 실전 프로젝트 최우수상

부정맥 검출을 위한 CNN 기반 ECG 데이터 분석 헬스케어 웹서비스

```
#### ❤️‍🔥 HearTrack?

- `"HearT" 심장` + `"Track" 추적하다` 의 합성어

- 입력받은 **ECG 데이터**와 일상에서의 **건강정보**를 기반으로 사용자들의 심장 건강을 추적하고 **지속적인 건강한 삶**을 돕는다.

  

#### ✨ ECG?

- 심전도 :  electrocardiogram, ECG

- 정해진 시간에 심장의 전기적 활동을 해석하는 것


#### 👨🏻‍💻 기업 주제

- (주)뷰노 VUNO: 의료 인공지능 기술 기업

- ECG 데이터를 통한 **부정맥 검출 AI 모델** 개발



<br>

## 🫡 **기간 및 기여도**

**기간** : 2023.07.03 ~ 2023.08.01 `4주`

**참여 인원** : `4명`

**기여도 : `40%`**

<br>

## ⚒️ Stacks

#### Front-End
<img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E">

#### Back-End
<img src="https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white"> <img src="https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white">

#### Deep Learning
<img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54">

#### Database
<img src="https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white">

<br>

## ⌨️ 개발 설계

### 서비스 흐름도
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/a704ccce-611e-429e-8635-53d5a6c85865">

### ERDiagram
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/4deb493b-cd14-4dac-a0c8-87d0b7832f6e">


<br>


## ⚓️ 데이터 모델링 

### 데이터 수집
- **Chapman-Shaoxing 12-lead ECG data** (약 10,000 set) : Kaggle의 대표적 ECG 데이터셋
- **LUDB 12-lead ECG data** (약 1,000 set) : 대표적인 ECG 오픈 데이터셋
 
<br>

### 데이터 전처리
#### 1) noise 제거
<img width="804" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/7280433a-46f4-49dd-9278-7f5052ee2b87">

#### 2) 데이터 표준화
-  ECG 신호를 리드별로 **standardization** 진행
-  전처리 한 ECG 데이터를 리드별로 나누어 **그래프 작성**

<br>

### CNN 기반 모델 설계 및 학습
- **`ResNet`** :
4개의 클래스(af, gsvt, sb, sr)로 부정맥 여부 판단
--> Multi Class classification로 예측

- **`U-Net`** : 
ECG 데이터 추출심전도를 Segmentation(표준화) 하여 
numerical feature(hr, pr, qrs, qt, qtc) 를 추출

<br>


## 💎 주요 기능

### 1) 메인 화면
- 사이트에서 **제공 되는 서비스 안내** 바로가기 버튼을 통해 건강 체크하기로 이동
- **6가지 카드** 중에서 원하는 서비스 선택 후 혈압 / ECG / 혈당 / 커뮤니티 / BMI / 가까운 병원 페이지로 이동
- 이용자 위치 기반 API를 토대로 **가장 가까운 병원과 약국의 위치**를 표시

<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/7bf2e35c-693b-445e-b22f-6c4c229f16af"> 
<br><br>
<img width="700" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/91e2e32d-6f1d-4433-998b-a4183ad63023">


### 2) ECG 검사
- `step1` : ECG 파일(pkl) 첨부
- `step2` : 검사 결과 확인 & 이미지 저장
- `step3` : 검사 기록 확인
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/6df4cbab-aa8b-4c0c-93ae-6876965d8edd">
<br><br>
<img width="700" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/4bb58a44-b6c7-4138-a5d0-743b554566d1">


### 3) 혈압, 혈당 검사
- 최고, 최저 혈압/혈당 입력 (평균 수치 안내)
- 검사 결과
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/f5d59140-0c95-4ec2-9afa-f80bdaef927e">


### 4) 건강 기록
- 건강 기록 카드
- 최근 ECG검사 기록
- 최근 혈당, 혈압 검사 기록
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/882c2090-f873-4018-8e63-a89a67feaa49">
<img width="502" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/43f0e09c-cdd7-4d99-a33b-7d407ab1deb1">


### 5) 커뮤니티
- 최근 검사 기록 공유
- 게시글, 댓글, 좋아요
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/ced30ed2-3bfc-4acf-8cc0-12a7e191dd03">


#### 6) 관리자 페이지
- 서비스 사용 현황
- 회원 관리
<img width="700" alt="image" src="https://github.com/ahgjatleo0/Final_Project/assets/129912074/8f2a72ec-2118-4ceb-af25-47c83010a143">

<br>

## 👨‍👩‍👧‍👦 팀원 소개 및 역할



