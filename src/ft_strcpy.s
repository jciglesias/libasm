;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/26 17:01:34 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 18:59:35 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef	__LINUX__
	%define _STRCPY ft_strcpy
	%define _STRLEN ft_strlen
%else
	%define _STRCPY _ft_strcpy
	%define _STRLEN _ft_strlen
%endif

global _STRCPY

extern _STRLEN

section .text

ALIGN 16						;opt rep movsb 16-bytes alignment

_STRCPY:
	push	rdi					;send rdi to stack (first argument)
	push	rsi					;send rsi to stack (second argument)
	mov		rdi, rsi			;move rsi to rdi
	call	_STRLEN				;call ft_strlen
	mov		r10, rax			;move rsi length to r10
	pop		rsi					;return rsi to original value
	pop		rdi					;return rdi to original value

	cld							;clears the direction flag
	mov		rax, rdi			;move rdi to rax
	mov		rcx, r10			;move rsi length to rcx
	rep		movsb				;repeats rcx times movsb (copies 1 byte from rsi to rdi)
	mov		BYTE [rdi], 0		;add \0 to the last byte
	ret
