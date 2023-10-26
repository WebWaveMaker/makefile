# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    rules.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.fr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/05 14:02:20 by jgo               #+#    #+#              #
#    Updated: 2023/10/27 00:04:26 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.DEFAULT_GOAL 	:= all
PROJECT_NAME	:= webserv

CXX				:= c++
STANDARD		:= c++98
CXXFLAGS		:= -std=$(STANDARD) -Wall -Wextra -Werror -MMD -MP
CPPFLAGS 		:= $(patsubst %,-I%,$(filter-out $(TOPDIR)/src $(TOPDIR)/src/lib, $(shell find $(TOPDIR)/src $(TOPDIR)/inc -type d)))

ifeq ($(shell uname), Linux)
	CPPFLAGS += -I/usr/include/kqueue
	LDFLAGS += -lkqueue
endif