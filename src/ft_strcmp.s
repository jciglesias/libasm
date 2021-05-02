;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/27 17:24:07 by jiglesia          #+#    #+#              ;
;    Updated: 2021/04/27 20:20:24 by jiglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef	__LINUX__
	%define _STRCMP ft_strcmp
%else
	%define _STRCMP _ft_strcmp
%endif

global _STRCMP

section .text

_STRCMP:
	xor	r10, r10
	xor	r11, r11
	xor	rax, rax

.while:
	mov	al, BYTE [rdi + r10]	;move the byte to rax 8 bits
	cmp al, BYTE [rsi + r10]
	jne	.diff					;jump if no equal
	test	al, al				;same as AND
	jz	.diff					;jump if zero
	inc	r10						;r10++
	jmp .while

.diff:
	mov	r11b, BYTE [rsi + r10]	;move the byte to rax 8 bits
	sub	rax, r11	;substract rsi[r10] from rax
	ret
