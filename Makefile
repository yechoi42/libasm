# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/22 22:50:53 by yechoi            #+#    #+#              #
#    Updated: 2020/08/04 17:36:43 by yechoi           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libasm.a

SRCS	= ft_strlen.s \
		  ft_strcpy.s \
		  ft_strcmp.s \
		  ft_strdup.s \
		  ft_write.s \
		  ft_read.s \

OBJS	= $(SRCS:.s=.o)

TEST	= test

TXT		= example.txt

%.o		: %.s
	nasm -f macho64 $<

all		: $(NAME)

$(NAME)	: $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean	: 
	rm -rf $(OBJS)

fclean	: clean
	rm -rf $(NAME) $(TEST) $(TXT) $(NAME)

re		: fclean all

test	: re
	gcc main.c -o test -L. -lasm
