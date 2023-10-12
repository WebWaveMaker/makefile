# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common.mk                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/23 16:28:44 by jgo               #+#    #+#              #
#    Updated: 2023/10/04 20:21:59 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

INCLUDE_DIR := config/makefile
INCLUDE_FILES := color.mk funcs.mk flags.mk rules.mk

ifndef TOPDIR
    $(error TOPDIR is not defined)
endif

# Use foreach to include multiple files
$(foreach file,$(INCLUDE_FILES),$(eval include $(TOPDIR)/$(INCLUDE_DIR)/$(file)))
