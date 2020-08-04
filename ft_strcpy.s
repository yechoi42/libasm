# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 14:15:29 by yechoi            #+#    #+#              #
#    Updated: 2020/08/04 14:15:32 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcpy

_ft_strcpy:
	mov	rcx, 0
	mov rbx, 0
	cmp rsi, 0
	je	exit

copy:
	mov bl, byte [rsi + rcx]
	mov byte [rdi + rcx], bl
	inc rcx
	cmp bl, 0
	je	exit
	jmp copy

exit:
	mov rax, rdi
	ret
