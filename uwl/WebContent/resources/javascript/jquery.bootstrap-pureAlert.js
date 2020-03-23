/*********************************************************************************************
 * PureAlert. v0.1
 * ===========================================================================================
 * Copyright 2015 Pure OpenSource.
 * Licensed under MIT (https://github.com/PureOpenSource/pureAlert/blob/master/LICENSE)
 *********************************************************************************************/

+function($){
	'use strict';
	
	var PureAlert = function(options){
		this.options = options;
		
		this.$modal = this.makeModal(options);
	}
	
	PureAlert.VERSION = 'v0.1';
	
	PureAlert.DEFIN = {
		event: {
			ok: 'ok.pure-alert',
			cancel: 'cancel.pure-alert'
		}
	}
	
	PureAlert.DEFAULTS = {
		autoShow: true,
		closeButton: true,
		useCancelButton: false,
	}
	
	PureAlert.prototype.createModalId = function(){
        var uuid = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });	
        
        var modalId = 'pure-alert-' + uuid;
        return modalId;
	}
	
	PureAlert.prototype.makeModal = function(options){
		var options = this.options;
		var modalId = this.createModalId();
		
		options.modalId = modalId;
		
		var title = options.title;
		var content = options.content ? options.content : '';
		
		// ---------------- Modal Main Div ----------------
		var $modalDiv = $('<div></div>')
			.attr('id', modalId)
			.attr('tabindex', '-1')
			.attr('role', 'dialog')
			.attr('aria-labelledby', title)
			.attr('aria-hidden', 'true')
			.attr('data-pure-altert', 'main')
			.addClass("modal fase")
			.appendTo($(document.body));

		var $modalDialogDiv = $('<div></div>')
			.addClass('modal-dialog pureAlertModal')
			.appendTo($modalDiv);
		
		var $modalContentDiv = $('<div></div>')
			.addClass('modal-content')
			.appendTo($modalDialogDiv);
		
		// ---------------- Modal Header ----------------
		var $modalHeaderDiv = $('<div></div>')
			.addClass('modal-header')
			.appendTo($modalContentDiv);
		
		// Close Header
		if(options.closeButton){
			$('<button>x</button>')
				.attr('type', 'button')
				.attr('data-pure-alert-button', 'cancel')
				.attr('aria-hidden', 'true')
				.addClass('close')
				.appendTo($modalHeaderDiv);
		}
		
		// title
		$('<h4></h4>')
			.addClass('modal-title')
			.html(title)
			.appendTo($modalHeaderDiv);
		
		// ---------------- Modal Body ----------------
		$('<div></div>')
			.addClass('modal-body')
			.css({'word-break': 'break-all'})
			.html(content)
			.appendTo($modalContentDiv);
		
		// ---------------- Modal Footer ----------------
		var $modalFooterDiv = $('<div></div>')
			.addClass('modal-footer')
			.appendTo($modalContentDiv);
		
		// Cancle Button
		if(options.useCancelButton){
			$('<button></button>')
				.attr('type', 'button')
				.attr('data-pure-alert-button', 'cancel')
				.attr('aria-hidden', 'true')
				.addClass('btn btn-default')
				.html(options.cancelBtn)
				.appendTo($modalFooterDiv);
		}
		// Ok Button
		$('<button></button>')
			.attr('type', 'button')
			.attr('data-pure-alert-button', 'ok')
			.attr('aria-hidden', 'true')
			.html(options.okBtn)
			.addClass('btn btn-primary')
			.appendTo($modalFooterDiv);
		
		/***************************************************************************/
        // Modal Default option Setting        
        var modalOption = {
            keyboard: false // ESC 키 눌렀을때 모달을 닫음
            ,backdrop: 'static' // 모달의 배경을 포함. 클릭 시 모달을 닫지 않을 시 'static'
            ,show: options.autoShow // 초기화 시 모달을 보여줍니다.
        }
        
        // 사용자 지정 정보 설정
        //$.extend(modalOption, options);        
        
        // Jquery Dialog 변수 선언
        var $modal = $('#' + modalId);
        
        // Bootstrap Modal Setting
        $modal.modal(modalOption)        
        
        // Modal의 hide가 완료된 이후 Event 실행
        $modal.on('hidden.bs.modal', function(e){
        	if($modal.data('pure-alert-click-event') === 'destroy'){
                // Modal Element 제거
            	$modal.remove();        		
        	}
        });
        
        return $modal;
	}
	
	// method
	PureAlert.prototype.show = function(){
		this.$modal.modal('show');
	}
	
	PureAlert.prototype.hide = function(){
		this.$modal.modal('hide');
	}
	
	PureAlert.prototype.destroy = function(){
		this.$modal.data('pure-alert-click-event', 'destroy');
		this.$modal.modal('hide');
	}
	
	// Button Event
	PureAlert.prototype.eventTrigger = function(type){
		var eventFunc = this.options[type];
		if(typeof eventFunc === 'function'){
			eventFunc();
		}
		
		this.$modal.trigger($.Event(PureAlert.DEFIN.event[type]));
	}
	
	
	/**
	 * Pure Alert - Plug-in Definition.
	 */
	
	$.pureAlert = function(options){
		var options = $.extend(true, {}, PureAlert.DEFAULTS, $.pureAlert.defaultName, typeof options == 'object' && options);
		if(typeof options == 'string'){
			var content = options;
			options['content'] = content;
		}
		
		var data = new PureAlert(options);
		
		data.$modal.data('pure.pureAlert', data);
		
		return data.$modal;
	};
	
	$.extend($.pureAlert, {
		alert: function(options){
			return $.pureAlert(options);
		},
		
		confirm: function(options){
			if(!options) options = {};
			options.useCancelButton = true;
			
			return $.pureAlert(options);
		},
		
		defaultName: {
			title: '알림',
			okBtn: '확인',
			cancelBtn: '취소'
		}
	});
	
	$.fn.pureAlert = function(method){
		var $this = $(this);
		
		var data = $this.data('pure.pureAlert');
		if(!data){return;}
		if(typeof method == 'string') data[method]();	
		
		return $this;
	}
	
	/**
	 * Pure Alert - Event
	 */
	
	$(document).on('click', '[data-pure-alert-button]', function(){
		var $this = $(this);
		var $modal = $this.closest('[data-pure-altert="main"]');
		
		var buttonType = $this.data('pure-alert-button');
		var data = $modal.data('pure.pureAlert');
		data['eventTrigger'](buttonType);
		
		$modal.data('pure-alert-click-event', 'destroy');
		$modal.modal('hide');
	});
	
}(jQuery);


















