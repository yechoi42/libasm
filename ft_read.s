# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 14:14:55 by yechoi            #+#    #+#              #
#    Updated: 2020/08/04 14:15:11 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_read
	extern ___error

_ft_read:
	mov rax, 0x2000003
	syscall
	jc _err
	ret

_err:
	push rax
	call ___error
	pop rdx
	mov [rax], rdx
	mov rax, -1
	ret
