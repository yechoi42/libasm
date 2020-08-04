# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/23 00:57:28 by yechoi            #+#    #+#              #
#    Updated: 2020/08/04 17:38:29 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

_ft_strdup:
	push rdi
	call _ft_strlen
	mov rdi, rax
	call _malloc
	cmp rax, 0
	je exit
	pop rsi
	mov rdi, rax
	sub rsp, 8
	call _ft_strcpy
	add rsp, 8
	jmp exit

exit:
	ret
