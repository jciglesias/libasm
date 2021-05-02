;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/27 18:14:56 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 19:58:05 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef	__LINUX__
	%define _WRITE ft_write
	%define CODE 1
	%define	ERRNO __errno_location
	%define SUFFIX wrt ..plt	;for extern calls
%else
	%define _WRITE _ft_write
	%define CODE 0x2000004
	%define ERRNO ___error
	%define SUFFIX
%endif

global _WRITE

extern ERRNO

section .text

_WRITE:
	mov	rax, CODE
	syscall

%ifdef __LINUX__
	cmp rax, 0
	jl	.error					;jump if lower
%else
	jc	.error					;if carry == 1
%endif

.end:
	mov	rax, rdx
	ret

.error:
%ifdef __LINUX__
	neg	rax
%endif
	push	rax
	call	ERRNO SUFFIX
	pop		qword [rax]
	mov		rax, -1
	ret
