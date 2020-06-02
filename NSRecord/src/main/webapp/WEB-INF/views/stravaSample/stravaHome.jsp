<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  
  <!-- strava css link -->
  <link href="<%= contextPath %>/resources/css/strava/stravaCss.css" rel="stylesheet" type="text/css">
  <link href="<%= contextPath %>/resources/css/strava/stravaCss1.css" rel="stylesheet" type="text/css">
  
  <title>stravaHome</title>
</head>





<body>
  <noscript>
    <iframe height='0' src='//www.googletagmanager.com/ns.html?id=GTM-TP845S' style='display:none;visibility:hidden'
      width='0'></iframe>
  </noscript>

  <header id="global-header">
    <!--
deploy: 0e7beff77addaef199668c21488f4ee5f23f533f
-->
    <!--[if lte IE 8]>
<div class='alert alert-warning message warning mb-0 text-center'>
<p>Strava에서 더 이상 지원하지 않는 Internet Explorer 버전을 사용 중입니다. <a href='http://www.microsoft.com/ko-kr/download/ie.aspx?q=internet+explorer'>웹 브라우저를 업그레이드하세요.</a> &mdash; <a href='https://strava.zendesk.com/entries/20420212-Supported-Browsers-on-Strava'>자세히 알아보기</a></p>
</div>
<![endif]-->
    <nav class="collapsable-nav container nav-bar" role="navigation">
      <div title="Strava 홈페이지로 돌아가기" class="branding"><a class="branding-content" href="/"><span
            class="sr-only">Strava</span></a></div>
      <!-- / Nav Menu Button -->
      <a href="#container-nav" aria-expanded="false" aria-controls="container-nav" data-toggle="collapse"
        class="btn btn-default btn-mobile-menu" role="button">메뉴</a>
      <div class="collapse nav-container" id="container-nav">
        <form class="form-inline" id="global-search-bar">
          <div class="form-group bottomless">
            <div class="dropdown" id="global-search-filter">
              <button aria-expanded="false" aria-haspopup="true" class="btn btn-default btn-icon btn-icon-right"
                data-toggle="dropdown" data-value="athletes">
                <span class="btn-label">선수</span>
                <span class="app-icon-wrapper  "><span class="app-icon icon-caret-down icon-dark icon-sm"></span></span>
              </button>
              <ul aria-labeledby="global-search-filter" class="dropdown-menu" role="menu">
                <li>
                  <div class="clickable" data-value="activities">
                    활동
                  </div>
                </li>
                <li>
                  <div class="clickable" data-value="athletes">
                    선수
                  </div>
                </li>
                <li>
                  <div class="clickable" data-value="clubs">
                    클럽
                  </div>
                </li>
                <li>
                  <div class="clickable" data-value="segments">
                    구간
                  </div>
                </li>
              </ul>
            </div>
            <div class="input-group">
              <label class="btn btn-white btn-icon btn-icon-only" for="global-search-field" id="global-search-button"
                title="검색">
                <span class="app-icon-wrapper  "><span class="app-icon icon-search icon-lg icon-dark"></span></span>
              </label>
              <input class="form-control" data-search-filter="athletes" id="global-search-field" placeholder="검색"
                type="text">
              <div class="btn btn-white btn-icon btn-icon-only" id="global-search-cancel" title="취소">
                <span class="app-icon-wrapper  "><span class="app-icon icon-remove icon-sm icon-dark"></span></span>
              </div>
            </div>
            <div id="global-search-autocomplete-anchor">
              <div id="global-search-autocomplete-container"></div>
            </div>
          </div>
        </form>

        <ul class="global-nav nav-group">
          <li class="drop-down-menu nav-item selected enabled" data-log-category="dashboard" data-log-page="dashboard">
            <a class="selection nav-link" href="/dashboard">대시보드
            </a>
            <ul class="options">
              <li class="">
                <a href="/dashboard">활동 피드</a>
              </li>
              <li class="">
                <a href="/athlete/segments/starred">내 구간</a>
              </li>
              <li class="">
                <a href="/athlete/routes">내 경로</a>
              </li>
              <li class="premium opt-group">
                <div class="text-caption4 subscription-callout">
                  멤버십
                </div>
                <ul>
                  <li class="" data-log-element="my_goals">
                    <a href="/athlete/goals">내 목표
                    </a></li>
                  <li class="" data-log-element="heatmaps">
                    <a href="/athlete/heatmaps">히트맵
                    </a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="drop-down-menu nav-item enabled" data-log-category="training" data-log-page="training">
            <a class="selection nav-link" href="/athlete/training/log">트레이닝
            </a>
            <ul class="options">
              <li class="">
                <a href="/athlete/calendar">트레이닝 달력</a>
              </li>
              <li class="">
                <a href="/athlete/training">내 활동</a>
              </li>
              <li class="premium opt-group">
                <div class="text-caption4 subscription-callout">
                  멤버십
                </div>
                <ul>
                  <li class="">
                    <a href="/athlete/training/log">트레이닝 로그</a>
                  </li>
                  <li class="" data-log-element="power_curve">
                    <a href="/athlete/analysis">파워 커브
                    </a></li>
                  <li class="" data-log-element="fitness_and_freshness">
                    <a href="/athlete/fitness">Fitness &amp; Freshness
                    </a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="drop-down-menu nav-item enabled" data-log-category="explore" data-log-page="explore">
            <a class="selection nav-link" href="/segments/explore">탐색
            </a>
            <ul class="options">
              <li class="">
                <a href="/segments/explore">구간 탐색</a>
              </li>
              <li class="">
                <a href="/segments/search">구간 검색</a>
              </li>
              <li class="">
                <a href="/athletes/search">선수 검색</a>
              </li>
              <li class="">
                <a href="/clubs/search">클럽</a>
              </li>
              <li class="">
                <a href="/apps">앱</a>
              </li>
              <li class="">
                <a href="/featured-running-races">달리기 레이스</a>
              </li>
              <li class="premium opt-group">
                <div class="text-caption4 subscription-callout">
                  멤버십
                </div>
                <ul>
                  <li class="" data-log-element="summit_perks">
                    <a href="/premium/perks">가입자 특전
                    </a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/challenges">챌린지
            </a></li>
        </ul>

        <ul class="user-nav nav-group">
          <li class="nav-item upgrade">
            <a class="experiment btn btn-sm btn-primary"
              href="/premium?cta=free-trial&amp;element=link&amp;source=global-header">평가판 시작
            </a></li>
          <li class="nav-item" id="notifications">
            <button class="btn btn-unstyled empty" id="notifications-button" title="새로운 알림 0개가 있습니다">
              <div class="app-icon-wrapper">
                <div class="app-icon icon-notification">
                  알림
                </div>
              </div>
              <div id="notifications-count">0</div>
            </button>
            <div aria-labeledby="notifications-button" id="notifications-drop-down">
              <p class="no-notifications text-caption1">
                알림이 없습니다.
              </p>
            </div>
          </li>
          <li class="nav-item drop-down-menu user-menu enabled">
            <a class="nav-link selection" href="/athletes/60202029">
              <div class="avatar avatar-athlete">
                <img alt="윤석" class="avatar-img"
                  src="https://lh6.googleusercontent.com/-tj4ux7m5X3s/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn1GS8A-mRPf9_AIupuVTLl9_Uxrw/photo.jpg">
              </div>
              <span class="athlete-name">
                윤석 한
              </span>
            </a>
            <ul class="options">
              <li class="featured">
                <span class="clickable find-and-invite" data-source="header menu">
                  친구 찾기
                </span>
              </li>
              <li><a href="/athletes/60202029">내 프로필</a></li>
              <li><a href="/settings/profile">설정</a></li>
              <li><a rel="nofollow" data-method="delete" href="/session">로그아웃</a></li>
            </ul>
          </li>
          <li class="nav-item drop-down-menu upload-menu enabled">
            <a class="nav-link selection" href="/upload">
              <div class="upload-button-wrapper">
                <div class="upload-button icon-upload app-icon icon-sm">
                  업로드
                </div>
              </div>
            </a>
            <ul class="options">
              <li>
                <a href="/upload">
                  <span class="upload-activity app-icon icon-upload-activity"></span>
                  활동 업로드
                </a>
              </li>
              <li>
                <a href="/upload/manual">
                  <span class="upload-activity-manual app-icon icon-upload-activity-manual"></span>
                  수동 입력 추가
                </a>
              </li>
              <li>
                <a href="/routes/new">
                  <span class="upload-route app-icon icon-upload-route"></span>
                  경로 만들기
                </a>
              </li>
              <li>
                <a href="/athletes/60202029/posts/new">
                  <span class="create-post app-icon icon-create-post"></span>
                  게시물 생성
                </a>
              </li>
            </ul>
          </li>
        </ul>

        <div class="section sidebar-footer">
          <ul class="mt-md mb-sm">
            <li><a href="https://strava.zendesk.com/home">지원</a></li>
            <li><a href="/premium">가입</a></li>
            <li><a href="/legal/terms">약관</a></li>
            <li><a href="/legal/privacy">개인정보 보호정책</a></li>
          </ul>
          <ul class="mt-sm mb-md">
            <li class="dropdown drop-down-menu drop-down-xs enabled" id="language-picker">
              <button aria-haspopup="" class="btn btn-default btn-xs dropdown-selection btn-white selection"
                data-toggle="dropdown" id="dropdown-language-picker-button" tabindex="0">
                한국어
              </button>
              <ul aria-labeledby="dropdown-language-picker-button" class="dropdown-menu anchor-bottom" role="menu">
                <li>
                  <div class="replace-selection clickable language-pick" language-code="en-GB">British English</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="de-DE">Deutsch</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="en-US">English (US)</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="es-ES">español</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="es-419">español latinoamericano
                  </div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="fr-FR">français</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="it-IT">italiano</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="nl-NL">Nederlands</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="pt-PT">português</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="pt-BR">português do Brasil</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="ru-RU">русский</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="zh-TW">繁體中文</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="ja-JP">日本語</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="zh-CN">中文</div>
                </li>
                <li>
                  <div class="replace-selection clickable language-pick" language-code="ko-KR">한국어</div>
                </li>
              </ul>
            </li>
            <li class="dropdown drop-down-menu drop-down-xs enabled" id="dropdown-more">
              <button aria-haspopup="" class="btn btn-default btn-xs dropdown-selection btn-white selection"
                data-toggle="dropdown" id="dropdown-more-button" tabindex="0">
                정보
              </button>
              <ul aria-labeledby="dropdown-more-button" class="dropdown-menu anchor-bottom" role="menu">
                <li><a href="/about">정보</a></li>
                <li><a href="/careers">커리어</a></li>
                <li><a href="https://business.strava.com">비즈니스</a></li>
                <li><a href="http://labs.strava.com/developers">개발자</a></li>
                <li><a href="http://labs.strava.com">실험실</a></li>
                <li><a href="https://strava.zendesk.com/entries/46363890-About-Strava-Maps">지도 정보</a></li>
                <li><a href="/community-standards">Strava 커뮤니티 표준</a></li>
              </ul>
            </li>
            <li class="dropdown drop-down-menu drop-down-xs enabled" id="dropdown-follow-us">
              <button aria-haspopup="" class="btn btn-default btn-xs dropdown-selection btn-white selection"
                data-toggle="dropdown" id="dropdown-follow-us-button" tabindex="0">
                팔로우
              </button>
              <ul aria-labeledby="dropdown-follow-us-button" class="dropdown-menu anchor-bottom" role="menu">
                <li><a target="_blank" href="http://www.facebook.com/Strava">Facebook</a></li>
                <li><a target="_blank" href="http://twitter.com/strava">Twitter</a></li>
                <li><a target="_blank" href="http://instagram.com/strava">Instagram</a></li>
                <li><a target="_blank" href="http://www.youtube.com/stravainc">YouTube</a></li>
                <li><a href="http://blog.strava.com">블로그</a></li>
              </ul>
            </li>
          </ul>
          <div class="copyright mt-md mb-md">
            © 2020 Strava
          </div>
        </div>

      </div>
    </nav>
  </header>


  <div class="messages" id="system-messages-js">
    <div class="flash-messages">
    </div>
    <div class="container"></div>
  </div>


  <div class="page container mt-lg">
    <div class="row">
      <div class="sidebar col-md-3" id="dashboard-athlete-sidebar">
        <div class="container">
          <div class="fixed-sidebar-container row">
            <div class="col-md-3">
              <div class="card athlete-profile" id="athlete-profile">
                <div class="card-body text-center">
                  <a href="/athletes/60202029">
                    <div class="avatar avatar-athlete avatar-lg">
                      <div class="avatar-content">
                        <div class="avatar-img-wrapper">
                          <div class="avatar-badge"><span class="app-icon-wrapper  "><span
                                class="app-icon icon-badge-"></span></span></div>
                          <img alt="윤석 한" class="avatar-img"
                            src="https://lh6.googleusercontent.com/-tj4ux7m5X3s/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn1GS8A-mRPf9_AIupuVTLl9_Uxrw/photo.jpg">
                        </div>
                      </div>
                    </div>

                    <h2 class="text-title2 mt-sm mb-md">
                      <div class="athlete-name">윤석 한</div>
                    </h2>
                  </a>
                  <ul class="list-stats text-center">
                    <li>
                      <a class="stat" href="/athletes/60202029/follows?type=following">
                        <div class="stat-subtext">팔로잉</div>
                        <b class="stat-text">0</b>
                      </a></li>
                    <li>
                      <a class="stat" href="/athletes/60202029/follows?type=followers">
                        <div class="stat-subtext">팔로워</div>
                        <b class="stat-text">0</b>
                      </a></li>
                    <li>
                      <a class="stat" href="/athlete/training">
                        <div class="stat-subtext">활동</div>
                        <b class="stat-text">0</b>
                      </a></li>
                  </ul>
                </div>
                <div class="card-footer">
                  <a class="btn-card-link media media-middle text-small" href="/upload/device">
                    <div class="media-body"><span>활동을 추가</span>합니다. Strava에 활동을 기록하거나 업로드하는 방법을 자세히 알아보세요.</div>
                    <div class="media-right"><span class="app-icon-wrapper  "><span
                          class="app-icon icon-caret-right icon-dark icon-lg"></span></span></div>
                  </a>
                </div>
              </div>
              <div class="card card-group" id="js-dashboard-athlete-goals">
                <div class="tabbed-cards" id="progress-goals">
                  <div class="progress-goals-header">
                    <h3>목표</h3>
                  </div>
                  <ul class="tabs tabs-justified with-tab-contents" role="tablist">
                    <li aria-controls="run-goals" aria-selected="true" id="run-goals-tab" role="tab">
                      <div class="tab" data-sport="Run">
                        <span class="app-icon-wrapper  "><span title="달리기 목표"
                            class="app-icon icon-run icon-dark icon-lg">달리기 목표</span></span>
                      </div>
                    </li>
                    <li aria-controls="ride-goals" aria-selected="false" id="ride-goals-tab" role="tab">
                      <div class="tab" data-sport="Ride">
                        <span class="app-icon-wrapper  "><span title="라이딩 목표"
                            class="app-icon icon-ride icon-dark icon-lg">라이딩 목표</span></span>
                      </div>
                    </li>
                    <li aria-controls="swim-goals" aria-selected="false" id="swim-goals-tab" role="tab">
                      <div class="tab" data-sport="Swim">
                        <span class="app-icon-wrapper  "><span title="수영 목표"
                            class="app-icon icon-swim icon-dark icon-lg">수영 목표</span></span>
                      </div>
                    </li>
                  </ul>
                  <div class="card">
                    <div class="tab-contents">
                      <div aria-hidden="false" aria-labelledby="run-goals-tab" class="tab-content view-only"
                        data-sport="run" id="run-goals">
                        <div class="js-view">
                          <div class="card-body">
                            <div class="js-snw-goals-upsell media upsell">
                              <div class="media-body pl-sm">
                                가입하고 맞춤 진행 상황, 구간 및 파워 목표를 사용하여 의욕을 유지하세요. <a href="/joinsummit">업그레이드</a>
                              </div>
                            </div>
                          </div>
                          <div class="card-body weekly-goal text-center" id="run">
                            <h4 class="h6 mt-0">
                              이번 주
                            </h4>
                            <div class="primary-stats">
                              <span class="actual">0mi</span>
                            </div>
                            <svg height="68" width="248">
                              <g class="activity-chart" transform="translate(24, 5)">
                                <g transform="translate(0,0)" class="volume-bar-container">
                                  <rect class="volume-bar past" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(17,0)" class="volume-bar-container">
                                  <rect class="volume-bar highlighted" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(34,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(51,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(68,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(85,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(102,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(0,63)" class="day-label-container"><text class="day-label past"
                                    x="0" y="0">월</text></g>
                                <g transform="translate(17,63)" class="day-label-container"><text
                                    class="day-label highlighted" x="0" y="0">화</text></g>
                                <g transform="translate(34,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">수</text></g>
                                <g transform="translate(51,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">목</text></g>
                                <g transform="translate(68,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">금</text></g>
                                <g transform="translate(85,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">토</text></g>
                                <g transform="translate(102,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">일</text></g>
                              </g>
                              <g class="progress-chart" transform="translate(132, 7)">
                                <g transform="translate(59.5,29)" class="progress-container">
                                  <path class="bg-circle"
                                    d="M0,32A32,32 0 1,1 0,-32A32,32 0 1,1 0,32M0,30A30,30 0 1,0 0,-30A30,30 0 1,0 0,30Z">
                                  </path>
                                  <image transform="translate(-14, -14)" class="sport-type"
                                    xlink:href="https://d3nn82uaxijpm6.cloudfront.net/assets/sports_run_normal_small-18dfa92ca1a678c18f82704596a250fc156e4d0b7fe097798e3833448d2a9c0e.svg"
                                    width="28" height="28" opacity="0.20"></image>
                                </g>
                              </g>
                            </svg>
                            <ul class="list-stats mb-0 mt-md no-activity text-center">
                              <li>0<abbr class="unit" title="시간">시간</abbr> 0<abbr class="unit" title="분">분</abbr></li>
                              <li>0ft</li>
                            </ul>
                          </div>
                          <div class="card-body yearly-goal text-center" id="run-yearly-progress-container">
                            <h4 class="h6 mt-0">
                              금년
                            </h4>
                            <div class="chart-container"><svg width="248" height="50"
                                class="progress-bar-svg-container">
                                <g transform="translate(0, 14)">
                                  <rect height="10" width="248" class="progress-bar-container"></rect>
                                  <line x1="104.34972677595628" x2="104.34972677595628" y1="0" y2="15"
                                    class="progress-marker"></line>
                                </g><text text-anchor="start" x="94.34972677595628" y="42" class="today-label">오늘</text>
                              </svg></div>
                          </div>

                        </div>
                        <div class="js-edit" style="display: none;">
                          <button class="btn btn-white btn-icon btn-icon-only btn-xs btn-edit-cancel js-cancel">
                            <span class="app-icon-wrapper  "><span title="취소"
                                class="app-icon icon-close icon-dark icon-sm">취소</span></span>
                          </button>
                          <form class="card-body">
                            <h4 class="h6">
                              이번 주
                            </h4>
                            <div class="goal-form media media-center" data-period="week" data-type="run">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="run-goal">
                                  달리기 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="run-goal" max="40000"
                                  min="0" name="run-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  mi
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <h4 class="h6">
                              금년
                            </h4>
                            <div class="goal-form media media-center" data-period="year" data-type="run">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="run-goal">
                                  달리기 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="run-goal" max="40000"
                                  min="0" name="run-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  mi
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <div class="inline-inputs form-actions mb-md">
                              <input class="btn btn-primary btn-sm" data-sport="run" type="submit" value="저장">
                              <span class="btn btn-link js-cancel clickable ml-sm">
                                취소
                              </span>
                            </div>
                          </form>

                        </div>
                      </div>
                      <div aria-hidden="true" aria-labelledby="ride-goals-tab" class="tab-content view-only"
                        data-sport="ride" id="ride-goals">
                        <div class="js-view">
                          <div class="card-body">
                            <div class="js-snw-goals-upsell media upsell">
                              <div class="media-body pl-sm">
                                가입하고 맞춤 진행 상황, 구간 및 파워 목표를 사용하여 의욕을 유지하세요. <a href="/joinsummit">업그레이드</a>
                              </div>
                            </div>
                          </div>
                          <div class="card-body weekly-goal text-center" id="ride">
                            <h4 class="h6 mt-0">
                              이번 주
                            </h4>
                            <div class="primary-stats">
                              <span class="actual">0mi</span>
                            </div>
                            <svg height="68" width="248">
                              <g class="activity-chart" transform="translate(24, 5)">
                                <g transform="translate(0,0)" class="volume-bar-container">
                                  <rect class="volume-bar past" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(17,0)" class="volume-bar-container">
                                  <rect class="volume-bar highlighted" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(34,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(51,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(68,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(85,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(102,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(0,63)" class="day-label-container"><text class="day-label past"
                                    x="0" y="0">월</text></g>
                                <g transform="translate(17,63)" class="day-label-container"><text
                                    class="day-label highlighted" x="0" y="0">화</text></g>
                                <g transform="translate(34,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">수</text></g>
                                <g transform="translate(51,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">목</text></g>
                                <g transform="translate(68,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">금</text></g>
                                <g transform="translate(85,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">토</text></g>
                                <g transform="translate(102,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">일</text></g>
                              </g>
                              <g class="progress-chart" transform="translate(132, 7)">
                                <g transform="translate(59.5,29)" class="progress-container">
                                  <path class="bg-circle"
                                    d="M0,32A32,32 0 1,1 0,-32A32,32 0 1,1 0,32M0,30A30,30 0 1,0 0,-30A30,30 0 1,0 0,30Z">
                                  </path>
                                  <image transform="translate(-14, -14)" class="sport-type"
                                    xlink:href="https://d3nn82uaxijpm6.cloudfront.net/assets/sports_bike_normal_small-66f3a7e48b67f4985cc738e5834e1ffad588b4237f29e41a613c56c4f43ed4ab.svg"
                                    width="28" height="28" opacity="0.20"></image>
                                </g>
                              </g>
                            </svg>
                            <ul class="list-stats mb-0 mt-md no-activity text-center">
                              <li>0<abbr class="unit" title="시간">시간</abbr> 0<abbr class="unit" title="분">분</abbr></li>
                              <li>0ft</li>
                            </ul>
                          </div>
                          <div class="card-body yearly-goal text-center" id="ride-yearly-progress-container">
                            <h4 class="h6 mt-0">
                              금년
                            </h4>
                            <div class="chart-container"><svg width="248" height="50"
                                class="progress-bar-svg-container">
                                <g transform="translate(0, 14)">
                                  <rect height="10" width="248" class="progress-bar-container"></rect>
                                  <line x1="104.34972677595628" x2="104.34972677595628" y1="0" y2="15"
                                    class="progress-marker"></line>
                                </g><text text-anchor="start" x="94.34972677595628" y="42" class="today-label">오늘</text>
                              </svg></div>
                          </div>

                        </div>
                        <div class="js-edit" style="display: none;">
                          <button class="btn btn-white btn-icon btn-icon-only btn-xs btn-edit-cancel js-cancel">
                            <span class="app-icon-wrapper  "><span title="취소"
                                class="app-icon icon-close icon-dark icon-sm">취소</span></span>
                          </button>
                          <form class="card-body">
                            <h4 class="h6">
                              이번 주
                            </h4>
                            <div class="goal-form media media-center" data-period="week" data-type="ride">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="ride-goal">
                                  라이딩 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="ride-goal" max="200000"
                                  min="0" name="ride-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  mi
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <h4 class="h6">
                              금년
                            </h4>
                            <div class="goal-form media media-center" data-period="year" data-type="ride">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="ride-goal">
                                  라이딩 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="ride-goal" max="200000"
                                  min="0" name="ride-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  mi
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <div class="inline-inputs form-actions mb-md">
                              <input class="btn btn-primary btn-sm" data-sport="ride" type="submit" value="저장">
                              <span class="btn btn-link js-cancel clickable ml-sm">
                                취소
                              </span>
                            </div>
                          </form>

                        </div>
                      </div>
                      <div aria-hidden="true" aria-labelledby="swim-goals-tab" class="tab-content view-only"
                        data-sport="swim" id="swim-goals">
                        <div class="js-view">
                          <div class="card-body">
                            <div class="js-snw-goals-upsell media upsell">
                              <div class="media-body pl-sm">
                                가입하고 맞춤 진행 상황, 구간 및 파워 목표를 사용하여 의욕을 유지하세요. <a href="/joinsummit">업그레이드</a>
                              </div>
                            </div>
                          </div>
                          <div class="card-body weekly-goal text-center" id="swim">
                            <h4 class="h6 mt-0">
                              이번 주
                            </h4>
                            <div class="primary-stats">
                              <span class="actual">0 yd</span>
                            </div>
                            <svg height="68" width="248">
                              <g class="activity-chart" transform="translate(24, 5)">
                                <g transform="translate(0,0)" class="volume-bar-container">
                                  <rect class="volume-bar past" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(17,0)" class="volume-bar-container">
                                  <rect class="volume-bar highlighted" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(34,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(51,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(68,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(85,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(102,0)" class="volume-bar-container">
                                  <rect class="volume-bar future" y="46" height="2" width="11"></rect>
                                </g>
                                <g transform="translate(0,63)" class="day-label-container"><text class="day-label past"
                                    x="0" y="0">월</text></g>
                                <g transform="translate(17,63)" class="day-label-container"><text
                                    class="day-label highlighted" x="0" y="0">화</text></g>
                                <g transform="translate(34,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">수</text></g>
                                <g transform="translate(51,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">목</text></g>
                                <g transform="translate(68,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">금</text></g>
                                <g transform="translate(85,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">토</text></g>
                                <g transform="translate(102,63)" class="day-label-container"><text
                                    class="day-label future" x="0" y="0">일</text></g>
                              </g>
                              <g class="progress-chart" transform="translate(132, 7)">
                                <g transform="translate(59.5,29)" class="progress-container">
                                  <path class="bg-circle"
                                    d="M0,32A32,32 0 1,1 0,-32A32,32 0 1,1 0,32M0,30A30,30 0 1,0 0,-30A30,30 0 1,0 0,30Z">
                                  </path>
                                  <image transform="translate(-14, -14)" class="sport-type"
                                    xlink:href="https://d3nn82uaxijpm6.cloudfront.net/assets/sports_water_normal_small-fbf48425e12c71cf28a55afbbc08fc8e3bab74718f0ba621396328d43609f6f0.svg"
                                    width="28" height="28" opacity="0.20"></image>
                                </g>
                              </g>
                            </svg>
                            <ul class="list-stats mb-0 mt-md no-activity text-center">
                              <li>0<abbr class="unit" title="시간">시간</abbr> 0<abbr class="unit" title="분">분</abbr></li>
                              <li>0ft</li>
                            </ul>
                          </div>
                          <div class="card-body yearly-goal text-center" id="swim-yearly-progress-container">
                            <h4 class="h6 mt-0">
                              금년
                            </h4>
                            <div class="chart-container"><svg width="248" height="50"
                                class="progress-bar-svg-container">
                                <g transform="translate(0, 14)">
                                  <rect height="10" width="248" class="progress-bar-container"></rect>
                                  <line x1="104.34972677595628" x2="104.34972677595628" y1="0" y2="15"
                                    class="progress-marker"></line>
                                </g><text text-anchor="start" x="94.34972677595628" y="42" class="today-label">오늘</text>
                              </svg></div>
                          </div>

                        </div>
                        <div class="js-edit" style="display: none;">
                          <button class="btn btn-white btn-icon btn-icon-only btn-xs btn-edit-cancel js-cancel">
                            <span class="app-icon-wrapper  "><span title="취소"
                                class="app-icon icon-close icon-dark icon-sm">취소</span></span>
                          </button>
                          <form class="card-body">
                            <h4 class="h6">
                              이번 주
                            </h4>
                            <div class="goal-form media media-center" data-period="week" data-type="swim">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="swim-goal">
                                  수영 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="swim-goal" max="2080000"
                                  min="0" name="swim-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  yd
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <h4 class="h6">
                              금년
                            </h4>
                            <div class="goal-form media media-center" data-period="year" data-type="swim">
                              <div class="toggle-button toggle-goal media-left" role="button">
                                <div class="btn"></div>
                              </div>
                              <div class="media-body form-group mb-0">
                                <label class="vh vhide" for="swim-goal">
                                  수영 목표
                                </label>
                                <input class="form-control input-block input-sm goal-value" id="swim-goal" max="2080000"
                                  min="0" name="swim-goal" type="number" disabled="">
                              </div>
                              <div class="media-right goal-unit btn-group">
                                <button class="btn btn-default btn-sm active" data-type="distance" disabled="">
                                  yd
                                </button>
                                <button class="btn btn-default btn-sm" data-type="time" disabled="">시간</button>
                              </div>
                            </div>
                            <div class="inline-inputs form-actions mb-md">
                              <input class="btn btn-primary btn-sm" data-sport="swim" type="submit" value="저장">
                              <span class="btn btn-link js-cancel clickable ml-sm">
                                취소
                              </span>
                            </div>
                          </form>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <script>
                  jQuery('document').ready(function () {
                    var width = jQuery('#progress-goals .yearly-goal.card-body').width()

                    var weekProgress = new Strava.ProgressGoals.WeekProgress(60202029, [{ "id": "2020y23w", "sport": "run", "totals_by_sport": { "ride": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "run": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "swim": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 } }, "goals_by_sport": {}, "display_type": "multisport_goal", "by_day_of_week": { "1": { "activities": [] }, "2": { "activities": [] }, "3": { "activities": [] }, "4": { "activities": [] }, "5": { "activities": [] }, "6": { "activities": [] }, "7": { "activities": [] } } }, { "id": "2020y23w", "sport": "ride", "totals_by_sport": { "ride": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "run": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "swim": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 } }, "goals_by_sport": {}, "display_type": "multisport_goal", "by_day_of_week": { "1": { "activities": [] }, "2": { "activities": [] }, "3": { "activities": [] }, "4": { "activities": [] }, "5": { "activities": [] }, "6": { "activities": [] }, "7": { "activities": [] } } }, { "id": "2020y23w", "sport": "swim", "totals_by_sport": { "ride": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "run": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 }, "swim": { "moving_time": 0, "elapsed_time": 0, "distance": 0, "elev_gain": 0 } }, "goals_by_sport": {}, "display_type": "multisport_goal", "by_day_of_week": { "1": { "activities": [] }, "2": { "activities": [] }, "3": { "activities": [] }, "4": { "activities": [] }, "5": { "activities": [] }, "6": { "activities": [] }, "7": { "activities": [] } } }]);
                    var yearProgress = new Strava.ProgressGoals.YearlyGoals([{ "sport": "run", "goal_type": null, "goal_label": "0mi 예상", "goal_amount": null, "goal_met": false, "tooltip_label": null, "progress_extent": 0.0, "percent_year_complete": 0.4207650273224044, "progress": null, "show_tooltip": false, "today_label": "오늘" }, { "sport": "ride", "goal_type": null, "goal_label": "0mi 예상", "goal_amount": null, "goal_met": false, "tooltip_label": null, "progress_extent": 0.0, "percent_year_complete": 0.4207650273224044, "progress": null, "show_tooltip": false, "today_label": "오늘" }, { "sport": "swim", "goal_type": null, "goal_label": "0 yd 예상", "goal_amount": null, "goal_met": false, "tooltip_label": null, "progress_extent": 0.0, "percent_year_complete": 0.4207650273224044, "progress": null, "show_tooltip": false, "today_label": "오늘" }]);
                    var weekAttrs = {
                      elSelector: '#progress-goals',
                      chartWidthPercentage: 0.5,
                      activityChartClass: 'activity-chart',
                      progressChartClass: 'progress-chart',
                      rideImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_bike_normal_small-66f3a7e48b67f4985cc738e5834e1ffad588b4237f29e41a613c56c4f43ed4ab.svg',
                      runImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_run_normal_small-18dfa92ca1a678c18f82704596a250fc156e4d0b7fe097798e3833448d2a9c0e.svg',
                      swimImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_water_normal_small-fbf48425e12c71cf28a55afbbc08fc8e3bab74718f0ba621396328d43609f6f0.svg',
                      collection: weekProgress
                    };
                    var yearAttrs = {
                      elSelector: '#progress-goals',
                      athletePremium: false,
                      width: width,
                      rideImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_bike_normal_small-66f3a7e48b67f4985cc738e5834e1ffad588b4237f29e41a613c56c4f43ed4ab.svg',
                      runImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_run_normal_small-18dfa92ca1a678c18f82704596a250fc156e4d0b7fe097798e3833448d2a9c0e.svg',
                      swimImagePath: 'https://d3nn82uaxijpm6.cloudfront.net/assets/sports_water_normal_small-fbf48425e12c71cf28a55afbbc08fc8e3bab74718f0ba621396328d43609f6f0.svg',
                      collection: yearProgress
                    };

                    var goalsView = new Strava.ProgressGoals.GoalPageView({
                      el: '#progress-goals',
                      athleteId: 60202029,
                      weeklyGoalPageView: new Strava.ProgressGoals.WeeklyGoalPageView(weekAttrs),
                      yearlyGoalPageView: new Strava.ProgressGoals.YearlyGoalPageView(yearAttrs),
                      weekProgress: weekProgress,
                      yearProgress: yearProgress,
                      containingPage: "dashboard"
                    });
                    goalsView.render();
                  });
                </script>

                <div class="card">
                  <div class="card-footer">
                    <div class="card-section">
                      <a class="btn-card-link media media-middle" href="/athlete/goals" id="js-manage-your-goals">
                        <div class="media-body">목표 관리</div>
                        <div class="media-right"><span class="app-icon-wrapper  "><span
                              class="app-icon icon-caret-right icon-dark icon-lg"></span></span></div>
                      </a>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
      <div class="main col-md-6" id="dashboard-feed">
        <div class="feed-container">
          <div class="feed">
            <div class="getting-started feed-entry card">
              <div class="entry-media entry-outset">
                <img alt=""
                  src="https://d3nn82uaxijpm6.cloudfront.net/assets/onboarding/header_image-39d887c771c7094d2adeb4fe67589f471f70bb3fc26e66b69a7e4edf29f90ce6.jpg">
              </div>
              <div class="entry-header">
                <h3 class="entry-title">
                  시작하기
                </h3>
                <div class="entry-subtitle">
                  Strava를 처음 사용하시는 데 도움이 되도록 몇 가지 팁을 보여 드립니다.
                </div>
              </div>
              <div class="entry-body">
                <div class="media">
                  <div class="media-left">
                    <img alt="" class="badge-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/onboarding/record_badge-a8f8252a5009b2b7e506fbb7ba7c2c46939e8bb90785efaff399c22afc4dc515.svg">
                  </div>
                  <div class="media-body">
                    <h4 class="title-text topless">
                      첫 번째 활동 기록
                    </h4>
                    <p>GPS 장치를 설정하면 운동한 내용이 Strava로 바로 매끄럽게 업로드됩니다. 장치가 없나요? 그래도 문제는 없습니다. 모바일 앱에서도 언제 어디서나 활동을 기록하고 서버에
                      연결할 수 있습니다.</p>
                    <a href="/upload" id="connect-btn" class="btn btn-primary btn-icon btn-sm" role="button">장치 연결</a>
                  </div>
                </div>
              </div>
              <div class="entry-body">
                <div class="media">
                  <div class="media-left">
                    <img alt="" class="badge-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/onboarding/connect_badge-e47b1c97fbf9695b5da7347c2729da78c0f98a016543ae2d84fa265adf465828.svg">
                  </div>
                  <div class="media-body">
                    <h4 class="title-text topless">
                      친구는 어떤 방식을 사용하는지 알아보세요.
                    </h4>
                    <p>이미 Strava 회원인 Facebook 친구를 찾아 함께하도록 초대합니다. 서로 격려하고 새로운 운동법을 발견하기도 하며, 이미 알고 있는 선수와 함께 트레이닝을 시작할
                      수도 있습니다.</p>
                    <button id="connect-facebook-button-js" data-default-tab="facebook"
                      class="btn btn-facebook btn-icon btn-sm find-and-invite"><span class="app-icon-wrapper  "><span
                          class="app-icon icon-facebook icon-white icon-sm"></span></span>Facebook 연결</button>
                  </div>
                </div>
              </div>
              <div class="entry-body">
                <div class="media">
                  <div class="media-left">
                    <img alt="" class="badge-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/onboarding/privacy_icon-aaeddfa9eec777a54cfd4f1ba6ad004124bf8d79251e6a43aaf23c080cc22d77.svg">
                  </div>
                  <div class="media-body">
                    <h4 class="title-text topless">
                      Strava 프라이버시
                    </h4>
                    <p>Strava의 프라이버시 관리에 대해 자세히 알아보기 / 프로필 설정 사용자 지정하기</p>
                    <a href="/settings/privacy" id="privacy-btn" class="btn btn-primary btn-icon btn-sm"
                      role="button">프라이버시 설정</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="getting-started get-app feed-entry card">
              <div class="entry-body">
                <div class="media">
                  <div class="media-left">
                    <img alt=""
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/onboarding/mobile_app-ac2d2af9ceacf1b5d362ea3b4d7d7a42ef21e96c6a4677b6d1a5031704daa14e.jpg">
                  </div>
                  <div class="media-body">
                    <h4 class="title-text topless">무료 앱 다운로드</h4>
                    <p>휴대전화에서 바로 활동을 기록, 분석, 공유합니다. 무료 Strava 앱을 사용하면 친구와 친목을 다지고 다음 번 운동에 대비할 수 있습니다.</p>
                    <div class="inset upload-links">
                      <a href="https://itunes.apple.com/app/strava-cycling/id426826309?mt=8"><img
                          alt="App Store에서 Strava iOS 앱 다운로드"
                          src="https://d3nn82uaxijpm6.cloudfront.net/assets/i18n/ko-KR/marketing/btn-app-store-9517523fd6083f7beb0ac617ea9288f08d38da5598b90d241e5b6f2266d0034f.png"></a>
                      <a href="https://play.google.com/store/apps/details?id=com.strava"><img
                          alt="Google Play에서 사용하는 Strava Android 앱"
                          src="https://d3nn82uaxijpm6.cloudfront.net/assets/i18n/ko-KR/marketing/btn-google-play-1975a4d17518063787721f8d76effd3661f57380f613a77b3c73f756a55f3048.svg"></a>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="sidebar col-md-3" id="dashboard-sidebar">
        <div class="container">
          <div class="fixed-sidebar-container row">
            <div class="col-md-3">
              <section class="section club" id="club-module">
                <div class="media">
                  <div class="media-object">
                    <img alt="" class="media-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/application/dashboard/sidebar-badge-clubs-dda5c075f23e3f2ced7d0e4b2afb87df988978962b6de33c7a232be53b6a75ca.png">
                  </div>
                  <div class="media-body">
                    <h4 class="text-subhead media-title">Strava 클럽</h4>
                    <p class="media-text">
                      왜 혼자 운동하시나요? 클럽을 만들거나 가입하여 Strava를 최대한 활용해보세요.
                    </p>
                    <a class="btn btn-primary btn-link btn-sm" href="/clubs/search">Strava 클럽 찾기 또는 만들기</a>
                  </div>
                </div>
              </section>
              <section class="section" id="invite-your-friend-module">
                <div class="media">
                  <div class="media-object">
                    <img alt="" class="media-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/application/dashboard/sidebar-badge-challenges-9908f45d44160c600a4f9d788795b180a74001daae32461705f5f57d90a7c651.png">
                  </div>
                  <div class="media-body">
                    <h4 class="text-subhead media-title">Strava에 가입한 친구</h4>
                    <p class="media-text">
                      친구를 찾아보거나 초대하여 서로의 모험을 살펴보고 서로 격려하는 마음을 나누세요.
                    </p>
                    <button class="btn btn-link btn-primary btn-sm button find-and-invite"
                      data-source="dashboard sidebar" href="javascript:;">
                      친구 찾기 및 초대
                    </button>

                  </div>
                </div>
              </section>
              <section class="section" id="summit-trial-upsell-module">
                <div class="media">
                  <div class="media-object">
                    <img alt="" class="media-img"
                      src="https://d3nn82uaxijpm6.cloudfront.net/assets/application/dashboard/sidebar-badge-summit-93ce3adf58361718c449f877e79b472a6d097304d6041aec8700593963fc156a.png">
                  </div>
                  <div class="media-body">
                    <h4 class="text-subhead media-title">두 달 무료</h4>
                    <p class="media-text">
                      무료로 가입해 보세요. 언제든지 해지할 수 있습니다. "Strava 가입 감사 선물"이라고 생각해 주세요.
                    </p>
                    <a class="btn btn-primary btn-link btn-sm" href="/summit/join">30일 무료 평가판 시작하기</a>
                  </div>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="footer-global container" role="navigation">
      <div class="row">
        <div class="col-sm-3">
          <div title="Strava 홈페이지로 돌아가기" class="branding logo-bw"><a class="branding-content" href="/"><span
                class="sr-only">Strava</span></a></div>
          <div class="copyright">
            © 2020 Strava
          </div>
        </div>
        <div class="col-sm-2 col-sm-offset-1">
          <h4>정보</h4>
          <ul class="list-unstyled">
            <li><a href="/about">정보</a></li>
            <li><a href="/features">기능</a></li>
            <li><a href="/mobile">모바일</a></li>
            <li><a href="/premium?cta=subscription&amp;element=nav&amp;source=global-footer">가입</a></li>
            <li><a href="/legal/privacy">개인정보 보호정책</a></li>
            <li><a href="/legal/terms">약관</a></li>
            <li><a href="https://strava.zendesk.com/entries/46363890-About-Strava-Maps">지도 정보</a></li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h4>팔로우</h4>
          <ul class="list-unstyled">
            <li><a target="_blank" href="http://www.facebook.com/Strava">Facebook</a></li>
            <li><a target="_blank" href="http://twitter.com/strava">Twitter</a></li>
            <li><a target="_blank" href="http://instagram.com/strava">Instagram</a></li>
            <li><a target="_blank" href="http://www.youtube.com/stravainc">YouTube</a></li>
            <li><a href="http://blog.strava.com">블로그</a></li>
          </ul>
        </div>
        <div class="col-sm-2">
          <h4>도움말</h4>
          <ul class="list-unstyled">
            <li><a href="https://strava.zendesk.com/home">Strava 지원</a></li>
          </ul>

        </div>
        <div class="col-sm-2">
          <h4>기타</h4>
          <ul class="list-unstyled">
            <li><a href="/local">Local</a></li>
            <li><a href="/careers">커리어</a></li>
            <li><a href="https://business.strava.com">비즈니스</a></li>
            <li><a href="http://labs.strava.com/developers">개발자</a></li>
            <li><a href="http://labs.strava.com">실험실</a></li>
            <li><a href="/pros">Strava를 사용 중인 프로 선수</a></li>
            <li><a href="/community-standards">Strava 커뮤니티 표준</a></li>
          </ul>
          <div class="dropdown drop-down-menu drop-down-xs enabled" id="language-picker">
            <button class="btn btn-default btn-xs dropdown-selection btn-white selection">한국어</button>
            <ul class="options dropdown-menu anchor-right anchor-bottom">
              <li>
                <div class="replace-selection clickable language-pick" language-code="en-GB">British English</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="de-DE">Deutsch</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="en-US">English (US)</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="es-ES">español</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="es-419">español latinoamericano
                </div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="fr-FR">français</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="it-IT">italiano</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="nl-NL">Nederlands</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="pt-PT">português</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="pt-BR">português do Brasil</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="ru-RU">русский</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="zh-TW">繁體中文</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="ja-JP">日本語</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="zh-CN">中文</div>
              </li>
              <li>
                <div class="replace-selection clickable language-pick" language-code="ko-KR">한국어</div>
              </li>
            </ul>
          </div>

        </div>
      </div>
    </div>
    <a id="back-to-top" class="media-sm-show visible-sm-block" href="#">맨 위 ↑</a>
  </footer>


  <script id="lightbox-template" type="text/template">
<div class='lightbox-window modal-content'>
<div class='close-lightbox'>
<button class='btn btn-unstyled btn-close'>
<div class='app-icon icon-close icon-xs icon-white'></div>
</button>
</div>
</div>
</script>
  <script id="popover-template" type="text/template">
<div class='popover'></div>
</script>

  <script>
    window._asset_host = "https://d3nn82uaxijpm6.cloudfront.net";
    window._measurement_preference = "feet";
    window._date_preference = "%m/%d/%Y";
    window._datepicker_preference_format = "mm/dd/yy";

    jQuery(document).ready(function () {
      Strava.Util.EventLogging.createInstance("https://analytics.strava.com", "7215fa60b5f01ecc3967543619f7e3d9", 60202029);
    });
  </script>
  <script>
    //async script load for twitter
    !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = "https://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");
  </script>
  <script
    src="https://d3nn82uaxijpm6.cloudfront.net/assets/strava/i18n/locales/ko-KR-047be43a53ff53f70c52650433b3741e0dd3888d8e26fcd2fadacd5b9d5890d3.js"></script>
  <script
    src="https://d3nn82uaxijpm6.cloudfront.net/assets/application-1e5550ccbb276da15ff0592c11a53f2f265a02d0ea3779fce3109da9145bf5db.js"></script>



  <div id="fb-root" class=" fb_reset">
    <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
      <div></div>
    </div>
  </div>
  <script>
    window.fbAsyncInit = function () {
      FB.init({
        appId: "284597785309",
        status: true,
        cookie: true,
        xfbml: true,
        version: "v2.12"
      });
      Strava.Facebook.PermissionsManager.getInstance().facebookReady();
      jQuery('#fb-root').trigger('facebook:init');
    };
    (function (d) {
      var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
      if (d.getElementById(id)) { return; }
      js = d.createElement('script'); js.id = id; js.async = true;
      js.src = "//connect.facebook.net/ko_KR/sdk.js";
      ref.parentNode.insertBefore(js, ref);
    }(document));
  </script>


  <script>
    var currentAthlete = new Strava.Models.CurrentAthlete({ "id": 60202029, "logged_in": true, "display_name": "윤석 한", "first_name": "윤석", "last_name": "한", "premium": false, "has_power_analysis_access": false, "photo_large": "https://lh6.googleusercontent.com/-tj4ux7m5X3s/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn1GS8A-mRPf9_AIupuVTLl9_Uxrw/photo.jpg", "photo": "https://lh6.googleusercontent.com/-tj4ux7m5X3s/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucn1GS8A-mRPf9_AIupuVTLl9_Uxrw/photo.jpg", "badge": null, "measurement_preference": "feet", "weight_measurement_unit": "lbs", "type": 1, "member_type": "", "display_location": "", "gender": "M", "geo": { "city": null, "state": null, "country": null, "lat_lng": [null, null] }, "has_leaderboards_access": false, "has_pace_zone_analysis_access": false, "is_segments_restricted": true });
    HAML.globals = function () {
      return {
        currentAthlete: currentAthlete,
        renderPartial: function (name, context) {
          if (context == null) {
            context = this;
          }
          return JST[name](context);
        }
      }
    }
  </script>

  <script>
    new Strava.Initializer();
  </script>
  <script>
    jQuery(document).ready(function () {
      jQuery('.card-group').on('click', '.edit-goals-btn', function (e) {
        var log_element = 'edit_goal_' + jQuery(e.target).closest('.btn').data('sport');
        Strava.ExternalAnalytics.trackV2({
          category: 'goals',
          page: 'athlete_sidebar',
          action: 'click',
          element: log_element
        });
      });

      jQuery('.card-group').on('submit', '.js-edit form', function () {
        var log_element = 'save_goal_' + jQuery(this).find('input[type=submit]').data('sport');
        Strava.ExternalAnalytics.trackV2({
          category: 'goals',
          page: 'athlete_sidebar',
          action: 'click',
          element: log_element
        });
      });

      jQuery('#js-manage-your-goals').on('click', function () {
        Strava.ExternalAnalytics.trackV2({
          category: 'goals',
          page: 'athlete_sidebar',
          action: 'click',
          element: 'manage_goals'
        });
      });

      jQuery('#upcoming-goals').on('click', 'li a', function () {
        Strava.ExternalAnalytics.trackV2({
          category: 'goals',
          page: 'athlete_sidebar',
          action: 'click',
          element: 'goal_detail'
        });
      });
    });
  </script>
  <script>
    jQuery(document).ready(function () {
      var isMobile = false;
      Strava.ExternalAnalytics.trackV2({
        category: 'onboarding',
        page: 'new_feed',
        action: 'screen_enter',
        properties: {
          is_mobile: isMobile
        }
      });

      jQuery(document).on('click', '#connect-btn', function () {
        Strava.ExternalAnalytics.trackV2({
          category: 'onboarding',
          page: 'new_feed ',
          action: 'click',
          element: 'connect_device',
          properties: {
            is_mobile: isMobile
          }
        });
      });

      jQuery(document).on('click', '#privacy-btn', function () {
        Strava.ExternalAnalytics.trackV2({
          category: 'onboarding',
          page: 'new_feed ',
          action: 'click',
          element: 'privacy_settings',
          properties: {
            is_mobile: isMobile
          }
        });
      });

      jQuery(document).on('click', '#connect-facebook-button-js', function () {
        Strava.ExternalAnalytics.trackV2({
          category: 'onboarding',
          page: 'new_feed ',
          action: 'click',
          element: 'connect_fb',
          properties: {
            is_mobile: isMobile
          }
        });
      });

      if (jQuery('.js-snw-goals-upsell').length > 0) {
        Strava.ExternalAnalytics.trackV2({
          category: 'summit_upsell',
          page: 'onboarding',
          action: 'screen_enter',
          element: 'goals'
        });

        jQuery('.js-snw-goals-upsell').on('click', 'a', function () {
          Strava.ExternalAnalytics.trackV2({
            category: 'summit_upsell',
            page: 'onboarding',
            action: 'click',
            element: 'goals'
          });
        });
      }
    });
  </script>
  <script>
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', function () {
        navigator.serviceWorker.register("/service_worker.js?v=dLlWydWlG8").then(function (registration) {
        }, function (err) {
          console.log('ServiceWorker registration failed: ', err);
        });
      });
    }
  </script>
  <script>
    jQuery(document).ready(function () {
      jQuery('a').each(addSegmentAttr);
      jQuery('button').each(addSegmentAttr);
      function addSegmentAttr(index, element) {
        var $element = jQuery(element);
        var data = $element.data();
        var external_analytics_event = data.segioevent;
        if (external_analytics_event && external_analytics_event.name) {
          var props = jQuery.extend({}, external_analytics_event);
          delete props.name;

          Strava.ExternalAnalytics.trackLink($element, external_analytics_event.name, props);
        }
      }

      // Scroll Tracking
      jQuery(document).one('scroll', function () {
        Strava.ExternalAnalytics.track('Page Scrolled', null, null, null);
      });
    });
  </script>
  <script>
    (function () {
      var options = { "peek_data": false, "campaign": null, "channel": "mobile web", "feature": "dashboard feed show", "data": { "strava_deeplink_url": "strava://dashboard" } }
      var peekData = options.peek_data ? options.peek_data : false;

      if (true) {
        Strava.BranchIO.data(peekData)
          .done(function (data) {
            if (data && data.has_app) {
              jQuery('#branch-button').text('열기');
            }
          });
      }

      Strava.BranchIO.createLink(options)
        .done(function (link) {
          jQuery('.js-download-app-link').attr('href', link);
        })
        .fail(function (err) {
          console.log(err);
          jQuery('#smartbanner-orion').remove();
        });
    })();
  </script>
  <script>
    jQuery(document).ready(function ($) {
      new Strava.GlobalSearch.SearchFieldController(currentAthlete);
    });
  </script>
  <script>
    // Mobile Menu transition handler
    jQuery('.collapsable-nav #container-nav')
      .on('show.bs.collapse', function () {
        jQuery('.smartbanner-content').slideUp(100);
        jQuery('html').addClass('mobile-menu-open');
      })
      .on('hidden.bs.collapse', function () {
        jQuery('.smartbanner-content').slideDown(100);
        jQuery('html').removeClass('mobile-menu-open');
      });
  </script>
  <script>
    // Dismiss function for alert messages
    jQuery('document').ready(function () {
      var dismissController = new Strava.Util.DismissController("/dashboard/dismiss_ui");
      jQuery('.message').on('click', '.dismiss', function () {
        dismissController.dismiss("");
        jQuery(this).parents('.message').slideUp('fast');
      });
    });
  </script>
  <script>
    jQuery(document).ready(function () {
      new Strava.Util.DropDownMenu('.drop-down-menu')
      jQuery('.language-pick').each(function (index) {
        jQuery(this).click(function () {
          language = jQuery(this).attr('language-code');
          expiration = new Date();
          expiration.setTime(expiration.getTime() + (1825 * 24 * 60 * 60 * 1000));
          // Reset any previously set cookie for this page
          document.cookie = 'ui_language= ; expires=Thu, 01 Jan 1970 00:00:01 GMT;'
          // Set a global cookie
          document.cookie = 'ui_language=' + language + '; expires=' + expiration + '; path=/';
          location.reload(true);
        });
      });
    });
  </script>
  <script>
    jQuery(document).ready(function () {
      jQuery('#explore-strava, #challenge-list-view, .promo-simple, .promo-fancy, .promo-overlay, .sponsor-link-section, .sponsor').on('click', 'a', function (event) {
        var link = jQuery(event.target).closest('a');
        var adzerkClickUri = link.data('adzerk-click-uri');
        if (adzerkClickUri != null) {
          jQuery.get(adzerkClickUri); // this is fire-and-forget - we don't need to wait for a successful response from Adzerk
        }
      });
    });
  </script>

  <script
    src="https://d3nn82uaxijpm6.cloudfront.net/assets/bootstrap.min-55483ca093070244e24730190b707a18467cb78d3262a0133d34b80fc82c8636.js"></script>
  <script
    src="https://d3nn82uaxijpm6.cloudfront.net/assets/strava/notifications/drop_down/manifest-075acd063186585f92edd9e56d4e329e7e2d8fbb2d25a9eac237a61a1873cc40.js"></script>
  <script>
    jQuery(function ($) {
      var mark_all_read_notifications_path = "/notifications/mark_all_read";
      var controller = new Strava.Notifications.DropDown.MarkAllReadController(mark_all_read_notifications_path);
      var view = new Strava.Notifications.DropDown.View(controller);
    })
  </script>
  <script src="https://apis.google.com/js/client.js" type="text/javascript" gapi_processed="true"></script>

  <script
    src="https://d3nn82uaxijpm6.cloudfront.net/assets/strava/invites/manifest-40822ff9267b9be03a13810859a3055831859abdd614e1222fb9d1615325c8c8.js"></script>
  <script>
    Strava.Google.CI = "541588808765.apps.googleusercontent.com";

    jQuery(document).ready(function () {
      inviteController = new Strava.Invites.InviteController(
        {
          athlete_id: 60202029,
          athlete_first_name: '윤석',
          athlete_url: 'https://www.strava.com/athletes/60202029',
          strava_logo_url: 'https://d3nn82uaxijpm6.cloudfront.net/assets/common/strava-logo-62b5d3764a6fa7a282bb2537b2a9619ba6b3fcb0ef5fcb0a431c98c003717b29.png',
          invite_link: 'https://www.strava.com/?utm_content=60202029&amp;utm_medium=facebook&amp;utm_source=member_referral'
        });

      inviteView = new Strava.Invites.InviteButtonView(inviteController, '.find-and-invite');

      if (window.location.hash === '#invite') {
        Strava.Invites.InviteLightboxView.show(inviteController);
      }

      jQuery('.drop-down-menu li').on('click', function () {
        const $this = jQuery(this);
        const element = $this.data('logElement');
        if (element) {
          const category = $this.closest('.drop-down-menu').data('logCategory');
          const page = $this.closest('.drop-down-menu').data('logPage');
          Strava.ExternalAnalytics.trackV2({
            category: category,
            page: page,
            action: 'click',
            element: element
          });
        }
      });
    });
  </script>



  <iframe scrolling="no" frameborder="0" allowtransparency="true"
    src="https://platform.twitter.com/widgets/widget_iframe.2a008290075125adde2d7b849b06a0bb.html?origin=https%3A%2F%2Fwww.strava.com"
    title="Twitter settings iframe" style="display: none;"></iframe>
</body>


















</html>