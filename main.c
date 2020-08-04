/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: yechoi <yechoi@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/04 14:14:40 by yechoi            #+#    #+#             */
/*   Updated: 2020/08/04 17:35:30 by yechoi           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <unistd.h>
#include <stdlib.h>

void	test_ft_strlen_strdup(void)
{
	char	str[1024];

	printf(BLUE"testing ft_strlen...\n"RESET);
	printf(CYAN"[test 1]"RESET" input a string: ");
	scanf("%s", str);
	printf("libc| %lu\nyeji| %zu\n", strlen(str), ft_strlen(str));
	printf(CYAN"\n[test 2]"RESET" input an empty string: ");
	scanf("%s", str);
	printf("libc| %lu\nyeji| %zu\n", strlen(str), ft_strlen(str));
	printf(BLUE"\ntesting ft_strdup...\n"RESET);
	printf(CYAN"[test 1]"RESET" input a string: ");
	scanf("%s", str);
	printf("libc| [%s]\nyeji| [%s]\n", strdup(str), ft_strdup(str));
	printf(CYAN"\n[test 2]"RESET" input an empty string: ");
	scanf("%s", str);
	printf("libc| [%s]\nyeji| [%s]\n", strdup(str), ft_strdup(str));
}

void	test_ft_strcpy(void)
{
	char str[999];
	char str2[999];
	char *d;
	char *d2;

	printf(BLUE"\ntesting ft_strcpy...\n"RESET);
	printf(CYAN"[test 1]"RESET"\ninput a string: ");
	scanf("%s", str);
	printf("input another string: ");
	scanf("%s", str2);
	d = strdup(str);
	d2 = strdup(str2);
	printf("libc| [%s]\nyeji| [%s]\n", strcpy(str, str2), ft_strcpy(d, d2));
	free(d);
	free(d2);
	printf(CYAN"\n[test 2]"RESET"\ninput an empty string: ");
	scanf("%s", str);
	printf("input any string: ");
	scanf("%s", str2);
	d = strdup(str);
	d2 = strdup(str2);
	printf("libc| [%s]\nyeji| [%s]\n", strcpy(str, str2), ft_strcpy(d, d2));
	free(d);
	free(d2);
}

void	test_ft_strcmp(void)
{
	char str[999];
	char str2[999];
	char tmp[999];

	printf(BLUE"\ntesting ft_strcmp...\n"RESET);
	printf(CYAN"[test 1]"RESET"\ninput a string: ");
	scanf("%s", str);
	printf("input another string: ");
	scanf("%s", str2);
	printf("libc| %d\nyeji| %d\n", strcmp(str, str2), ft_strcmp(str, str2));
	printf(CYAN"\n[test 2]"RESET"\ninput an empty string: ");
	scanf("%s", str);
	printf("input any string: ");
	scanf("%s", str2);
	printf("libc| %d\nyeji| %d\n", strcmp(str, str2), ft_strcmp(str, str2));
	printf(CYAN"\n[test 3]"RESET"\ninput any string: ");
	scanf("%s", str);
	printf("input an empty string: ");
	scanf("%s", str2);
	printf("libc| %d\nyeji| %d\n", strcmp(str, str2), ft_strcmp(str, str2));
	getchar();
}

void	test_ft_write_read(void)
{
	int		fd;
	int		ret;
	int		buffsize;
	char	buff[1024];

	printf(BLUE"\ntesting ft_write and ft_read...\n"RESET);
	fd = open("./example.txt", O_CREAT | O_TRUNC | O_RDWR, 777);
	printf(CYAN"[test 1]"RESET" write down at 'example.txt'...: ");
	scanf("%[^\n]", buff);
	getchar();
	ft_write(fd, buff, ft_strlen(buff));
	close(fd);
	fd = open("./example.txt", O_RDONLY);
	printf("read what you've written in the file...\n");
	ret = ft_read(fd, buff, ft_strlen(buff));
	buff[ret] = '\0';
	printf("%s\n", buff);
	close(fd);
	printf(CYAN"\n[test2]"RESET" input invalid buffer size: ");
	scanf("%d", &buffsize);
	getchar();
	ret = ft_write(1, buff, buffsize);
	printf("ft_write's result is %d\n", ret);
	ret = ft_read(1, buff, buffsize);
	printf("ft_read's result is %d\n", ret);
}

int		main(void)
{
	test_ft_strlen_strdup();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_write_read();
	return (1);
}
