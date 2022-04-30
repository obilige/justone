# 삼성/애플 유튜브 댓글 분석
- 목적 : 삼성전자, 애플에 관한 국내 고객 액티브 데이터(유튜브 댓글)로 마케팅 전략 세워보기
- 방법 : Selenium을 이용한 댓글 스크래핑 / MongoDB에 데이터 저장 / MongoDB에서 데이터 추출 / 토큰화 진행 및 EDA / RNN, LSTM로 자연어 분석/분류
- 기술 : Python / Selenium / BeautifulSoup4 / Pandas / Numpy / WordCrowd / MongoDB /

## 1. Data
- Selenium : 유튜브는 스크롤을 내리면 댓글이 추가적으로 페이지에 나오는 방식이라 동적 자동화 필요
- BeautifulSoup : Selenium으로 동작을 자동화시킨 후 HTML을 스크래핑
- re : 정규표현식으로 댓글들을 일목요연하게 볼 수 있게 정리
- Pandas : 스크래핑해 얻은 데이터를 데이터프레임으로 만들어 저장

## 2. MongoDB
- NoSQL : 관계형 DBMS보다 유연하게 데이터를 저장할 수 있음 {key:value} 형태
- 영상, 이미지 : NoSQL 형태인만큼 댓글이 달린 영상이나 관련 이미지도 저장할 수 있음
- {id:000, comment:11111, contents:youtube, product:image}로 만들어 mongodb에 저장할 예정

## 3.토큰화 & EDA
-  토큰화 : 분석, 분류할 수 있도록 문장에서 단어 혹은 조사 단위로 쪼개는 행위
    + 단어토큰화 : Time is an illusion. Lunchtime double so! -> ["Time", "is", "an", "illustion", "Lunchtime", "double", "so"]
    + 표준토큰화 : "Starting a home-based restaurant may be an ideal. it doesn't have a food chain or restaurant of their own." -> ['Starting', 'a', 'home-based', 'restaurant', 'may', 'be', 'an', 'ideal.', 'it', 'does', "n't", 'have', 'a', 'food', 'chain', 'or', 'restaurant', 'of', 'their', 'own', '.']
        * 규칙 1. 하이푼으로 구성된 단어는 하나로 유지한다.
        * 규칙 2. doesn't와 같이 아포스트로피로 '접어'가 함께하는 단어는 분리해준다.
    + 한글토큰화 : 한국어는 영어와 달리 띄어쓰기만으로 토큰화할 수 없다. 한글이 교착어, 조사, 어미 등을 붙여서 말을 만드는 언어이기 때문
        * 에디가 책을 읽었다 -> ['에디가', '책을', '읽었다']
        * 하지만 이를 형태소 단위로 분해하면 다음과 같습니다.
        * 자립 형태소 : 에디, 책
        * 의존 형태소 : -가, -을, 읽-, -었, -다

    + 영어 토큰화는 nltk, 한글 토큰화는 KoNLPy가 많이쓰인다고 함