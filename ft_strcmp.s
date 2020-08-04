# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/22 14:54:23 by yechoi            #+#    #+#              #
#    Updated: 2020/05/23 00:10:09 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcmp

_ft_strcmp:
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	jmp compare

compare:
	mov al, byte [rdi + rcx]
	mov bl, byte [rsi + rcx]
	cmp al, bl
	jne different
	je	same

different:
	sub rax, rbx
	ret

same:
	cmp al, 0
	je 	exit
	inc rcx
	jmp compare

exit:
	mov rax, 0
	ret
