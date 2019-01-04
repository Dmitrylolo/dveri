// Callme 2.3 * NazarTokar.com * dedushka.org * Copyright 2015-2010
// Nazar Tokar @ Ukraine
// updated on 2015-10-25

function getCallmeFolder(e) { // find script folder
	var scripts = document.getElementsByTagName('script');
	for (var i = 0; i < scripts.length; i++) {
		var k = scripts[i];
		if (k.src.indexOf(e) >= 0) {
			var res = k.src.substring(0, k.src.indexOf(e));
			res = res.replace('callme/js', 'callme/');
			localStorage.setItem('callmeFolder', res);
			return res;
		}
	}
}

(function($) {

	$.getScript(getCallmeFolder('/callme.') + 'js/config.js', function() {

		var folder	= getData('callmeFolder'),
		tpl = {}, 
		cmeForm = '',
			hr = new Date().getHours(), // get usr hour
			callmeData = { // data to send
				fields: cmeData.fields,
				title: cmeData.title,
				calltime: cmeData.callTime,
				time_start: cmeData.startWork,
				time_end: cmeData.endWork,
				button: cmeData.button,
				hr: hr
			};

			$('<link>').attr ({
				type 	: 'text/css',
				rel 	: 'stylesheet',
				href 	: folder + 'templates/' + cmeData.template + '/style.css'
			}).appendTo('head'); // add css

	function replaceData(data, key, str) { // replace template
		if (!data || !key || !str) { return ''; }
		return data = data.replace((new RegExp('{{:'+key+'}}', 'gi')), str);
	}

	function rpl(e,d,r) { // replace
		if (!d) {
			var t = ['\"', '\'', '~', ';', '{', '}'];
			for (var i=0; i<t.length; i++) {
				var o = new RegExp(t[i], "g");
				e = e.replace(o, '');
			}
		} else {
			o = new RegExp(d, 'g');
			e = e.replace(o, r);
		}
		return e;
	}

	function loadHTML() { // load templates html 
		if (!tpl.length) { 
			$('#cme-form-main').find('.cme-template').each(function(){
				var e = $(this);
				tpl[ e.data('cme') ] = e.html();
				e.html('');
			});
		}
	}

	function isIE() { // check if IE
		var msie = window.navigator.userAgent.indexOf("MSIE ");
		return msie > 0 ? true : false;
	}

	function getPlaceholder(e,t) { // найти placeholder и caption
		var f = [' ', e];
		if (e.lastIndexOf('(') != '-1') { // если указан placeholder
			f[0] = e.replace(/.*\(|\)/gi, ''); // достать placeholder между скобками
			f[1] = e.substring(0, e.lastIndexOf('(')); // достать имя поля
		}
		return t == 1 ? f[0] : f[1];
	}

	$.get(folder + 'templates/form.html', function (d) {
		var keys = Object.keys(cmeData);
		keys.forEach(function(e){
			d = replaceData(d, e, cmeData[e]);
		});
		$('body').append(d);
		loadHTML();

// обработка полей для формы

var fields, fieldType, f, required, selects, data='', selectData='';

	fields = rpl(cmeData['fields'], ', ', ','); // убираем лишние запятые
	fields = rpl(fields).split(','); // создаем массив полей

	var cmeFields = $('#cme-form-main').find('.cme-fields'); // указываем блок, куда сохранять поля

	fields.forEach(function(e){
		if (e.charAt(e.length-1) == '*') {
			e = e.substring(0,e.length-1);
			required = 1;
		} else { 
			required = 0;
		}

		switch (e.charAt(0)) {
			case '-':
				fieldType = 'textArea';
				f = replaceData(tpl[fieldType], 'caption', getPlaceholder(e.substring(1,e.length), 0));
				f = replaceData(f, 'placeholder', getPlaceholder(e.substring(1,e.length), 1));
				f = required==0 ? rpl(f, 'required',  '') : f;
				break;
			case '?':
				fieldType = 'checkBox';
				f = replaceData(tpl[fieldType], 'caption', e.substring(1,e.length));
				break;
			case '!':
				fieldType = 'select';
				f = tpl[fieldType];
				selectData = ''; 
				selects = e.split('!');
				f = replaceData(f, 'caption', selects[1]);
				for (var k = 2; k < f.length; k++) {
					selectData += replaceData(tpl['selectOption'], 'option', selects[k]);
				}
				f = replaceData(f, 'selectArea', selectData);
				break;
			case '=':
				fieldType = 'textPhone';
				f = replaceData(tpl[fieldType], 'caption', getPlaceholder(e.substring(1,e.length), 0));
				f = replaceData(f, 'placeholder', getPlaceholder(e.substring(1,e.length), 1));
				f = required==0 ? rpl(f, 'required',  '') : f;
				break;
			default:
				fieldType = 'textField';
				f = replaceData(tpl[fieldType], 'caption', getPlaceholder(e,0));
				f = replaceData(f, 'placeholder', getPlaceholder(e,1));
				f = required==0 ? rpl(f, 'required',  '') : f;
		}
		data += f;
	});

	if (cmeData.callTime==1) { // время звонка
		var curHour = new Date().getHours(), hours;

		var workStart = curHour < Number(cmeData.workStart) ? Number(cmeData.workStart) : curHour;
		workStart = curHour < Number(cmeData.workEnd) ?  workStart : Number(cmeData.workStart);

		var workDay = curHour > Number(cmeData.workEnd) ? cmeData.txtTmrw : cmeData.txtToday;
		var f = replaceData(tpl.selectTime, 'txtDay', workDay);

		hours = '<option value=\'\'>~</option>';

		for (var i = workStart; i <= Number(cmeData.workEnd); i++) {
			hours += "<option value='"+i+"'>"+i+"</option>";
		}
		f = replaceData(f, 'timeStart', hours);

		hours = '<option value=\'\'>~</option>';

		var workEnd = workDay == cmeData.txtTmrw ? cmeData.workStart : curHour;
		for (var i = workStart; i <= Number(cmeData.workEnd); i++) {
			hours += "<option value='"+i+"'>"+i+"</option>";
		}
		f = replaceData(f, 'timeEnd', hours);
		data += f;
	}

jQuery(cmeFields).html(data);
cmeForm = jQuery(document).find('.cme-form');
var callmeError = 0;






});

	function dl(f,t) { // delay
		setTimeout(function(){
			eval(f+'()');
		}, t * 1000); 
	}

	function cmeMsg(form, c, t) { // set status
		var result = $(form).find('.callme-result');
		if (c&&t){
			result.html('<div class='+c+'>'+t+'</div>');			
		} else if (!c&&!t) {
			result.html('');
		}
	}

	function cmeClr() { // clear form
		$('.cme-form').find('[type=text], textarea').val('');
	} 

	function cmeHide() { // show/hide
		$(document).find('#cme-form-main').fadeOut('fast');
		$('#cme-back').fadeOut('fast');
	}

	function cmeShow(e, a) {
		cmeForm.css('position', 'absolute');
		if (cmeForm.is(':visible')) {
			cmeForm.fadeOut('fast');
			$('#cme-back').fadeOut('fast');
		} else {
			var dh = $(document).height(), // высота документа
				wh = $(window).height(),
				dw = $(window).width(); // ширина окна

					if (cmeData.center==0) {
						tp_cr = e.pageY+20;
						tp 		= dh-e.pageY;

					if (tp<300) { tp_cr=dh-280; } // близко к низу
					
					lf_cr = e.pageX-150;
					lf = dw-e.pageX;

					if (lf<300) { lf_cr=dw-350; } // близко к правому
					
					if (e.pageX<300) { lf_cr=e.pageX+20; } // близко к левому

					} else {
						lf_cr = dw/2-150;
						tp_cr = wh/2-250 + $(document).scrollTop();
					}

			if (tp_cr < 0) { 
				tp_cr = 0; 
			} 
			// если слишком близко к верху страницы
			
			cmeForm.css('left', lf_cr);
			cmeForm.css('top', tp_cr);
			$('#cme-back').css('height', $(document).height());
			$('#cme-back').fadeToggle('fast');
			cmeForm.fadeToggle('fast');
			cmeClr();
		}
	} 

	function cmeSend(e) { // send data
		var err = false, 
		allRequired = 1,
		form = $(e).closest('form');

		form.find('[type=text], textarea').each(function (){
			if ($(this).attr('required') != undefined) { allRequired = 0; }

			if ($(this).val().length < 1 && $(this).attr('required') != undefined) {
				$(this).addClass('has-error');
				err = true;
			} 
		});

		if (allRequired == 1) { 
			form.find('[type=text], textarea').each(function (){
				if ($(this).val().length < 1) {
					err = true; 
					$(this).addClass('has-error');
				}
			});
		}

		if (form.find('.cme-ct_start').find(':selected').val() == '~'){
			cmeMsg(form, 'c_error', cmeData.alertSetCallTime);
			err = true;
		}

		if (err) { 
			if (form.hasClass('cme')) {
				cmeMsg(form, 'c_error', 'Заполните все поля');
			}
			return false; 
		}

		cmeMsg(form, 'sending', cmeData.alertSending);

		var cnt = getData('callme-sent'); // load sent time

		if (!cnt) { 
			cnt = 0; 
		}

		var cs = [], os = [];

		form.find('[type=text], [type=tel], textarea').each(function() { // текстовые поля и textarea
			var e = $(this);
			if (e.val() && e.val().length > 0) {
				cs.push(e.attr('name'));
				os.push(e.val());
			}
		});	

		var cmeAttribute = getData('cmeAttribute');

		form.find('select').each(function() { // селекты
			var e = $(this);
			if (!e.hasClass('cme-ct-start') && !e.hasClass('cme-ct-finish')) { // кроме времени
				cs.push( e.attr('name') );
				os.push( e.find(':selected').text() );
			}
		});

		if ($('.cme-ct-start').find(':selected').val() > 0) { // время звонка
			cs.push( cmeData.txtCallTime );
			os.push('с '+$('.cme-ct-start').find(':selected').text()+' '+cmeData.txtTill+' '+ $('.cme-ct-finish').find(':selected').text()+' '+cmeData.txtHours);
		}

		form.find('[type=checkbox]').each(function() { // чекбоксы
			var e = $(this);
			cs.push(e.attr('name') );
			os.push(e.is(':checked') ? 'Да' : 'Нет' );
		});

		var rf = getData('cmeRef'); // источник трафика
		if (rf && rf.length>0) {
			cs.push(cmeData.mailReferrer);
			os.push(rf);
		}

		if (cmeAttribute != 'false') {
			cs.push('Атрибут ссылки');
			os.push(cmeAttribute);
		}

		cs.push(cmeData.mailUrl); // страница с запросом
		os.push(location.href);

		$.post(folder + 'lib/send.php', { 
			cs: cs,
			os: os,
			ctime: cnt,
		}, function(data, status) {
			data = JSON.parse(data);
			cmeMsg(form, data.cls, data.message);
			if (data.result == 'success') {
				setData('callme-sent', data.time);
				form.find('.cme-btn').attr('disabled', 'disabled');
				dl('cmeHide', 4);
				dl('cmeClr', 5);
			}
		});
	}

	$(document).delegate('.callme_viewform', 'click', function(e) { // click show form link 
		e.preventDefault();

		var cmeAttribute = $(this).attr('data-cme') || false;
		setData('cmeAttribute', cmeAttribute);

		cmeShow(e);
		return false;
	}); 

	$(document).delegate('.cme-cls', 'click', function(e) { // close button
		e.preventDefault();
		cmeHide();
		return false;
	});

	$(document).delegate('#cme-back', 'click', function() { // bg click
		cmeHide();
	}); 

	$(document).delegate('.cme-btn', 'click', function(e) { // отправка уведомления
		e.preventDefault();
		cmeSend($(this));
	});	

	$(document).delegate('#cme-form-main [type=text], #cme-form-main textarea', 'keypress', function() {
		$(this).removeClass('has-error');
	});

	$(document).delegate('.cme-ct-start', 'change', function() { // выбор времени звонка 
		$('.cme-ct-finish').find('option').each(function() {
			$(this).removeAttr('disabled');
		});

		var cme_h = Number($(this).find(':selected').text())+1;
		$('.cme-ct-finish').find('option').each(function(){
			if ($(this).val()<cme_h) {
				$(this).attr('disabled', 'disabled');
				$(this).prop('selected', false);
			}
		});

		$('.cme-ct-finish').css('background', '#dff0d8');
	});

	$(document).delegate('.cme-ct-finish', 'change', function() {
		$(this).css('background', '');
	});

	$(document).keyup(function(a) { // обработка esc
		if (a.keyCode==27 && cmeForm.is(':visible')) {
			cmeHide();
		} 
	});

	$(document).on('keyup', '.cme-phone', function(){
		$(this).val($(this).val().replace(/[^0-9]+/g, ''));
	});

	if (!getData('cmeRef') && (document.referrer)) { // load sent time
		setData('cmeRef', document.referrer);
	}

	function getData(e) { // get data
		return localStorage.getItem(e) || false;
	}

	function setData(e,v) { // save data
		localStorage.setItem(e, v);
	}
});

})(jQuery);