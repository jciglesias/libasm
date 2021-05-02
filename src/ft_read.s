;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/27 19:20:20 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 19:40:10 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef	__LINUX__
	%define _READ ft_read
	%define CODE 0
	%define	ERRNO __errno_location
	%define SUFFIX wrt ..plt	;for extern calls
%else
	%define _READ _ft_read
	%define CODE 0x2000003
	%define ERRNO ___error
	%define SUFFIX
%endif

global _READ

extern ERRNO

section .text

_READ:
	mov	rax, CODE
	syscall

%ifdef __LINUX__
	cmp rax, 0
	jl	.error					;jump if lower
%else
	jc	.error					;if carry == 1
%endif

.end:
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
