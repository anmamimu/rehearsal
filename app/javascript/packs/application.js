// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require audiojs

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "bootstrap";
import "jquery";
import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application.scss";



Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

/*--------------------------------------------------------------------------*
 *  
 *  footerFixed.js
 *  
 *  MIT-style license. 
 *  
 *  2007 Kazuma Nishihata [to-R]
 *  http://blog.webcreativepark.net
 *  
 *--------------------------------------------------------------------------*/

new function(){
	
	var footerId = "footer";
	//メイン
	function footerFixed(){
		//ドキュメントの高さ
		var dh = document.getElementsByTagName("body")[0].clientHeight;
		//フッターのtopからの位置
		document.getElementById(footerId).style.top = "0px";
		var ft = document.getElementById(footerId).offsetTop;
		//フッターの高さ
		var fh = document.getElementById(footerId).offsetHeight;
		//ウィンドウの高さ
		if (window.innerHeight){
			var wh = window.innerHeight;
		}else if(document.documentElement && document.documentElement.clientHeight != 0){
			var wh = document.documentElement.clientHeight;
		}
		if(ft+fh<wh){
			document.getElementById(footerId).style.position = "relative";
			document.getElementById(footerId).style.top = (wh-fh-ft-1)+"px";
		}
	}
	
	//文字サイズ
	function checkFontSize(func){
	
		//判定要素の追加	
		var e = document.createElement("div");
		var s = document.createTextNode("S");
		e.appendChild(s);
		e.style.visibility="hidden"
		e.style.position="absolute"
		e.style.top="0"
		document.body.appendChild(e);
		var defHeight = e.offsetHeight;
		
		//判定関数
		function checkBoxSize(){
			if(defHeight != e.offsetHeight){
				func();
				defHeight= e.offsetHeight;
			}
		}
		setInterval(checkBoxSize,1000)
	}
	
	//イベントリスナー
	function addEvent(elm,listener,fn){
		try{
			elm.addEventListener(listener,fn,false);
		}catch(e){
			elm.attachEvent("on"+listener,fn);
		}
	}

	addEvent(window,"load",footerFixed);
	addEvent(window,"load",function(){
		checkFontSize(footerFixed);
	});
	addEvent(window,"resize",footerFixed);
	
}