# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/22 00:05:10 by yechoi            #+#    #+#              #
#    Updated: 2020/05/22 00:05:13 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_ft_strlen:
	mov rax, 0
	jmp count

count:
	cmp BYTE [rdi + rax], 0 
	je	done
	inc rax
	jmp count

done:
	ret

