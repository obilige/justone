# Transfermarkt 축구선수 몸값 데이터
- 이번 시즌 성적과 예상 이적료에 대한 데이터 확보 가능
- 500명의 Top Player 데이터를 일목요연하게 설명하는 DashBoard 만들기
- 500명의 Top Player 데이터로 예상 이적료 예측하는 모델 만들기
- https://www.transfermarkt.com/
![이미지](https://github.com/obilige/Side/blob/master/FP_value/image/1.png)

# DataFrame
- 이적료 순위 / 이름 / 포지션 / 나이 / 국적 / 소속팀 / 예상이적료 / 경기수 / 골수 / 도움수 / 옐로카드 / 레드카드 / 교체출전 / 교체아웃
- 데이터는 BeautifulSoup4로 Most Valueable Player 웹페이지 내 데이터 값들을 스크래핑해 확보
- 페이지별 url을 바로 확인 X :: 페이지 이동 이미지를 우클릭해서 페이지 url을 찾아야
    + "https://www.transfermarkt.com/spieler-statistik/wertvollstespieler/marktwertetop?land_id=0&ausrichtung=alle&spielerposition_id=alle&altersklasse=alle&jahrgang=0&kontinent_id=0&plus=1&page=1"
![이미지](https://github.com/obilige/Side/blob/master/FP_value/image/2.png)

# EDA & Visualization
- 예상 이적료를 Boxplot으로 그려 월드클래스 선수 몸값 파악해보기
    + 가정 : 500명의 탑클래스 선수들 사이에서도 이상치로 판단되는 이적료를 가진 선수는 월드클래스라 가정
    + 탑클래스 선수들 소속팀 / 리그 / 국적 / 나이 / 포지션 구성이 어떻게 될까?
![이미지](https://github.com/obilige/Side/blob/master/FP_value/image/3.jpg)
![이미지](https://github.com/obilige/Side/blob/master/FP_value/image/4.jpg)

# ML Analysis
- GridSearchCV로 최적의 파라미터 찾고 ML로 분석
- LinearRegression, Ridge, Lasso, XGBRegressor, LGBMRegressor 등
- 설명력 : 훈련(약 60%), 테스트(20%)

# Mission
- Machine Learning 분석이 안되는 이유
    + 데이터 수가 500개로 훈련하기에 충분하지 않습니다.
    + 이적료엔 직전 시즌 이적, 스타성 등 다양한 변수가 있습니다. 더 다양한 데이터 칼럼이 필요합니다.
    + 유료로 축구선수 데이터를 얻을 수 있는 사이트에서 데이터를 확보하면 머신러닝 예측모델을 만들 수 있을 것으로 보입니다.