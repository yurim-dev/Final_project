// TTS 자바스크립트 코드(백업용)
// 자바스크립트 자체 음성 합성 모듈을 불러옴
var synth = window.speechSynthesis;

// 읽어올 텍스트를 저장할 변수들
var inputForm = document.getElementsByClassName("readForm");
var textInput = document.getElementById("manual1");
// 음성 언어: 한국어
var lang = 'ko-KR';
// 속도: 1
var rateValue = 1;
// 목소리 높낮이: 1
var pitchValue = 1;
// 글자를 하나씩 읽어와 합성할 변수
var voices = [];

// 재생 버튼을 누를 때 문장이 재생됨
inputForm.onsubmit = function(event) {
	var startTime = performance.now();
	// submit을 누를때 페이지가 새로고침 되는 것을 방지함
	event.preventDefault();
	var readThis = new SpeechSynthesisUtterance(textInput.value);
	// 글자마다 언어 설정하기
    for(var i = 0; i < voices.length; i++) {
    	readThis.voice = lang;
    }
    readThis.pitch = pitchValue;
    readThis.rate = rateValue;

    synth.speak(readThis);
}