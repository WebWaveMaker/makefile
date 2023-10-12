# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    flags.mk                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/15 10:06:18 by jgo               #+#    #+#              #
#    Updated: 2023/10/04 19:38:29 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# thread
ifdef JOB
	J := $(if $(findstring $(JOB), 123456789),-j$(JOB),)
endif

# VERBOSE
ifdef V
	CXXFLAGS += -DV=true
endif

# debug
ifdef DEBUG
	CXXFLAGS := -std=$(STANDARD) -g3 -MMD -MP
endif

# just compile
ifdef JUST
	CXXFLAGS := -std=$(STANDARD) -MMD -MP
endif

# address
ifdef ADDR
	CXXFLAGS += -fsanitize=address
endif

# data race
ifdef RACE
	CXXFLAGS := -fsanitize=thread -MMD -MP -g3
	LDFLAGS += -fsanitize=thread -g3
endif

ifdef SHADOW
	CXXFLAGS += -Wshadow
	LDFLAGS += -Wshadow
endif
