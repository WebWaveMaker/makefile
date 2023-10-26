# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sanghwal <sanghwal@student.42seoul.kr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/23 16:28:44 by jgo               #+#    #+#              #
#    Updated: 2023/10/26 18:31:22 by sanghwal         ###   ########seoul.kr   #
#                                                                              #
# **************************************************************************** #

INCLUDE_DIR := config/makefile
INCLUDE_FILES := color.mk funcs.mk rules.mk flags.mk

ifndef TOPDIR
    $(error TOPDIR is not defined)
endif

# Use foreach to include multiple files
$(foreach file,$(INCLUDE_FILES),$(eval include $(TOPDIR)/$(INCLUDE_DIR)/$(file)))
