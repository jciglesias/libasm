;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/26 16:10:33 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 18:59:47 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef	__LINUX__
	%define _STRLEN ft_strlen
%else
	%define _STRLEN _ft_strlen
%endif

global _STRLEN

section .text

_STRLEN:
	xor rax, rax

.while:
	cmp	BYTE[rdi + rax], 0
	je	.return
	inc	rax
	jmp	.while

.return:
	ret
