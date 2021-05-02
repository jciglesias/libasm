;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/27 19:41:05 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 20:02:06 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
%ifdef	__LINUX__
	%define _STRDUP ft_strdup
	%define _STRCPY ft_strcpy
	%define _STRLEN ft_strlen
	%define M_MALLOC malloc
	%define SUFFIX wrt ..plt	;for extern calls
%else
	%define _STRDUP _ft_strdup
	%define _STRCPY _ft_strcpy
	%define _STRLEN _ft_strlen
	%define M_MALLOC _malloc
	%define SUFFIX
%endif

global _STRDUP

extern _STRLEN
extern _STRCPY
extern M_MALLOC

section .text

_STRDUP:
	call	_STRLEN
	inc		rax					;length + 1
	push	rdi
	mov		rdi, rax
	call	M_MALLOC SUFFIX
	pop		rdi
	test	rax, rax			;verify if malloc's return null
	jz		.end
	mov		rsi, rdi
	mov		rdi, rax
	call	_STRCPY

.end:
	ret
