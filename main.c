/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jiglesia <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/26 16:48:28 by jiglesia          #+#    #+#             */
/*   Updated: 2021/05/02 14:01:54 by jiglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void clear_buffer(char *buffer, int size)
{
	int i;

	i = 0;
	while (i < size)
		buffer[i++] = 0;
}

int	main(void)
{
	char	dest[20];
	int		fd;
	char	buff1[891];
	int		ret = 1;
	char	*x;

	printf("ft_strlen(\"hello world\")\t= %ld\n", ft_strlen("hello world"));
	printf("strlen(\"hello world\")\t\t= %ld\n", strlen("hello world"));
	ft_strcpy(dest, "line to copy");
	printf("ft_strcpy\t= %s\n", dest);
	strcpy(dest, "line to copy");
	printf("strcpy\t\t= %s\n", dest);
	printf("ft_strcmp\t= %d\n", ft_strcmp(dest, ""));
	printf("strcmp\t\t= %d\n", strcmp(dest, ""));
	printf("ft_write\t= %ld\n", ft_write(1, "hola ", 5));
	printf("write\t= %ld\n", write(1, "hola ", 5));
	printf("%-20s: \n", "header main.c | libc ");
	fd = open("main.c", O_RDONLY);
	ret = read(fd, buff1, 890);
	buff1[ret] = 0;
	printf("[return : %d]\n|%s|\n\n", ret, buff1);
	close(fd);
	fd = open("main.c", O_RDONLY);
	clear_buffer(buff1, 891);
	printf("%-20s: \n", "header main.c | libasm ");
	ret = ft_read(fd, buff1, 890);
	buff1[ret] = 0;
	printf("[return : %d]\n|%s|\n\n", ret, buff1);
	clear_buffer(buff1, 891);
	close(fd);
	x = ft_strdup("duplicate");
	printf("ft_strdup\t= %s\n", x);
	free(x);
	x = strdup("duplicate");
	printf("strdup\t\t= %s\n", x);
	free(x);
	return (0);
}
